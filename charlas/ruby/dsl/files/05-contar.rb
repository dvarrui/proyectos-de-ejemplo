#!/usr/bin/env ruby
# Objetivo: contar frutas
# * Hemos creado una biblioteca con la implementación
# * Usamos métodos/funciones
# * No se requieren los paréntesis
# * Ocultamos las variables
# * Metaprogramación:
#     - missing_method
#     - https://www.leighhalliday.com/ruby-metaprogramming-method-missing

require_relative '05-contar-lib'

puts "Empezamos a contar..."

contar 'Manzanas', 3
contar  3, 'peras'
contar 'plátano'
contar manzanas: 3, plátanos: 1
contar 'pera', 'pera', 'pera', 'piña', 'piña'

contar_3_manzanas
contar_platano

puts "En total he contado #{total} frutas."
