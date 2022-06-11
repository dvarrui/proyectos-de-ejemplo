# program to find the factorial of a number provided by the user.

number = int(input("Enter a number: "))

if number < 0:
  print("Sorry, factorial does not exist for negative numbers")
elif number == 0:
  print("The factorial of 0 is 1")
else:
  factorial = 1
  for i in range(1,number + 1):
    factorial = factorial*i
  print("The factorial of",number,"is",factorial)
