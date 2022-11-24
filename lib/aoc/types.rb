# frozen_string_literal: true

require 'dry-types'

module Aoc
  module Types
    include Dry.Types

    Year = Types::Coercible::Integer.constrained(gteq: 2012)
    Day = Types::Coercible::Integer.constrained(included_in: 1..25)
    Part = Types::Coercible::Symbol.enum(:a, :b)
  end
end
