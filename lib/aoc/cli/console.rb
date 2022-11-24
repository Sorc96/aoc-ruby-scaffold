# frozen_string_literal: true

module Aoc
  module Cli
    class Console < BaseCommand
      desc 'Start the interactive console'

      def call(year:, **)
        require 'pry'

        ConsoleContext.new(year).pry
      end
    end
  end
end
