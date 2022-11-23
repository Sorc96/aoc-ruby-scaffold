# frozen_string_literal: true

require 'dry-types'

module Aoc
  module Types
    include Dry.Types

    Day = Types::Coercible::Integer.constrained(included_in: 1..24)
    Part = Types::String.enum('a', 'b')
  end
end
