#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative '../lib/math/monomio'

class MonomioArrayTest < Minitest::Test
  def setup
    @m = []
    @m << [ Monomio.new(5, 0), Monomio.new(-3, 0), Monomio.new(0, 0) ]
    @m << [ Monomio.new(6, 1), Monomio.new(-2, 1), Monomio.new(0, 1) ]
    @m << [ Monomio.new(7, 2), Monomio.new(-1, 2), Monomio.new(0, 2) ]
    @m << [ Monomio.new(8, 3), Monomio.new(-4, 3), Monomio.new(0, 3) ]
  end

  def test_m0_to_a
    m = @m[0]
    assert_equal [5, 0], m[0].to_a
    assert_equal [-3, 0], m[1].to_a
    assert_equal [0, 0], m[2].to_a
  end

  def test_m1_to_a
    m = @m[1]
    assert_equal [6, 1], m[0].to_a
    assert_equal [-2, 1], m[1].to_a
    assert_equal [0, 1], m[2].to_a
  end

  def test_m2_to_a
    m = @m[2]
    assert_equal [7, 2], m[0].to_a
    assert_equal [-1, 2], m[1].to_a
    assert_equal [0, 2], m[2].to_a
  end

  def test_m3_to_a
    m = @m[3]
    assert_equal [8, 3], m[0].to_a
    assert_equal [-4, 3], m[1].to_a
    assert_equal [0, 3], m[2].to_a
  end

end
