
# Tarea: tabla de multiplicar

## Descripción

Mostrar la tabla de multiplicar.

Salida:
```
Write a number: 2
  1 *  2 =   2
  2 *  2 =   4
  3 *  2 =   6
  4 *  2 =   8
  5 *  2 =  10
  6 *  2 =  12
  7 *  2 =  14
  8 *  2 =  16
  9 *  2 =  18
 10 *  2 =  20
```

## Esquema

Podemos descomponer la tarea en los siguientes pasos:
1. El usuario introduce un número (`number`).
2. A continuación, un bucle de 1 hasta 10 (`i` será la variable que define cada ciclo).
3. Para cada ciclo mostraremos en pantalla `i * number = i*number`.
4. Fin del programa

# Ejemplos

Vamos a ver cómo se implementa cada uno de los anteriores pasos en diferentes lenguajes.

## Ejemplo: Ruby

```ruby
# step 1
print "Write a number: "
number = gets.to_i

1.upto(10) do |i| # step 2
  puts " %2d * %2d = %3d" % [ i, number, i*number ] # step 3
end
```
