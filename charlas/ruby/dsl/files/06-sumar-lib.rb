
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

  def acc
    @acc
  end
end
