#!/usr/bin/ruby

class MyArrayBase < Array
  def add(other)
    push other
  end

  def add_all(others)
    others.each do |i|
      add i
    end
  end
end
