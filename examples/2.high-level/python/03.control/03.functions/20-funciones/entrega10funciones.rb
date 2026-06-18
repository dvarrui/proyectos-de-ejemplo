#!/usr/bin/env ruby
# asigna valores iniciales
num_primes = 10

# code here
def prime?(number)
  (2..(number - 1)).each do |i|
    return false if (number % i).zero?
  end
  true
end

def get_primes(how_many)
  primes = []
  i = 2
  while primes.size < how_many
    primes.append(i) if prime? i
    i += 1
  end
  primes
end

primes = get_primes(num_primes) # no borrar esta línea
puts(primes.to_s)
# primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
