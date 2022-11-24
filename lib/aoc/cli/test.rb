# frozen_string_literal: true

module Aoc
  module Cli
    class Test < BaseCommand
      desc 'Run tests for the challenges'

      argument :day, desc: 'Run tests for a single day. Leave blank to run all tests.'

      def call(year:, day: nil, **)
        Zeitwerk::Loader.new.tap do |loader|
          loader.push_dir("#{__dir__}/../../../test")
          loader.setup
          loader.eager_load
        end

        Minitest.run(["-n /Aoc#{year}Test.test_aoc_#{day}/"])
      end
    end
  end
end
