# frozen_string_literal: true

module Aoc
  module Cli
    class ConsoleContext
      def initialize(year)
        @year = year
      end

      def reload!
        CodeLoader.reload
      end

      def aoc(day = nil, part = nil, year: @year)
        reload!
        puts Aoc::Runner.new(year).run(day, part)
      rescue Aoc::AocError => e
        puts e.message
      end

      def self.to_s
        'AOC'
      end
    end
  end
end
