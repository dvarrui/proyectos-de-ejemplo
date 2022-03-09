#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative '../lib/combination'
require_relative '../lib/apply'

class RuleTest < Minitest::Test

  def test_in_position
    combi = Combination.new(6, 8, 2)
    combi0 = Combination.new(0, 0, 0)
    combi1 = Combination.new(0, 0, 2)
    combi2 = Combination.new(0, 8, 2)
    combi3 = Combination.new(6, 8, 2)

    assert_equal 0, Apply.evaluate_in_position(combi, combi0)
    assert_equal 1, Apply.evaluate_in_position(combi, combi1)
    assert_equal 2, Apply.evaluate_in_position(combi, combi2)
    assert_equal 3, Apply.evaluate_in_position(combi, combi3)
  end
end
