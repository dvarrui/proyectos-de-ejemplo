# find the factorial of a number provided by the user using recursion

def factorial(x):
    if x == 1:
        return 1
    else:
        return (x * factorial(x-1))

num = 7

# to take input from the user
# num = int(input("Enter a number: "))

result = factorial(num)
print("The factorial of", num, "is", result)
