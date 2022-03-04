
require_relative 'monomio'

class Polinomio

  def self.hash_to_a(polinomio_hash)
    polinomio_array = []
    xexps = polinomio_hash.keys
    #require 'pry-byebug'; binding.pry
    xexps.sort.reverse.each do |xexp|
      value = polinomio_hash[xexp]
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

  def add(polinomio1, polinomio2)
    result = polinomio1.clone
    polinomio2.each_pair do |key, value|
      if result[key].nil?
        result[key] = value
      else
        result[key] = result[key] + value
      end
    end
    result
  end

  def self.puts(polinomio)
    STDOUT.puts polinomio.to_s
  end
end
