#!/usr/bin/ruby
require "test/unit"

class CompareTest < Test::Unit::TestCase
  def test_greater
     num = 100
     assert_equal(num > 100, false)
  end

  def test_greater_equal
    num = 100
     assert(num >= 100)
  end

  def test_less
    num = 100
    assert(num < 200)
  end
end
