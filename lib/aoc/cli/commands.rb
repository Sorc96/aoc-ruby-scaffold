# frozen_string_literal: true

require 'dry/cli'

module Aoc
  module Cli
    module Commands
      extend Dry::CLI::Registry

      register 'run', Aoc::Cli::Run
      register 'console', Aoc::Cli::Console
      register 'test', Aoc::Cli::Test
    end
  end
end
