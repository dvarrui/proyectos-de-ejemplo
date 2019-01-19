#!/usr/bin/env ruby
#
# Programación Secuencial
# * `` o %x()
# * puts
# * Usar variables para guardar datos
# * Usar método chmop para quitar "\n"
# * Más información en :https://ruby-doc.org/core-2.6/String.html
#
# Objetivo:
# * Mostrar información del sistema en pantalla
# * Más bonito con colores
# * Resaltar las partes diferentes

# Recopilo información...
mi_nombre  = `whoami`         # ¿Quién soy?
mi_sitio   = `pwd`            # ¿Dónde estoy?
la_fecha   = %x(date)         # ¿Dónde encuentro árboles?
el_arbol   = %x(whereis tree) # ¿Dónde encuentro árboles?

# Muestro la información
puts("* ¡Hola! Me llamo <#{mi_nombre.chomp}>")
puts "* Y resulta que me encuentro en <#{mi_sitio.chomp}>"

puts('* Además ahora son las <' + la_fecha.chomp + '>')
puts '* Creo que hay un árbol en <' + el_arbol.chomp + '>'
