# iterative
def factorial(n):
    result = 1
    for i in range(2, n+1):
        result *= i
    return result

print("   3!=", factorial(3))
print("  30!=", factorial(30))
print("3000!=", factorial(3000))
