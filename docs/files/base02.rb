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

class MyArrayCounter < MyArrayBase
  @count = 0

  def add_all(others)
    puts super.methods.sort
    super.add_all(others)
    @count += others.size
  end

  def to_s
    s = "count = #{@count} | #{super.to_s}"
  end
end

a = MyArrayCounter.new
puts "[ DO ] #{a.class.to_s} => add 1, add 2, add 3"
a.add 1
a.add 2
a.add 3
puts "[INFO] #{a.to_s}"

puts "[ DO ] #{a.class.to_s} => add_all [4,5,6]"
a.add_all [4, 5, 6]
puts "[INFO] #{a.to_s}"
