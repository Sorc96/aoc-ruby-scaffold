# frozen_string_literal: true

require 'dry/cli'

module Aoc
  module Cli
    module Commands
      extend Dry::CLI::Registry

      register 'run', Aoc::Cli::Run, aliases: %w[r]
      register 'console', Aoc::Cli::Console, aliases: %w[c]
      register 'test', Aoc::Cli::Test, aliases: %w[t]
      register 'watch', Aoc::Cli::Watch, aliases: %w[w]
    end
  end
end
