# frozen_string_literal: true

module Aoc
  AocError = Class.new(RuntimeError)

  InputError = Class.new(AocError)

  class DayMissingError < AocError
    attr_reader :year, :day

    def initialize(year, day)
      super("Missing implementation file for year #{year} day #{day}")
      @year = year
      @day = day
    end
  end

  class InputFileMissingError < AocError
    attr_reader :year, :day

    def initialize(year, day)
      super("Missing input file for year #{year} day #{day}")
      @year = year
      @day = day
    end
  end
end
