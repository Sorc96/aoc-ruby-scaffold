# frozen_string_literal: true

module Aoc
  module Cli
    class Test < BaseCommand
      desc 'Run tests for the challenges'

      def call(year:, **)
        Zeitwerk::Loader.new.tap do |loader|
          loader.push_dir("#{__dir__}/../../../test")
          loader.setup
          loader.eager_load
        end

        Minitest.run(["-n /Aoc#{year}Test/"])
      end
    end
  end
end
