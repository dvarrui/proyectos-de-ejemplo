
class Fruta
  def kind=(k)
    @kind = k
  end
  def kind
    @kind
  end
end

f = Fruta.new
f.kind = "banana"
puts "[INFO.1] Valor del atributo: #{f.kind}"
puts "[INFO.2] Información del objeto: #{f}"
p f

class Fruta
  def inspect
    "[INFO.4] Una fruta de la variedad " + @kind
  end
end

p f

