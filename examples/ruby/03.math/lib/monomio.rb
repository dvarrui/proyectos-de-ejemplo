
class Monomio
  attr_accessor :value, :xexp

  def initialize(value, xexp=1)
    @value = value
    @xexp = xexp
  end

  def to_s(mode=:default)
    return to_s_vector if mode == :vector
    return to_s_simple if mode == :simple
    to_s_default
  end

  def +(monomio)
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
#    require 'pry-byebug'; binding.pry
    value = @value * monomio.value
    xexp = @xexp + monomio.xexp
    Monomio.new(value, xexp)
  end

  def /(monomio)
#    require 'pry-byebug'; binding.pry
    value = @value / monomio.value
    xexp = @xexp - monomio.xexp
    Monomio.new(value, xexp)
  end

  private

  def to_s_default
    part2 = "x^#{@xexp}"
    part2 = '' if @xexp.zero?
    if @xexp == 1
      part2 = 'x'
    end

    part1 = "#{@value}"
    part1 = "" if @value == 1
    part1 = "1" if @value == 1 and part2 == ''
    part1 = "-" if @value == -1
    if @value.zero?
      part1 = ''
      part2 = ''
    end

    part1 + part2
  end

  def to_s_vector
    "[#{@value}, #{@xexp}]"
  end

  def to_s_simple
    "#{@value}*x^#{@xexp}"
  end
end
