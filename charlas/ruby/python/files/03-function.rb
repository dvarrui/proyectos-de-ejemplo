#!/usr/bin/env ruby

def mayor_de_edad(edad)
  return "Eres MAYOR de edad" if edad.to_i >= 18
  "Eres MENOR"
end

puts mayor_de_edad ARGV[0]
