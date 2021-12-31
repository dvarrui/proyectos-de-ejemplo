# ASGMT functions
# asigna valores iniciales
num_primes = 10

# code here


def is_prime(n):
    # Devuelve True si "n" es primo y False en otro caso
    # código de la función
    pass


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
