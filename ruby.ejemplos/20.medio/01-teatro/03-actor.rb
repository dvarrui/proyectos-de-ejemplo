
require 'rainbow'

class Actor
  def initialize(name, color=:green)
    @color = color
    @name = name
    @tab = ' ' * name.size
    @num_frases = 0
    @num_palabras = 0
  end

  def colored_name
    Rainbow(@name).color(@color).bright
  end

  def dice(texto)
    dice_tranquilo texto
  end

  def dice_gritando(texto)
    dice_tranquilo Rainbow(texto.upcase).red.bright
  end

  def dice_tranquilo(texto)
    frases = texto.split('.')
    # Decir la primera frase
    puts colored_name + ' : ' + frases[0].strip + '.'
    frases.delete_at 0
    # Decir el resto
    frases.each do |frase|
      puts @tab + ' : ' + frase.strip + '.'
    end
    contar_las_palabras_del texto
  end

  def info
    puts
    puts colored_name.strip
    tab = ' ' * (@name.size - 1)
    puts tab + Rainbow("├─ He tenido #{@num_frases} frases.").color(@color).bright
    puts tab + Rainbow("└─ He dicho  #{@num_palabras} palabras.").color(@color).bright
  end

  private

  def contar_las_palabras_del(texto)
    @num_frases += 1
    @num_palabras += texto.split(' ').count
  end

end

def titulo_de_la_obra(titulo)
  size = titulo.size
  puts '=' * size
  puts titulo
  puts '=' * size
end

