#!/usr/bin/env ruby
#
# Programación Secuencial
# * `` o %x()
# * puts
# * Usar variables para guardar datos
# * Usar método chmop para quitar "\n"
# * Más información en :https://ruby-doc.org/core-2.6/String.html
# * Usar gemas (bibliotecas Rubygems)
# * Rainbow gem(https://rubygems.org/gems/rainbow): gem install rainbow
#
# Objetivo:
# * Mostrar información del sistema en pantalla
# * Más bonito con colores
# * Resaltar las partes diferentes

require 'rainbow'

# Recopilo información...
mi_nombre  = Rainbow(`whoami`.chomp).inverse
mi_sitio   = Rainbow(`pwd`.chomp).inverse
la_fecha   = Rainbow(%x(date).chomp).inverse
el_arbol   = Rainbow(%x(whereis tree).chomp).inverse

# Muestro la información
puts "* ¡Hola! Me llamo #{mi_nombre}"
puts "* Y resulta que me encuentro en #{mi_sitio}"

puts "* Miro el reloj y es #{la_fecha}"
puts "* Creo que hay un árbol en #{el_arbol}"
