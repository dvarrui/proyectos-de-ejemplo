#!/usr/bin/env ruby

require_relative '02-secuencia-lib'

inputs = [ 1, 3, 5, 7].shuffle

show_begin_title inputs
outputs = []
inputs.each_with_index do |input, index|
  outputs << process(index, input)
end
show_end_title outputs
