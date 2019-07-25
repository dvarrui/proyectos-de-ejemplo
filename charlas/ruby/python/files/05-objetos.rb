#!/usr/bin/env ruby

class Persona
  def initialize(nombre)
    @nombre = nombre
  end

  def to_s
    "Nombre : #{@nombre}"
  end
end

p = Persona.new "David"
puts p
