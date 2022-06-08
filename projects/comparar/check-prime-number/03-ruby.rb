# Program to check if a number is prime or not

num = 407

# To take input from the user
#num = int(input("Enter a number: "))

# prime numbers are greater than 1
if num > 1
  # check for factors
  (2..(num-1)).each do |i|
    if (num % i).zero?
      puts "#{num} is NOT a prime number"
      puts "#{i} times #{num/i} is #{num}"
      break
    else
      puts "#{num} is a prime number"
    end

# if input number is less than
# or equal to 1, it is not prime
else
  puts #{num} is not a prime number"
end
