[<< back](./README.md)

```
BASIC
```

# 5. zxboriel

----
Instalar zxboriel en opensuse

¡Excelente elección! ZXBasic (también conocido como el compilador de Boriel) es la herramienta definitiva si quieres programar para el legendario Sinclair ZX Spectrum usando un PC con openSUSE. Es un compilador cruzado (cross-compiler) que convierte tu código BASIC en código máquina de Z80.

Aquí tienes los pasos para dejarlo listo en tu sistema:
1. Requisitos previos

ZXBasic está escrito en Python, por lo que openSUSE ya tiene casi todo lo necesario. Solo asegúrate de tener las herramientas básicas:
Bash

sudo zypper install python3 python3-pip

2. Instalación de ZXBasic (Boriel)

La forma más limpia y moderna de instalarlo es a través de pip (el gestor de paquetes de Python):
Bash

pip install zxbasic

Verificación

Para comprobar que se instaló correctamente, escribe en tu terminal:
Bash

zxc --version

(El comando principal se llama zxc, que significa ZX Compiler).
3. Tu primer programa para el Spectrum

Crea un archivo llamado test.bas con tu editor de texto:
Fragmento de código

' Mi primer programa para Spectrum
BORDER 1: PAPER 7: INK 0
CLS
PRINT AT 10, 5; "HOLA DESDE OPENSUSE!"
PRINT AT 12, 5; "HECHO CON BORCEL'S BASIC"
PAUSE 0

Compilar a formato .tap

Ahora, convierte ese código en una cinta virtual que un emulador pueda leer:
Bash

zxc test.bas --tap --autorun

    --tap: Crea un archivo .tap (formato de cinta).

    --autorun: Hace que el programa se ejecute solo al cargarse.

4. Cómo probarlo (Emuladores en openSUSE)

Para ver tu programa funcionando, necesitas un emulador de ZX Spectrum. En openSUSE tienes varias opciones excelentes en los repositorios:
Opción A: Fuse (El más clásico)
Bash

sudo zypper install fuse-emulator-gtk

Luego simplemente abre tu archivo: fuse test.tap.
Opción B: ZEsarUX (Muy potente y con muchas máquinas)

Es el favorito de muchos desarrolladores actuales. Puedes descargarlo de su GitHub oficial o buscarlo en el OBS de openSUSE.
5. Recomendación de "Pro": El IDE

Programar en la terminal está bien, pero si quieres una experiencia completa, busca "ZX IDE" o usa VS Code con la extensión "ZX Basic".

Esto te permitirá:

    Resaltado de sintaxis (colores).

    Compilar con un solo clic.

    Lanzar el emulador automáticamente al compilar.

    Nota importante: ZXBasic usa una sintaxis muy parecida a FreeBASIC (permite etiquetas, no requiere números de línea), pero mantiene los comandos clásicos del Spectrum como POKE, PEEK, PLOT y DRAW.

¿Quieres que te ayude a configurar un "Makefile" o un script sencillo para que al guardar tu código se abra automáticamente en el emulador Fuse?

Si

¡Genial! Tener un flujo de trabajo automatizado te ahorra mucho tiempo: escribes el código, lanzas el comando y ¡pum!, el emulador se abre con tu programa cargado.

En Linux (y específicamente en openSUSE), la forma más elegante de hacer esto es con un pequeño script de Bash o un archivo Makefile.

Aquí tienes la solución más sencilla: un script llamado build.sh.
1. Crea el script de automatización

Crea un archivo llamado build.sh en la misma carpeta donde tengas tus programas .bas y pega esto:
Bash

#!/bin/bash

# Comprobamos si nos has pasado un nombre de archivo
if [ -z "$1" ]; then
    echo "Uso: ./build.sh nombre_del_archivo.bas"
    exit 1
fi

FILE_NAME=$(basename "$1" .bas)

echo "--- Compilando $1 ---"

# 1. Compilar con ZXBasic (Boriel)
# --tap: genera cinta, --autorun: carga automática, --overwrite: sobreescribe si ya existe
zxc "$1" --tap --autorun --overwrite

# 2. Comprobar si la compilación tuvo éxito
if [ $? -eq 0 ]; then
    echo "--- Éxito! Abriendo en Fuse ---"
    # 3. Lanzar el emulador Fuse con el archivo generado
    fuse-emulator-gtk "${FILE_NAME}.tap" &
else
    echo "--- Error en la compilación ---"
fi

2. Dale permisos de ejecución

Abre tu terminal en esa carpeta y escribe:
Bash

chmod +x build.sh

3. ¡A programar!

Ahora, cada vez que quieras probar tu programa (por ejemplo test.bas), solo tienes que escribir en la terminal:
Bash

./build.sh test.bas

---
¿Por qué esto es mejor?

    Limpieza: No tienes que escribir los parámetros de zxc cada vez.

    Multitarea: El símbolo & al final de la línea de Fuse permite que el emulador se abra sin bloquear tu terminal, para que puedas seguir editando código.

    Depuración: Si cometes un error en el BASIC, el script se detendrá y te mostrará el error exacto antes de intentar abrir el emulador.

Truco extra para openSUSE (VSCodium / VS Code)

Si usas VS Code (o VSCodium), puedes integrar esto aún más:

    Pulsa Ctrl + Shift + B.

    Selecciona "Configure Build Task".

    Pega una configuración que llame a este ./build.sh ${file}.

Así, con solo pulsar una tecla en el editor, verás tu código ejecutándose en el Spectrum virtual.

¿Quieres que probemos un código divertido para ZX Spectrum, como generar música con BEEP o dibujar algo con PLOT y DRAW?

Aprender zxboriel

Aprender ZXBasic (Boriel) es fascinante porque combina lo mejor de dos mundos: la sencillez del BASIC de los 80 con la potencia de un lenguaje moderno (estructuras, funciones y optimización).

Aquí tienes tu hoja de ruta para dominarlo en openSUSE.
1. Conceptos Fundamentales (Diferencias con el Spectrum original)

A diferencia del Sinclair BASIC que venía en la ROM de la computadora, el compilador de Boriel:

    No usa números de línea (aunque los soporta para compatibilidad).

    Es un compilador: El código se traduce a lenguaje máquina antes de ejecutarse, por lo que es mucho más rápido (hasta 10-50 veces más rápido que el BASIC original).

    Tipos de datos: En el Spectrum original todo eran números "flotantes". En Boriel puedes usar UByte (0-255) o Integer para que el procesador Z80 trabaje a toda velocidad.

2. Tu primera lección: Tipos de datos y Etiquetas

En Boriel, si quieres velocidad, declara tus variables.
Fragmento de código

' Ejemplo de programa optimizado
Dim i As UByte ' Un byte es ideal para bucles de 0 a 255
Dim x As UByte, y As UByte

Border 0: Paper 0: Ink 7: Cls

BuclePrincipal:
    x = Int(Rnd * 32)
    y = Int(Rnd * 22)
    Print At y, x; "*"
    
    ' Un pequeño retardo
    For i = 1 To 100: Next i
    
    Goto BuclePrincipal

3. Estructuras de Control Modernas

Olvida los GOTO si quieres hacer programas grandes. Boriel soporta:

    If...Then...Else...End If: Bloques completos de decisión.

    Do...Loop: Bucles infinitos o condicionales.

    While...End While: Ejecuta mientras se cumpla una condición.

    For...Next: Para conteos.

Ejemplo de limpieza visual:
Fragmento de código

Do
    If Inkey$ = "p" Then 
        Print "Pulsaste P"
    End If
Loop Until Inkey$ = "q" ' Sale del programa al pulsar Q

4. El "Superpoder": Funciones y Subrutinas

En el BASIC antiguo usabas GOSUB 1000. En Boriel creas funciones reales:
Fragmento de código

' Define una subrutina
Sub DibujarCuadro(x As UByte, y As UByte)
    Plot x, y
    Draw 10, 0
    Draw 0, 10
    Draw -10, 0
    Draw 0, -10
End Sub

' La usas así:
DibujarCuadro(50, 50)
DibujarCuadro(100, 80)

5. Recursos para profundizar

Para aprender de verdad, necesitas estas tres fuentes:

    La Wiki de Boriel: Es la biblia. Están todos los comandos explicados. https://zxbasic.readthedocs.io/

    El foro de Boriel: Donde están los expertos en Spectrum compartiendo trucos de optimización.

    Programas de ejemplo: Boriel incluye una carpeta llamada examples al instalarlo. Te recomiendo leer el código de los juegos que vienen ahí.

6. Tu "Tarea" para hoy

Intenta modificar el script que hicimos antes para crear un programa que mueva una letra "A" por la pantalla usando las teclas O (izquierda) y P (derecha).

Pista de comandos:

    Inkey$: Lee la tecla pulsada.

    Over 1: Para que al imprimir una letra sobre otra no borre el fondo (o imprimir un espacio para borrar el rastro).

¿Te gustaría que te escriba el código base para ese movimiento de personaje y lo analizamos juntos?

Zxboriel se puede escribir en minúsculas?

¡Sí, totalmente! De hecho, escribir en minúsculas es la forma estándar y recomendada de usar ZXBasic (Boriel) hoy en día.

A diferencia del Spectrum original (donde los comandos eran "tokens" que siempre aparecían en mayúsculas al pulsar una tecla), Boriel es un compilador moderno. Aquí tienes los detalles:
1. No distingue entre mayúsculas y minúsculas

Para el compilador, estas tres líneas son exactamente lo mismo:

    PRINT "HOLA"

    Print "Hola"

    print "hola"

2. La ventaja de las minúsculas

La mayoría de los programadores que usan Boriel en openSUSE prefieren las minúsculas por varias razones:

    Legibilidad: Es mucho más descansado para la vista leer un código largo en minúsculas.

    Estilo moderno: Se parece más a lenguajes como Python, C o FreeBASIC.

    Diferenciación: Muchos usan mayúsculas para sus propias variables y minúsculas para los comandos del sistema (o al revés) para distinguir rápido qué es qué.
---

3. Ejemplo comparativo

Estilo "Retro" (Gritando):
Fragmento de código

10 BORDER 1: PAPER 7: INK 0: CLS
20 LET X = 10
30 PRINT AT 10, X; "HOLA"

Estilo "Boriel" (Moderno y limpio):
Fragmento de código

border 1
paper 7
ink 0
cls

dim x as ubyte = 10
print at 10, x; "hola"

4. Una excepción importante: Las etiquetas (Labels)

Aunque el lenguaje no distingue mayúsculas en los comandos, es una buena práctica ser consistente con las etiquetas de tus saltos (goto / gosub).

Si creas una etiqueta llamada Bucle_Principal:, intenta llamarla siempre igual, aunque el compilador probablemente te perdone si escribes goto bucle_principal.
5. Configuración en openSUSE

Si usas un editor como Kate o VSCodium en openSUSE, el resaltado de sintaxis (colores) funcionará perfectamente escribas como escribas. Los editores modernos suelen poner los comandos en un color (ej. azul) y tu texto en otro, sin importar si usas mayúsculas.

¿Te gustaría que hagamos el pequeño programa de mover la letra "A" con las teclas O y P usando solo minúsculas para que veas lo limpio que queda? Solo dímelo y te paso el código "estilo moderno".

Zxboriel. Hola mundo y factorial iterativo y factorial recursivo

¡Excelente! Vamos a ver estos tres ejemplos en ZXBasic (Boriel). Notarás que el factorial recursivo es donde Boriel realmente brilla frente al BASIC antiguo, ya que el Spectrum original no permitía recursividad real de forma sencilla.

Aquí tienes el código en formato moderno (minúsculas y sin números de línea).
1. Hola Mundo

El clásico, para verificar que tu build.sh en openSUSE funciona.
Fragmento de código

border 1
paper 7
ink 0
cls

print "Hola Mundo desde openSUSE!"
print "Presiona una tecla..."
pause 0

2. Factorial Iterativo

Este usa un bucle for. Es la forma más eficiente en un procesador Z80 porque no consume memoria de la pila (stack).
Fragmento de código

function factorial_iter(n as ubyte) as long
    dim i as ubyte
    dim res as long = 1
    
    if n = 0 then return 1
    
    for i = 1 to n
        res = res * i
    next
    
    return res
end function

' Prueba del programa
cls
dim n as ubyte = 5
print "Factorial Iterativo de "; n; " es:"
print factorial_iter(n)

3. Factorial Recursivo

Boriel permite que una función se llame a sí misma. Nota importante: La recursividad en el Spectrum es lenta y puede agotar la memoria si el número es muy grande, pero para aprender la lógica es perfecta.
Fragmento de código

function factorial_rec(n as ubyte) as long
    if n = 0 then 
        return 1
    else
        return n * factorial_rec(n - 1)
    end if
end function

' Prueba del programa
print
print "Factorial Recursivo de 5 es:"
print factorial_rec(5)

Cosas clave que debes saber:

    El tipo long: He usado as long (32 bits) para el resultado porque el factorial crece muy rápido. Un integer normal en el Spectrum solo llega hasta 32767, ¡y el factorial de 8 ya es 40320!

    ubyte para el contador: Como el Spectrum tiene poca memoria y un procesador de 8 bits, usar ubyte (0-255) para la variable n e i hace que el programa sea mucho más rápido que si usaras integer.

    Indentación: Fíjate que he usado espacios para "meter hacia adentro" el código de los if y for. A Boriel no le importa, pero a tus ojos sí (hace el código mucho más profesional).

¿Cómo probarlo todo junto?

Puedes copiar los tres bloques en un solo archivo .bas, añadir un pause 0 al final para que la pantalla no se cierre, y usar el script que creamos antes:
./build.sh programa.bas

¿Te gustaría que te explique cómo optimizar aún más el código usando fixed (punto fijo) o prefieres intentar hacer un programa que pida el número por teclado con input?

Haz los ejemplos con pcbasic y freebasic

Para cerrar el círculo, aquí tienes los tres ejemplos comparados en PC-BASIC (el estilo de 1985 con números de línea) y FreeBASIC (el estilo moderno de 32/64 bits).

Notarás que la mayor diferencia es cómo manejamos la recursividad, ya que el BASIC antiguo no la soportaba de forma nativa.
1. Hola Mundo
En PC-BASIC (Estilo GW-BASIC)
Basic

10 CLS
20 PRINT "HOLA MUNDO DESDE PC-BASIC"
30 END

En FreeBASIC (Estilo Moderno)
Fragmento de código

Cls
Print "Hola Mundo desde FreeBASIC"
Sleep ' Espera a que pulses una tecla

2. Factorial Iterativo (Bucle FOR)
En PC-BASIC

Aquí usamos una variable global F para el resultado y N para el número.
Basic

10 CLS
20 INPUT "Introduce un numero: ", N
30 F = 1
40 FOR I = 1 TO N
50 F = F * I
60 NEXT I
70 PRINT "El factorial es:"; F
80 END

En FreeBASIC

Usamos una función limpia y tipos de datos protegidos para evitar que el número se "desborde".
Fragmento de código

Function FactorialIter(n As Integer) As ULongInt
    Dim res As ULongInt = 1
    For i As Integer = 1 To n
        res *= i
    Next
    Return res
End Function

Print "Factorial de 10 (Iterativo):"; FactorialIter(10)

3. Factorial Recursivo

Aquí es donde está el gran cambio tecnológico.
En PC-BASIC (Simulación con GOSUB)

PC-BASIC no permite que una función se llame a sí misma. Para simularlo, los programadores antiguos usaban una "pila" manual o, más comúnmente, simplemente no lo hacían porque el GOSUB no crea variables nuevas cada vez.

    Nota: En PC-BASIC es mejor quedarse con la versión iterativa. Intentar hacer recursividad real requiere trucos muy complejos con POKE y PEEK.

En FreeBASIC (Recursividad Real)

FreeBASIC maneja la memoria de forma automática, permitiendo que la función se llame a sí misma elegantemente.
Fragmento de código

Function FactorialRec(n As Integer) As ULongInt
    If n <= 1 Then 
        Return 1
    Else
        Return n * FactorialRec(n - 1)
    End If
End Function

Print "Factorial de 5 (Recursivo):"; FactorialRec(5)
Sleep

