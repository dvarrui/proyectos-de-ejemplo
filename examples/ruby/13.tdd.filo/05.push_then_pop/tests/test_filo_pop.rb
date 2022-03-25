#!/usr/bin/ruby

require 'test/unit'
require_relative '../lib/filo'

class FiloPopTest < Test::Unit::TestCase

  def test_new_pop
    filo = Filo.new
    assert_equal nil, filo.pop
  end

  def test_push_element_and_pop_element
    filo = Filo.new
    filo.push(42)
    assert_equal 42, filo.pop
  end
end
