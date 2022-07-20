#!/usr/bin/env ruby

require 'test/unit'
require_relative '01-split_text_with_dict'

class SplitTextWithDictTest < Test::Unit::TestCase

  def test_1
    text = "abc"
    dict = [ "a", "b", "c" ]
    assert_equal [ "a", "b", "c" ], split_text_with_dict(text, dict)[0]
  end

  def _test_2
    text = "abd"
    dict = [ "a", "b", "c" ]
    assert_equal [], split_text_with_dict(text, dict)[0]
  end

  def _test_3
    text = "abc"
    dict = [ "a", "bc", "c" ]
    assert_equal [ "a", "bc" ], split_text_with_dict(text, dict)[0]
  end
end
