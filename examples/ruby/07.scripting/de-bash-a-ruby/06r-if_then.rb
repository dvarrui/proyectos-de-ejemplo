#!/usr/bin/env ruby
#!/usr/bin/env ruby
# Variables del script
CURSO   = "curso1920"
MODULOS = "hardware ingles lenguaje-de-marcas sistemas-operativos redes"

# Comienza el script
puts "[INFO] Ejecutando $(basename $0 .sh)..."
print "Escribe el nombre del ALUMNO: "
name = gets

# Borrar el directorio si existe
if Dir.exist? CURSO
  system "rm -r " + CURSO
end
mkdir $CURSO

system "mkdir #{CURSO}"

# Esto es lo que se repite
for i in MODULOS.split
  folder = File.join(CURSO, i)
  system "mkdir " + folder
  system "echo #{name} > #{folder}/leeme.txt"
end
