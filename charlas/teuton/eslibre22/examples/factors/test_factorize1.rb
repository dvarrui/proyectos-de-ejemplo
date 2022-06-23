#!/usr/bin/env ruby

require 'test/unit'
require_relative 'mymath.rb'

class TestFactor < Test::Unit::TestCase

  def test_factorize_34
    assert_equal [2, 17], MyMath.factorize(34)
    assert_equal [2, 2, 2], MyMath.factorize(8)
  end

end
