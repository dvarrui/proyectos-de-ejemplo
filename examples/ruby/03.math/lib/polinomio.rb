
class Polinomio
  attr_accessor :monomios

  def initialize(monomios = {})
    @monomios = monomios
    ensure_input
  end

  def to_s(mode=:default)
    output = ''
    @monomios.each do |monomio|
      output += monomio.to_s(mode)
    end
    output
  end

  def +(polinomio)
    unless @xexp == monomio.xexp
      raise '[FAIL] Los monomios no tienen igual exponente de x'
    end
    value = @value + monomio.value
    Monomio.new(value, @xexp)
  end

  def -(monomio)
    unless @xexp == monomio.xexp
      raise '[FAIL] Los monomios no tienen igual exponente de x'
    end
    value = @value - monomio.value
    Monomio.new(value, @xexp)
  end

  def *(monomio)
    value = @value * monomio.value
    xexp = @xexp + monomio.xexp
    Monomio.new(value, xexp)
  end

  def /(monomio)
    value = @value / monomio.value
    xexp = @xexp - monomio.xexp
    Monomio.new(value, xexp)
  end

  private

  def ensure_input
    @monomios.each do |monomio|
      raise '[ERROR] Entrada incorrecta al polinomio' unless monomio.class == Monomio
    end
    true
  end


end
