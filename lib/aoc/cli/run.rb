# frozen_string_literal: true

module Aoc
  module Cli
    class Run < BaseCommand
      desc 'Run the challenges and display results'

      argument :day, desc: "Day of the challenge. Leave blank to run all days"
      argument :part, desc: "Part 'a' or 'b'. leave blank to run the entire day"

      example [
        '            # Runs all challenges',
        '<day>       # Runs both challenges of a single day',
        '<day> <a|b> # Runs a single challenge'
      ]

      def call(day: nil, part: nil, year:, **)
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
    end
  end
end
