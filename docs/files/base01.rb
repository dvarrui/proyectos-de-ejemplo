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

a = MyArrayBase.new
puts "[ DO ] #{a.class.to_s} => add 1, add 2, add 3"
a.add 1
a.add 2
a.add 3
puts "[INFO] #{a.to_s}"

puts "[ DO ] #{a.class.to_s} => add_all [4,5,6]"
a.add_all [4, 5, 6]
puts "[INFO] #{a.to_s}"
