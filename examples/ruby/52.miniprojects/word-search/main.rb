#!/usr/bin/env ruby
require_relative 'lib/grid'

words = %w[negro azul gris verde naranja rosa rojo blanco amarillo]
puts words.to_s

grid = Grid.new(10)
grid.add('negro', 1, 2, :e)
grid.add('gato', 4, 7, :w)
grid.add('gris', 4, 7, :s)

grid.show