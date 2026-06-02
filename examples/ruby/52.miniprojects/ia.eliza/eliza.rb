require_relative "rules"

class Eliza
  def initialize
    puts "=================================================="
    puts " ELIZA: Psicoterapeuta Computacional (Versión Ruby)"
    puts "=================================================="
    puts "Escribe 'salir' o 'adios' para terminar la sesión.\n\n"
    puts "ELIZA: Hola. ¿Cuál es tu problema hoy?"
  end

  # Bucle principal de la conversación
  def comenzar_chat
    loop do
      print "Tú: "
      entrada = gets
      break if entrada.nil? # Manejo de fin de archivo (Ctrl+D)
      
      entrada = entrada.strip
      break if ["salir", "adios", "chau", "quit", "exit"].include?(entrada.downcase)

      puts "ELIZA: #{generar_respuesta(entrada)}"
    end
    puts "ELIZA: Adiós. Espero haberte ayudado a aclarar tus pensamientos."
  end

  private

  # Procesa la entrada y busca la regla que encaje
  def generar_respuesta(texto)
    RULES.each do |patron, respuestas|
      if match = patron.match(texto)
        respuesta_elegida = respuestas.sample # Selecciona una respuesta al azar
      # Si la regla tiene capturas (paréntesis), procesa el texto capturado
        if match.captures.any?
          match.captures.each_with_index do |captura, index|
            next if captura.nil?
            texto_espejo = reflejar_pronombres(captura)
            # Reemplaza %1 con la primera captura, %2 con la segunda, etc.
            respuesta_elegida = respuesta_elegida.gsub("%#{index + 1}", texto_espejo)
          end
        end
        return respuesta_elegida
      end
    end
  end

  # Intercambia los pronombres del usuario (Efe. "mi madre" -> "tu madre")
  def reflejar_pronombres(fragmento)
    palabras = fragmento.downcase.split(/\b/)
    palabras.map! do |palabra|
      REFLECTIONS[palabra] || palabra
    end
    palabras.join
  end  
end

