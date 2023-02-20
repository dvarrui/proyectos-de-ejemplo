#!/usr/bin/env ruby

class Humano
  def identidad
    print "[Humano] soy una persona.\n"
  end

  def tarifa_tren(edad)
    if edad < 12
      print "[Humano] tarifa reducida.\n"
    else
      print "[Humano] tarifa normal. \n"
    end
  end
end


class Estudiante < Humano
  def identidad
    print "[Estudiante] soy un estudiante.\n"
  end
end


class Profesor<Humano
  def identidad
    print "[Profesor] Soy un profesor y además...."
    super
  end
end

Humano.new.identidad
Estudiante.new.identidad
Profesor.new.identidad

