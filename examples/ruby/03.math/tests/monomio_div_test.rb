#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative '../lib/monomio'

class MonomioDivTest < Minitest::Test
  def setup
    @m = []
    @m << [ Monomio.new(15, 0), Monomio.new(-3, 0), Monomio.new(1, 0) ]
    @m << [ Monomio.new(6, 1), Monomio.new(-2, 0), Monomio.new(1, 1) ]
    @m << [ Monomio.new(7, 2), Monomio.new(-1, 2), Monomio.new(1, 2) ]
    @m << [ Monomio.new(8, 3), Monomio.new(-4, 3), Monomio.new(1, 3) ]
  end

  def test_m0_div
    m = @m[0]
    r = m[0] / m[1]
    assert_equal '-5', r.to_s
    r = m[2] / m[2]
    assert_equal '1', r.to_s
  end

  def test_m1_div
    m = @m[1]
    r = m[0] / m[1]
    assert_equal '-3x', r.to_s
    r = m[2] / m[2]
    assert_equal '1', r.to_s
  end

  def test_m2_div
    m = @m[2]
    r = m[0] / m[1]
    assert_equal '-7', r.to_s
    r = m[2] / m[2]
    assert_equal '1', r.to_s
  end
end
