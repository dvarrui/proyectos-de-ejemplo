
class Monomio
  attr_accessor :value, :xexp

  def initialize(value, xexp=1)
    @data = { value: value, xexp: xexp }
  end

  def value
    @data[:value]
  end

  def xexp
    @data[:xexp]
  end

  def to_s(mode=:default)
    return to_s_vector if mode == :vector
    return to_s_simple if mode == :simple
    to_s_default
  end

  def +(monomio)
    unless xexp == monomio.xexp
      raise '[FAIL] Los monomios no tienen igual exponente de x'
    end
    new_value = value + monomio.value
    Monomio.new(new_value, xexp)
  end

  def -(monomio)
    unless xexp == monomio.xexp
      raise '[FAIL] Los monomios no tienen igual exponente de x'
    end
    new_value = value - monomio.value
    Monomio.new(new_value, xexp)
  end

  def *(monomio)
    new_value = value * monomio.value
    new_xexp = xexp + monomio.xexp
    Monomio.new(new_value, new_xexp)
  end

  def /(monomio)
    new_value = value / monomio.value
    new_xexp = xexp - monomio.xexp
    Monomio.new(new_value, new_xexp)
  end

  private

  def to_s_default
    part2 = "x^#{xexp}"
    part2 = '' if xexp.zero?
    if xexp == 1
      part2 = 'x'
    end

    part1 = "#{value}"
    part1 = "" if value == 1
    part1 = "1" if value == 1 and part2 == ''
    part1 = "-" if value == -1
    part1 = '+' + part1 if value > 0
    if value.zero?
      part1 = ''
      part2 = ''
    end

    part1 + part2
  end

  def to_s_vector
    "[#{value}, #{xexp}]"
  end

  def to_s_simple
    "#{value}*x^#{xexp}"
  end
end
