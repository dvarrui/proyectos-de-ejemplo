# Program to check if a number is prime or not
# num = 29
# To take input from the user
print "Enter a number: "
num = gets.to_i
# define a flag variable
flag = false

# prime numbers are greater than 1
if num > 1
  # check for factors
  max = num - 1
  for i in 2..max
    if (num % i).zero?
      # if factor is found, set flag to True
      flag = true
      # break out of loop
      break
    end
  end
end 

# check if flag is True
if flag
  puts "#{num} is NOT a prime number"
else
  puts "#{num} is a prime number"
end
