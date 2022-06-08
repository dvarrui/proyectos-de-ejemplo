# Python program to find the factorial of a number provided by the user.

# change the value for a different result
num = 7

# To take input from the user
#num = int(input("Enter a number: "))

factorial = 1

# check if the number is negative, positive or zero
if num < 0
  puts "Sorry, factorial does not exist for negative numbers"
elsif num.zero?
  puts "The factorial of 0 is 1"
else
  (2..num).each { |i| factorial *= i }
  puts "The factorial of #{num} is #{factorial}"
end
