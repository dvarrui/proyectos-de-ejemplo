#!/usr/bin/env ruby
# Objetivo: contar frutas
# * Hemos creado una biblioteca con la implementación
# * Usamos métodos/funciones
# * No se requieren los paréntesis
# * Ocultamos las variables
# * Flexibilidad en los argumentos. Aceptar Hahses y Arrays

require_relative '04-contar-lib'

puts "Empezamos a contar..."

contar manzanas: 3, plátanos: 1
contar 'peras', 'peras', 'piña', 'piña', 'peras'
contar 5, 'naranjas'

puts "En total he contado #{total} frutas."
