# program to find the factorial of a number provided by the user
# using recursion

def factorial(x)
  # This is a recursive function
  # to find the factorial of an integer

  return 1 if x == 1
  # recursive call to the function
  return (x * factorial(x-1))
end

# change the value for a different result
num = 7

# to take input from the user
# num = int(input("Enter a number: "))

# call the factorial function
result = factorial(num)
puts "The factorial of #{num} is #{result}"
