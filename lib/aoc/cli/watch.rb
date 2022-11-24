# frozen_string_literal: true

module Aoc
  module Cli
    class Watch < BaseCommand
      desc 'Automatically run solutions when the files change.'

      def call(year:, **)
        require 'listen'

        listener(year).start
        puts "Watching for changes in year #{year} solutions."
        sleep
      end

      private

      def listener(year)
        Listen.to("#{__dir__}/../../aoc#{year}") do |modified, added, _removed|
          CodeLoader.reload
          aoc = Aoc::Runner.new(year)

          (modified + added).each do |file|
            day = File.basename(file).delete_prefix('day').delete_suffix('.rb')
            puts aoc.run_day(day)
          end
        end
      end
    end
  end
end
