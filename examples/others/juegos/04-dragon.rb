#!/usr/bin/env ruby

def mostrar_introduccion
  puts('Estás en una tierra llena de dragones. Frente a tí')
  puts('hay dos cuevas. En una de ellas, el dragón es generoso y')
  puts('amigable y compartirá su tesoro contigo. El otro dragón')
  puts('es codicioso y está hambriento, y te devorará inmediatamente.')
  puts()
end

def elegir_cueva
  cueva = ''
  while cueva != '1' and cueva != '2' do
    print('¿A qué cueva quieres entrar? (1 ó 2) ')
    cueva = gets().chomp
  end
  cueva
end

def explorar_cueva(cueva_elegida)
  puts('Te aproximas a la cueva...')
  sleep(2)
  puts('Es oscura y espeluznante...')
  sleep(2)
  puts('¡Un gran dragón aparece súbitamente frente a tí! Abre sus fauces y...')
  puts
  sleep(2)

  cueva_amigable = rand(2)
  if cueva_elegida == cueva_amigable.to_s
    puts('¡Te regala su tesoro!')
  else
    puts('¡Te engulle de un bocado!')
  end
end

# Game loop
jugar_de_nuevo = 's'
while jugar_de_nuevo == 'sí' or jugar_de_nuevo == 's' do
  mostrar_introduccion()
  numero_de_cueva = elegir_cueva()
  explorar_cueva(numero_de_cueva)
  print('¿Quieres jugar de nuevo? (sí o no) ')
  jugar_de_nuevo = gets.chomp
end
