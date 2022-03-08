num_primes = 10


def is_prime(number):
      # Devuelve True si "n" es primo y False en otro caso
 for i in range(2, number):
       if (number % i == 0):
        return False
 return True


def get_primes(how_many):
    # Devuelve una lista con los "how_many" primeros primos
    primes = []
    i = 2
    while len(primes) < how_many:
        if is_prime(i):
            primes.append(i)
        i += 1
    return primes


primes = get_primes(num_primes)  # no borrar esta línea
print(primes)
# primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
