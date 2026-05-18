
# Recursividad

Implementa una función recursiva:

* Firma `generate(vector, i, n)`
* que genere e imprima todos los vectores binarios válidos de longitud n
* que cumplan la condición de paridad.

# Algoritmo

```ruby
generate( [], 0, 8)

def generate(vector, i, n)
  if i < n
    # Avanzar otro nivel
    vector0 = vector + [0]
    generate(vector0, i + 1, n)
    vector1 = vector + [1]
    generate(vector1, i + 1, n)
  elsif parity_ok(vector)
    print_vector(vector)
  end
end

def parity_ok(vector)
  # Calcular si la paridad es correcta
  return true/false
end

def print_vector(vector)
  # Mostrar vector de bits por pantalla
end
````
