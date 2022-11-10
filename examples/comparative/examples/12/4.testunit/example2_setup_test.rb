#!/usr/bin/ruby

require "test/unit"

class Example2SetupTest < Test::Unit::TestCase
  def setup
    @input_value = 18
  end

  def test_divisible_by_3
    assert(@input_value % 3 == 0)
  end

  def test_divisible_by_6
    assert(@input_value % 6 == 0)
  end
end
