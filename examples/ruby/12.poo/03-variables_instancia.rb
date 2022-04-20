#!/usr/bin/env ruby 

class InstTest
  def set_foo(n)
    @foo = n
  end

  def set_bar(n)
    @bar = n
  end

  def info
    "#{self} foo=#{@foo} bar=#{@bar}"
  end
end

i = InstTest.new
puts i
i.info

puts " defined? " + defined? i

i.set_foo(2)
puts i.info

i.set_bar(4)
puts i.info

