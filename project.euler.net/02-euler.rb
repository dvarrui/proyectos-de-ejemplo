#!/usr/bin/env ruby

class Fibonacci
  def initialize
    @fib = []
    @fib[1] = 1
    @fib[2] = 2
  end

  def of(number)
    raise 'Bad number' if number < 1

    calculate_fib_of(number)    
  end

  def to_s
    @fib
  end

  private
  
  def calculate_fib_of(number)
    return @fib[number] unless @fib[number].nil?
    prev1 = calculate_fib_of(number - 1)
    prev2 = calculate_fib_of(number - 2)
    @fib[number] = prev1 + prev2
  end

end


below = 10
interval = 1..below

fib = Fibonacci.new

sum = 0
interval.each do |number|
  puts fib.to_s
  puts "fib[#{number}]=#{fib.of(number)}"
end

# puts "Fibonacci"
# puts "* Interval  : #{interval}"
# puts "* Sum       : #{sum}" 

