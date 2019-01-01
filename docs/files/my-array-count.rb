#!/usr/bin/ruby

require_relative 'my-array-base'

class MyArrayCount < MyArrayBase
  def initialize
    @count = 0
  end

  def add_all(others)
    super others
    @count += others.size
  end

  def to_s
    s = "count = #{@count} with #{super.to_s}"
  end
end
