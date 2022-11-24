# frozen_string_literal: true

module Aoc
  module Cli
    class Test < BaseCommand
      desc 'Run tests for the challenges'

      def call(year:, **)
        require_relative '../../../test/test_helper'
        require_relative "../../../test/aoc#{year}_test.rb"
      end
    end
  end
end
