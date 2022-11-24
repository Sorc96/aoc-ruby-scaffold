# frozen_string_literal: true

require_relative 'errors'

module Aoc
  class Runner
    def initialize(year)
      @year = Aoc::Types::Year[year]
    rescue Dry::Types::CoercionError
      raise InputError.new("Invalid year #{year}")
    end

    def run(day = nil, part = nil)
      if day.nil?
        run_all
      elsif part.nil?
        run_day(day)
      else
        run_challenge(day, part)
      end
    end

    def run_all
      result = []
      (1..24).each { |day| result << run_day(day) }
      result.join("\n")
    rescue DayMissingError
      result.join("\n")
    end

    def run_day(day)
      [run_challenge(day, 'a'), run_challenge(day, 'b')].join("\n")
    end

    def run_challenge(day, part)
      "#{day.to_s.rjust(2, ' ')} #{part}: #{run_raw(day, part)}"
    end

    def run_raw(day, part)
      begin
        day = Aoc::Types::Day[day]
        part = Aoc::Types::Part[part]
      rescue Dry::Types::CoercionError => e
        raise InputError.new(e.message)
      end

      klass_for_day(day)
        .new(input_for_day(day))
        .send("run_#{part}")
    end

    private

    def klass_for_day(day)
      Object.const_get("Aoc#{@year}::Day#{day}")
    rescue NameError
      raise DayMissingError.new(@year, day)
    end

    def input_for_day(day)
      File.read(File.join(__dir__, '..', '..', 'input', @year.to_s, day.to_s))
    rescue Errno::ENOENT
      raise InputFileMissingError.new(@year, day)
    end
  end
end
