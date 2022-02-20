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
    @fib.join(', ')
  end

  private
  
  def calculate_fib_of(number)
    return @fib[number] unless @fib[number].nil?
    prev1 = calculate_fib_of(number - 1)
    prev2 = calculate_fib_of(number - 2)
    @fib[number] = prev1 + prev2
  end

end


below = 4000000 
interval = 1..below

fib = Fibonacci.new

sum = 0
interval.each do |number|
  sum += fib.of(number) if number.even?
end

puts sum


