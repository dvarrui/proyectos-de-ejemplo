#!/usr/bin/env ruby
# Objetivo: Vamos a contar frutas
# * Emplearemos la forma clásica

# Variables
fruta = "manzana"
hasta = 3

puts "Empezamos a contar..."

# Bucle clásico
i = 0
while(i<hasta)
  i +=1
  puts "* #{fruta.capitalize} #{i}"
end

puts "En total he contado #{i} #{fruta}/s"
