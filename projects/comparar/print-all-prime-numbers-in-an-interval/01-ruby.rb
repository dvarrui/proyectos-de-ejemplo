# Python program to display all the prime numbers within an interval

lower = 900
upper = 1000

def is_prime?(number)
  (2..(number-1)).each { |i| return false if (number % i).zero? }
  return true
end

puts "Prime numbers between #{lower} and #{upper} are:"

Range.new(lower, upper).each { |num| puts num if is_prime? num }
