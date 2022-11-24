# frozen_string_literal: true

require 'date'

module Aoc
  module Cli
    class BaseCommand < Dry::CLI::Command
      option :year, default: Date.today.year, desc: 'Year of the challenge'
    end
  end
end
