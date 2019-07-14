#!/usr/bin/env ruby
# Se añade un alias a acc llamado resultado

require_relative '09-sumar-lib'
puts "Ejemplo   : #{$0}"

calcula do
  sumar 3, 2
  suma 1
  add 1
  dime "Resultado : ", resultado
end
