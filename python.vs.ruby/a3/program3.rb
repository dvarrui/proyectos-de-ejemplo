#!/usr/bin/ruby
# Calcular el máximo común divisor
class Range
  def reverse_each(&param)
    self.to_a.reverse.each { |i| yield(i) }
  end
end

numa = ARGV[0].to_i
numb = ARGV[1].to_i

if numa < numb
  menor = numa
else
  menor = numb
end

if numa <= 0 or numb <= 0
  puts('¡ERROR! Debes introducir un número entero positivo')
  exit
end

#(0..menor).to_a.reverse!.each do |i| # Más transparente
(0..menor).reverse_each do |i|        # Más bonito
  if (numa%i== 0) and (numb%i== 0)
    puts "El máximo común divisor de #{numa} y #{numb} es #{i}"
    break
  end
end
