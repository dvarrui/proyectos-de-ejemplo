#!/usr/bin/env ruby

require 'test/unit'
require_relative '01-split_text_with_dict'

class SplitTextWithDictTest < Test::Unit::TestCase

  def test_1
    text = "abc"
    dict = [ "a", "b", "c" ]
    assert_equal [ "a", "b", "c" ], split_text_with_dict(text, dict)[0]
  end

  def test_2
    text = "abc"
    dict = [ "a", "ab", "bc", "c" ]
    assert_equal [ "a", "bc" ], split_text_with_dict(text, dict)[0]
    assert_equal [ "ab", "c" ], split_text_with_dict(text, dict)[1]
  end
end
