#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative '../lib/monomio'

class MonomioMulTest < Minitest::Test
  def setup
    @m = []
    @m << [ Monomio.new(5, 0), Monomio.new(-3, 0), Monomio.new(0, 0) ]
    @m << [ Monomio.new(6, 1), Monomio.new(-2, 1), Monomio.new(0, 1) ]
    @m << [ Monomio.new(7, 2), Monomio.new(-1, 2), Monomio.new(0, 2) ]
    @m << [ Monomio.new(8, 3), Monomio.new(-4, 3), Monomio.new(0, 3) ]
  end

  def test_m0_mul
    m = @m[0]
    r = m[0] * m[1]
    assert_equal '-15', r.to_s
    r = m[1] * m[2]
    assert_equal '', r.to_s
    r = m[2] * m[0]
    assert_equal '', r.to_s
  end

  def test_m1_mul
    m = @m[2]
    r = m[0] * m[1]
    assert_equal '-7x^4', r.to_s
    r = m[1] * m[2]
    assert_equal '', r.to_s
    r = m[2] * m[0]
    assert_equal '', r.to_s
  end

  def test_m2_mul
    m = @m[1]
    r = m[0] * m[1]
    assert_equal '-12x^2', r.to_s
    r = m[1] * m[2]
    assert_equal '', r.to_s
    r = m[2] * m[0]
    assert_equal '', r.to_s
  end
end
