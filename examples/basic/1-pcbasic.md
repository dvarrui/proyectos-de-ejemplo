[<< back](./README.md)

```
BASIC
```

# 1. PC-BASIC/GW-BASIC (Retro)

* `pip install pcbasic`, instalar.

## 1.1 Características

* Réplica del BASIC de IBM de los 80.
* Emula perfectamente el sonido "beep" del altavoz interno y los gráficos CGA/EGA originales.
* Interfaz: Al abrirlo, entras directamente en el "shell" donde escribes LIST, RUN y SAVE.
* Tipo	Intérprete (Ejecuta línea a línea).	
* Estilo	Retro (Años 80, tipo GW-BASIC).	
* Números de línea	Obligatorios (10 PRINT, 20 GOTO...).	
* Compatibilidad	Casi 100% con programas de IBM PC/MS-DOS antiguos.
* Velocidad	Lento (suficiente para juegos retro).	

## 1.2 Ejemplos

Ejemplo `hola.bas`:

```
10 CLS
20 PRINT "DIME TU NOMBRE"
30 INPUT N$
40 PRINT "HOLA "; N$
50 GOTO 20

```

## 2.2 Aprender

Abrir PC-BASIC, y vemos una pantalla negra con el mensaje OK.
* Modo Directo: Escribir número de línea, y ejecutar al instante. Ejemplo: `PRINT 5 + 5` y pulsa Enter.
* Modo Programa: Escribir un número antes, PC-BASIC lo guarda en la memoria.

**Listado de comandos:**

* LIST: Muestra todo el código que has escrito.
* RUN: Ejecuta el programa que tienes en memoria.
* NEW: Borra todo el código actual para empezar de cero.
* SAVE "MIPROG.BAS": Guarda tu trabajo en el disco.
* LOAD "MIPROG.BAS": Recupera un programa guardado.

**Estructura de un programa (Líneas y Variables)**

* Variables numéricas: Solo el nombre (ej. `EDAD = 25`).
* Variables de Texto (Strings): Deben terminar en $ (ej. `NOMBRE$ = "Gunter"`).

Ejemplo:

```
10 CLS
20 PRINT "--- CALCULADORA DE IVA (21%) ---"
30 INPUT "Introduce el precio base: ", PRECIO
40 IVA = PRECIO * 0.21
50 TOTAL = PRECIO + IVA
60 PRINT "El IVA es:"; IVA
70 PRINT "El precio total es:"; TOTAL
80 INPUT "Quieres calcular otro? (S/N): ", R$
90 IF R$ = "S" OR R$ = "s" THEN GOTO 10
100 END
```

> **NOTA**: Para acceder a los archivos del sistema Linux, ejecutar como: `pcbasic --mount=C:/home/username/mis_programas`
