
class Nubex
  attr_reader :data
  
  def initialize(base = 0, exp = 1)
    @data = {}
    @data[base] = exp
  end

  def value
    s = 0
    @data.each do |key, value|
      if value.zero?
        acc = key
      elsif value > 0
        acc = 1
        value.times { acc *= key}
      end
      s += acc
    end
    s
  end

  def mul(other)
  end

  def to_s
    s = ''
    @data.each { |key, value| s += "#{key}^#{value} " }
    s
  end
end
