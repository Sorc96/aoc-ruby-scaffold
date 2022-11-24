# frozen_string_literal: true

require 'minitest/autorun'

AocTest = Object.new

def AocTest.define(year, cases)
  test_klass = Class.new(Minitest::Test) do
    cases.each do |(day, part), expected|
      define_method "test_aoc_#{day}_#{part}" do
        assert_equal expected, Aoc::Runner.new(year).run_raw(day, part)
      end
    end
  end

  Object.const_set("AocTest#{year}", test_klass)
end
