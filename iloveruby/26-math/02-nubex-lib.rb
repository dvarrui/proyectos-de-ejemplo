
class Nubex
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
    @data.each { |key, value| out += "#{key}^#{value }"}
    out
  end
end
