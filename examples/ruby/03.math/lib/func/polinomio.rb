
require_relative 'monomio'

class Polinomio

  def hash_to_a(polinomio_hash)
    polinomio_array = []
    xexps = polinomio_hash.keys.reverse
    xexps.each do |xexp|
      value = polinomio_hash[xpexp]
      polinomio_array << [ value, xexp ]
    end
    polinomio_array
  end

  def self.array_to_s(polinomio_array)
    polinomio_string = ''
    polinomio_array.each do |monomio|
      value = monomio[0]
      xexp = monomio[1]
      polinomio_string += Monomio.to_s(value, xexp)
    end
    polinomio_string
  end
end
