# Program to check if a number is prime or not
# num = 29
num = int(input("Enter a number: "))

def is_prime(number):
  flag = False
  for i in range(2, num):
    if (num % i) == 0:
      flag = True
      break
  return flag

if is_prime(num):
    print(num, "is NOT a prime number")
else:
    print(num, "is a prime number")
