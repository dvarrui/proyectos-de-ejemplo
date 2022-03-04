#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative '../lib/math/monomio'

class PolinomioTosTest < Minitest::Test
  def setup
    @m = []
    @m << [ Monomio.new(5, 2), Monomio.new(-3, 1), Monomio.new(0, 0) ]
    @m << [ Monomio.new(6, 3), Monomio.new(-2, 2), Monomio.new(0, 0) ]
    @m << [ Monomio.new(7, 4), Monomio.new(0, 2), Monomio.new(-1, 0) ]
    @m << [ Monomio.new(8, 5), Monomio.new(-4, 3), Monomio.new(1, 0) ]
  end

  def test_pol0_to_s
    pol = Polinomio.new(@m[0])
    assert_equal "+5x^2-3x", pol.to_s
  end

  def test_pol1_to_s
    pol = Polinomio.new(@m[1])
    assert_equal "+6x^3-2x^2", pol.to_s
  end

  def test_pol2_to_s
    pol = Polinomio.new(@m[2])
    assert_equal "+7x^4-1", pol.to_s
  end

  def test_pol3_to_s
    pol = Polinomio.new(@m[3])
    assert_equal "+8x^5-4x^3+1", pol.to_s
  end

end
