# find the factorial of a number provided by the user using recursion

def factorial(x)
  return 1 if x == 1

  return (x * factorial(x-1))
end

num = 7

# to take input from the user
# print "Enter a number: "; num = gets.tp_i

result = factorial(num)
puts "The factorial of #{num} is #{result}"
