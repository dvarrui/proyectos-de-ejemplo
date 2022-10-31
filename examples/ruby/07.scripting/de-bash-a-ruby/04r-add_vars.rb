#!/usr/bin/env ruby
# Variables del script
CURSO   = "curso1920"
MODULOS = "hardware ingles lenguaje-de-marcas sistemas-operativos redes"
ALUMNO  = "obiwan"

# Comienza el script
puts "[INFO] Ejecutando el ejercicio 04..."
system "mkdir #{CURSO}"

for i in MODULOS.split
  # Esto es lo que se repite
  folder = "#{CURSO}/#{i}"
  system "mkdir #{folder}"
  system "echo #{ALUMNO} > #{folder}/leeme.txt"
end
