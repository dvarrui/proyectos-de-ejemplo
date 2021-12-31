#!/usr/bin/env ruby
# asigna valores iniciales
num_primes = 10

# code here
def is_prime?(n)
  for i in Range.new(2, n-1)
    return false if (n % i == 0)
  end
  true
end

def get_primes(how_many)
  primes = []
  i = 2
  while primes.size < how_many
    primes.append(i) if is_prime? i
    i += 1
  end
  primes
end

primes = get_primes(num_primes)  # no borrar esta línea
puts(primes.to_s)
# primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
