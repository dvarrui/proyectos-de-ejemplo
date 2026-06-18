[<< back](../README.md)

```
BASIC
```

# ruby2basic

Es un transpilador de código Ruby a código BASIC del ZX Spectrum.

## Instalación

* Instalar Ruby.
* `gem install ruby2basic`, instalar la gema.

## Funcionalidades

* Estructura secuencial.
* Permite `puts`.

No se permite:

* Los comentarios no se están pasando al código
* Embebded Strings.

# 6.1 Expresiones regulares

Crear un transpilador usando expresiones regulares

Script para leer un fichero de Ruby y convertirlo a BASIC del ZZX Specftrum
* sin objetos
* con condicionales, bucles y funciones
* Tipos de datos integer float string y array

Ejemplo de uso:
* `t2basic-regexp.rb test1.rb`
* Salida

```
10 LET MENSAJE$ = "HOLA"
20 PRINT MENSAJE
30 FOR I = 0 TO 4
40 PRINT I
50 NEXT I
```

## 6.3 Prism

* `gem install prism`, instalar la gema.

Resultado en BASIC generado:
Basic

10 LET PUNTOS = 10
20 LET BONO = 5
30 LET TOTAL = PUNTOS + BONO
40 IF NOT (TOTAL = 15) THEN GOTO 60
50 PRINT "GANASTE"
60 STOP

Próximo reto sugerido

Ahora que el transpilador entiende matemáticas, ¿te gustaría que le enseñáramos a manejar comandos gráficos? Por ejemplo, que traduzca un método dibujar_punto(x, y) de Ruby directamente al comando PLOT x, y del Spectrum.