#!/usr/bin/ruby

dni = ARGV[0].to_i
cadena = "TRWAGMYFPDXBNJZSQVHLCKE"
letra = cadena[dni % 23]
print("Tu DNI completo es #{dni}#{letra}\n")
