#!/usr/bin/env ruby
# Variables del script
CURSO   = "curso1920"
MODULOS = "hardware ingles lenguaje-de-marcas sistemas-operativos redes"

# Comienza el script
puts "[INFO] Ejecutando $(basename $0 .sh)..."
print "Escribe el nombre del ALUMNO: "
name = gets

system "mkdir #{CURSO}"

for i in MODULOS.split
  # Esto es lo que se repite
  folder = File.join(CURSO, i)
  system "mkdir " + folder
  system "echo #{name} > #{folder}/leeme.txt"
end
