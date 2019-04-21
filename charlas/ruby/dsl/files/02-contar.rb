#!/usr/bin/env ruby
# Objetivo: contar frutas
# * Añadimos métodos/funciones
# * Y pasamos al implementación a una biblioteca

require_relative '02-contar-lib'

puts "Empezamos a contar..."

total = 0
total += contar('Manzana',3)
total += contar('Plátano')

puts "En total he contado #{total} frutas."
