

class Monomio

  def self.to_s(value,xexp)
    part2 = "x^#{xexp}"
    part2 = '' if xexp.zero?
    if xexp == 1
      part2 = 'x'
    end

    part1 = "#{value}"
    part1 = "" if value == 1
    part1 = "1" if value == 1 and part2 == ''
    part1 = "-1" if value == -1 and part2 == ''
    part1 = "-" if value == -1 and part2 != ''
    part1 = '+' + part1 if value > 0
    if value.zero?
      part1 = ''
      part2 = ''
    end

    part1 + part2
  end

  def self.array_to_s(monomio_array)
    value = monomio_array[0]
    xexp = monomio_array[1]
    to_s(value, xexp)
  end

  def self.puts(monomio)
    STDOUT.puts monomio.to_s
  end
end
