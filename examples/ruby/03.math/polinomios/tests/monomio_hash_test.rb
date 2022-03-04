#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative '../lib/math/monomio'

class MonomioHashTest < Minitest::Test
  def setup
    @m = []
    @m << [ Monomio.new(5, 0), Monomio.new(-3, 0), Monomio.new(0, 0) ]
    @m << [ Monomio.new(6, 1), Monomio.new(-2, 1), Monomio.new(0, 1) ]
    @m << [ Monomio.new(7, 2), Monomio.new(-1, 2), Monomio.new(0, 2) ]
    @m << [ Monomio.new(8, 3), Monomio.new(-4, 3), Monomio.new(0, 3) ]
  end

  def test_m0_to_h
    m = @m[0]
    assert_equal ({0=>5}), m[0].to_h
    assert_equal ({0=>-3}), m[1].to_h
    assert_equal ({0=>0}), m[2].to_h
  end

  def test_m1_to_h
    m = @m[1]
    assert_equal ({1=>6}), m[0].to_h
    assert_equal ({1=>-2}), m[1].to_h
    assert_equal ({1=>0}), m[2].to_h
  end

  def test_m2_to_h
    m = @m[2]
    assert_equal ({2=>7}), m[0].to_h
    assert_equal ({2=>-1}), m[1].to_h
    assert_equal ({2=>0}), m[2].to_h
  end

  def test_m3_to_h
    m = @m[3]
    assert_equal ({3=>8}), m[0].to_h
    assert_equal ({3=>-4}), m[1].to_h
    assert_equal ({3=>0}), m[2].to_h
  end

end
