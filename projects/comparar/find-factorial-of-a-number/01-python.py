# find the factorial of a number

number = 7

if number < 0:
   print("Sorry, factorial does not exist for negative numbers")
elif number == 0:
   print("The factorial of 0 is 1")
else:
  factorial = 1
  for i in range(1,number + 1):
    factorial = factorial*i
  print("The factorial of",number,"is",factorial)
