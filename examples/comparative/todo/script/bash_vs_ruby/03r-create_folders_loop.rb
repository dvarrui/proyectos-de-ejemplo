#!/usr/bin/env ruby

puts "[INFO] Ejecutando el ejercicio 03..."

system("mkdir curso1920")

for i in %w[hardware ingles lenguaje-de-marcas sistemas-operativos]
  # Esto es lo que se repite
  system "mkdir curso1920/#{i}"
  system "echo 'david' > curso1920/#{i}/leeme.txt"
end

