#!/usr/bin/env ruby
# Objetivo: contar frutas
# * Hemos creado una biblioteca con la implementación
# * Usamos métodos/funciones
# * No se requieren los paréntesis
# * Ocultamos las variables

require_relative '03-contar-lib'

puts "Empezamos a contar..."

contar 'Manzanas', 3
contar 'Plátanos'

puts "En total he contado #{total} frutas."
