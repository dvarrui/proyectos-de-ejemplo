
require_relative 'monomio'

class Polinomio
  attr_accessor :monomios

  def initialize(monomios = [])
    @monomios = prepare_input monomios
  end

  def to_h
    result = {}
    @monomios.each_pair { |key,monomio| result[key]=monomio.value }
    #require 'pry-byebug'; binding.pry
    result
  end

  def to_s
    output = ''
    @monomios.each_value do |mono|
      output += mono.to_s
    end
    output
  end

  def +(polinomio)
    result = {}
    polinomio.to_h.each_pair do |key, monomio|
      result[:key] = @monomios[key] + monomio
    end
    Polinomio.new(polinomio)
  end

  def -(polinomio)
    result = {}
    polinomio.to_h.each_pair do |key, monomio|
      result[:key] = @monomios[key] - monomio
    end
    Polinomio.new(polinomio)
  end

  def *(monomio)
    result = {}
    polinomio.each_pair do |key, monomio|
      result[:key] = @monomios[key] - monomio
    end
    Polinomio.new(polinomio)
  end

  def /(monomio)
    value = @value / monomio.value
    xexp = @xexp - monomio.xexp
    Monomio.new(value, xexp)
  end

  private

  def prepare_input(monomios)
    output = {}
    monomios.each do |monomio|
      raise '[ERROR] Entrada incorrecta al polinomio' unless monomio.class == Monomio
      key = monomio.xexp
      value = monomio
      if output[key].nil?
        output[key] = monomio
      else
        output[key] = output[key] + monomio
      end
    end
    output
  end
end
