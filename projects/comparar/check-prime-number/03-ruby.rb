# Program to check if a number is prime or not

num = 407

# To take input from the user
# print "Enter a number: "
# num = gets.to_i

def divisor_of(number)
  max = number - 1
  (2..max).each  { |i| return i  if (number % i).zero? }
  nil
end

divisor = divisor_of(num)

if divisor
  puts "#{num} is NOT a prime number"
  puts "#{divisor} times #{num/divisor} is #{num}"
else
  puts "#{num} is a prime number"
end
