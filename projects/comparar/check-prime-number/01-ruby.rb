# Program to check if a number is prime or not
num = 29
# To take input from the user
# num = gets("Enter a number: ").to_i
# define a flag variable
flag = false

# prime numbers are greater than 1
if num > 1
  # check for factors
  for i in Range.new(2, num - 1)
    if (num % i) == 0
      # if factor is found, set flag to True
      flag = true
      # break out of loop
      break
    end
  end
end

# check if flag is True
if flag
  puts("#{num} is not a prime number")
else
  puts("#{num} is a prime number")
end
