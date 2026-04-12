[<< back](./README.md)

```
BASIC
```

# 2. FreeBASIC/QuickBASIC (Moderno)

Instalación
- Ve a la página oficial de FreeBASIC y descarga el binario para Linux.
- O busca en software.opensuse.org para instalarlo con un clic.

# 2.1 Características

* Compilar ejecutables rápidos y compatibles con código viejo.
* Consultar la wiki de FreeBASIC para más información.
* Es la opción para crear software real hoy en día usando la sintaxis sencilla de BASIC. Permite usar librerías modernas (gráficos 3D, redes, etc.).
* Puedes crear programas que no necesitan BASIC para funcionar; generas un binario que corre solo en cualquier Linux.
* Funciones modernas: Soporta punteros, programación orientada a objetos y multihilo.
* Compilador (Crea un archivo .exe o binario).
* Estilo Moderno (Años 90 en adelante, tipo QuickBASIC).
* Compatible con QuickBASIC 4.5 y funciones de C.
* Muy rápido (similar a C++).

* FreeBASIC permite usar librerías de C.

## 2.2 Estructuras

* Números de línea Opcionales (Usa etiquetas y funciones).
* Repetir un bloque	Do ... Loop
* Contar repeticiones	For ... Next
* Agrupar lógica	Sub o Function (Procedimientos)
* FreeBASIC no es sensible a mayúsculas y minúsculas (case-insensitive) para sus palabras clave (keywords).
    * Sin embargo, hay una convención visual que la mayoría de los programadores siguen para que el código sea más legible.
    * CamelCase (El más común hoy): Print, Input, If...Then. Es el que usé en el ejemplo anterior porque es el estándar moderno de lenguajes como Python o Java.
    * TODO MAYÚSCULAS: PRINT, GOTO, DIM. Es el estilo "Retro" que viene de la época de las máquinas de escribir y el BASIC original. Se usa mucho si quieres que tu código parezca de los 80.
    * Todo minúsculas: print, if, do. Es común entre quienes vienen de C o de entornos Linux donde casi todo es en minúsculas.
* Uso de GOTO con Etiquetas (Labels)

## 2.3 Ejemplos

Ejemplo 1: `hola.bas`.

```
PRINT "¡Hola desde openSUSE!"
PRINT "Presiona una tecla para salir..."
SLEEP
```

* `fbc hola.bas`, para compilar.
* `./hola`, para ejecutar.

Ejemplo 2: `nombre.bas`.

```
Dim nombre As String
Do
    Input "Dime tu nombre: ", nombre
    Print "Hola " & nombre
Loop Until nombre = "salir"
```

Ejemplo 3: `calculadora.bas`.

```
' Declaración de variables (en FreeBASIC es mejor definir el tipo)
Dim As Double precio, iva, total
Dim As String respuesta

Do
    Cls
    Print "--- CALCULADORA DE IVA (21%) ---"
    Print "--------------------------------"

    Input "Introduce el precio base: ", precio

    ' Realizamos los cálculos
    iva = precio * 0.21
    total = precio + iva

    ' Mostramos los resultados
    Print
    Print "El IVA calculado es: "; iva
    Print "El precio total es:   "; total
    Print

    ' Preguntamos si quiere seguir
    Input "Quieres calcular otro? (S/N): ", respuesta

' El bucle se repite mientras la respuesta sea "s" o "S"
Loop Until LCase(respuesta) <> "s"

Print "¡Gracias por usar el programa!"
Sleep 2000 ' Espera 2 segundos antes de cerrar
```

* `fbc calculadora.bas`, compilar.
* `./calculadora`, ejecutar.

Ejemplo 4: Bucle inifinito.

```
Comienzo:
    Print "Este mensaje se repetira infinitamente"
    Print "Presiona Ctrl+C para detenerlo en la terminal"
    
    Goto Comienzo
```

Ejemplo 5: con números de línea.

```
10 Print "Hola al estilo 1985"
20 Goto 10
```

Para que funcione hay que compilarlo con `fbc -lang qb mi_programa.bas`.

## 2.4 Estilos

Estilo clásico:

```
Input "Dame un numero positivo: ", x
If x < 0 Then Goto Pregunta
Print "Gracias"
```

Estilo Moderno:

```
Do
    Input "Dame un numero positivo: ", x
Loop Until x >= 0
Print "Gracias"
```

Se puede usar el GOTO para salir de varios bucles anidados:

```
For i = 1 To 100
    For j = 1 To 100
        If ErrorCritico Then Goto ErrorFatal
    Next
Next

ErrorFatal:
Print "Algo salio muy mal. Cerrando..."
```
