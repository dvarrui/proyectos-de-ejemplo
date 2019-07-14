
class Calculadora
  def initialize
    @acc = 0
  end

  def sumar(*args)
    s = 0
    args.each { |i| s+= i }
    @acc += s
    s
  end
  alias suma sumar
  alias add  sumar

  def acc
    @acc
  end
  alias resultado acc

  def dime(*args)
    args.each do |i| print i end
  end

  def calcula(&block)
    instance_eval(&block)
  end

end

def calcula(&block)
  c = Calculadora.new
  c.calcula(&block)
  return c
end
