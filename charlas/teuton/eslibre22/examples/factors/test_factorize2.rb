#!/usr/bin/env ruby

require 'test/unit'
require_relative 'mymath.rb'

class TestFactor < Test::Unit::TestCase

  def test_factorize_1
    assert_equal [], MyMath.factorize(1)
  end

  def test_factorize_2_to_3
    assert_equal [2], MyMath.factorize(2)
    assert_equal [3], MyMath.factorize(3)
  end

  def test_factorize_4_to_9
    assert_equal [2, 2], MyMath.factorize(4)
    assert_equal [5], MyMath.factorize(5)
    assert_equal [2, 3], MyMath.factorize(6)
    assert_equal [7], MyMath.factorize(7)
    assert_equal [2, 2, 2], MyMath.factorize(8)
    assert_equal [3, 3], MyMath.factorize(9)
    assert_equal [2, 5], MyMath.factorize(10)
  end

  def test_factorize_x
    assert_equal [2, 5, 5, 7, 11, 11], MyMath.factorize(2*5*5*7*11*11)
  end
end
