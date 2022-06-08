# Program to check if a number is prime or not
# num = 29
print "Enter a number: "
num = gets.to_i

def is_prime?(number)
  max = number - 1
  (2..max).each  { |i| return false  if (number % i).zero? }
  true
end

if is_prime? num
  puts "#{num} is a prime number"
else
  puts "#{num} is NOT a prime number"
end
