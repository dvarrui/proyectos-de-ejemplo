
class Nubex
  attr_reader :data

  def initialize(base, exp)
    @data = { base => exp}
  end

  def to_i
    acc = 0
    @data.each { |key, value| acc += key ** value }
    acc
  end

  def to_s
    out = ''
    @data.sort.each { |item| out += "#{item[0]}^#{item[1]} "}
    out
  end

  def mul(other)
    other.data.each do |key, value|
      if @data[key].nil?
        @data[key] = value
      else
        @data[key] += value
        @data.delete(key) if @data[key].zero?
      end
    end
  end

  def factorize(n)
    factors = []
    f = n
    (2..n).each do |i|
      while f%i == 0
        factors << i
        f = f / i
      end
    end
    factors
  end

end
