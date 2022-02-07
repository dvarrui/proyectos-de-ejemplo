#!/usr/bin/env ruby

below = 4000000
interval = 3..below

fib_nless1 = 2
fib_nless2 = 1
sum = fib_nless2

interval.each do |number|
  fib = fib_nless1 + fib_nless2
  sum += fib if number.even?

  fib_nless2 = fib_nless1
  fib_nless1 = fib
end

puts sum
