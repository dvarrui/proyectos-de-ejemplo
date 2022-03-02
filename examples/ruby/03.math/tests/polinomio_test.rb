#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative '../lib/polinomio'

class PoliomioTest < Minitest::Test
  def setup

    @p = []
    @p << Polinomio.new( [ Monomio.new(5, 3), Monomio.new(-3, 0) ])
    @p << Polinomio.new( [ Monomio.new(6, 2), Monomio.new(-2, 1) ])
    @p << Polinomio.new( [ Monomio.new(7, 2), Monomio.new(-1, 0) ])
    @p << Polinomio.new( [ Monomio.new(8, 3), Monomio.new(-4, 2) ])
  end

  def test_to_s
    p = @p
    assert_equal "+5x^3-3", p[0].to_s
    assert_equal "+3x^2-2x", p[1].to_s
    assert_equal "+7x2-1", p[2].to_s
    assert_equal "+8x3-4x2", p[3].to_s
  end

  def test_to_h
    p = @p
    assert_equal ({ 3=>5, 0=>-3 }), p[0].to_h
    assert_equal ({ 2=>3, 1=>-2 }), p[1].to_h
    assert_equal ({ 2=>7, 0=>-1 }), p[2].to_h
    assert_equal ({ 3=>8, 2=>-4 }), p[3].to_h
  end
end
