# program to find the factorial of a number provided by the user.

print "Enter a number: "
number = gets.to_i

if number < 0
  puts "Sorry, factorial does not exist for negative numbers"
elsif number.zero?
  puts "The factorial of 0 is 1"
else
  factorial = 1
  (2..number).each { factorial *= _1 } 
  puts "Factorial(#{number})=#{factorial}"
end
