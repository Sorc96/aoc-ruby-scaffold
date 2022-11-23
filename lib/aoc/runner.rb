# frozen_string_literal: true

require_relative 'errors'

module Aoc
  class Runner
    def initialize(year)
      @year = Types::Coercible::Integer[year]
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
      begin
        day = Types::Day[day]
        part = Types::Part[part]
      rescue Dry::Types::CoercionError => e
        raise InputError.new(e.message)
      end

      result = klass_for_day(day)
        .new(input_for_day(day))
        .send("run_#{part}")

      "#{day.to_s.rjust(2, ' ')} #{part}: #{result}"
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
