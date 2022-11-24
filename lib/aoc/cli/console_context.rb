# frozen_string_literal: true

module Aoc
  module Cli
    class ConsoleContext
      attr_reader :year

      def initialize(year)
        @year = year
      end

      def reload!
        CodeLoader.reload
      end

      def aoc(day = nil, part = nil)
        reload!

        aoc = Aoc::Runner.new(year)

        result =
          if day.nil?
            aoc.run_all
          elsif part.nil?
            aoc.run_day(day)
          else
            aoc.run_challenge(day, part)
          end

        puts result
      rescue Aoc::AocError => e
        puts e.message
      end

      def self.to_s
        "AOC"
      end
    end
  end
end
