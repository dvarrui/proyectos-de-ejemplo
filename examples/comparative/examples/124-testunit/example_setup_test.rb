#!/usr/bin/ruby

require "test/unit"

class ExampleSetupTest < Test::Unit::TestCase
  def setup
    @input_value1 = 18
  end

  def input_value2
    18
  end

  def test_divisible_by_3
    assert(@input_value1 % 3 == 0)
  end

  def test_divisible_by_6
    assert(input_value2 % 6 == 0)
  end
end
