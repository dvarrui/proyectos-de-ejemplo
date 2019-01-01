#!/usr/bin/ruby

require_relative 'my-array-base'

class MyArrayCount < MyArrayBase
  def initialize
    @count = 0
  end

  def add(other)
    super other
    @count += 1
  end

  def to_s
    s = "count = #{@count} with #{super.to_s}"
  end
end
