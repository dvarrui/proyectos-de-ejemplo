#!/usr/bin/ruby

print "Ejecutando",$0,"\n"

class Persona

  def initialize(nombre)
    @nombre = nombre
  end

  def saludar
    "Hola, mi nombre es #{@nombre}."
  end

end

david = Persona.new('David')

puts david.saludar
print "Soy de la clase " ,david.class.name,"\n"

class Japones < Persona
  def initialize
   super('Unkown!')
  end
end

matz = Japones.new
puts matz.saludar
print "Soy de la clase ",matz.class.name,"\n"
