#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative '../lib/math/monomio'

class MonomioTopolTest < Minitest::Test
  def setup
    @m = []
    @m << [ Monomio.new(5, 2), Monomio.new(-3, 1), Monomio.new(0, 0) ]
    @m << [ Monomio.new(6, 3), Monomio.new(-2, 2), Monomio.new(0, 0) ]
    @m << [ Monomio.new(7, 4), Monomio.new(0, 2), Monomio.new(-1, 0) ]
    @m << [ Monomio.new(8, 5), Monomio.new(-4, 3), Monomio.new(1, 0) ]
  end

  def test_pol_neg_1
    pol = Monomio.new(-1,0).to_pol
    assert_equal "-1", pol.to_s
  end

end
