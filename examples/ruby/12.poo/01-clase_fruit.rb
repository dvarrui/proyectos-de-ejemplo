#!/usr/bin/env ruby

class Fruit

  def kind=(k)
    @kind = k
  end

  def kind
    @kind
  end

end

f = Fruit.new
f.kind = "banana"
puts "(1) Veamos el tipo de la fruta..." + f.kind

class Fruta
  def inspect
    "una fruta de la variedad " + @kind
  end
end

puts "(2) Información del objeto: #{f}"
p f

