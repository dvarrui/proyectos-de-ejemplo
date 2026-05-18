#!/usr/bin/env ruby

def generate(vector, i, n)
  if i < n
    # Avanzar otro nivel
    vector0 = vector + [0]
    generate(vector0, i + 1, n)
    vector1 = vector + [1]
    generate(vector1, i + 1, n)
  elsif parity_ok?(vector)
    print_vector(vector)
  end
end

def parity_ok?(vector)
  # Calcular si la paridad es correcta
  ones = vector.select { _1 == 1 }.count
  return true if ones.even?
  return false
end

def print_vector(vector)
  # Mostrar vector de bits por pantalla
  puts vector.join("")
end

generate( [], 0, ARGV.first.to_i)
