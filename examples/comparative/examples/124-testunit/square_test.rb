#!/usr/bin/ruby

require "test/unit"

class SquareTest < Test::Unit::TestCase
  def test_sqrt
    num = 25
    assert(Math.sqrt(num) == 5)
  end

  def testsquare
    num = 7
    assert(7*7 == 49)
  end

  def tesequality
    assert(10 == 11)
  end
end
