[<< back](README.md)

# Arrays


| Acción                      | Python           | Ruby             |
| --------------------------- | ---------------- | ---------------- |
| Crear array                 | a = [11, 12, 13] | a = [11, 12, 13] |
| Devuelve el primer elemento | a[0]             | a[0], a.first    |
| Devuelve el último elemento | a[-1]            | a[-1], a.last    |
| Añade un nuevo elemento     | a.append(14)     | a.append(14), a << 14, a[3]=14 |
| Tamaño del array            | len(a)           | a.size, a.length |

En Ruby, como los Array son objetos, se hace uso de los métodos del propio objeto para averiguar su tamaño. Como los metodos size y length (En Ruby los paréntesis no son obligatorios).

En cambio en Python se prefiere invocar a una función externa para devolver el tamaño del array, aunque existe el método "oculto" del objeto. Esto es `a.__len__()`.

> Función len vs método length

# String

| Acción                    | Python            | Ruby              |
| ------------------------- | ----------------- | ----------------- |
| Definir un string         | s = "Hello world" | s = "Hello world" |
| Tamaño de un string       | len(s)            | s.size, s.length  |
| Dividir una cadena        | words = s.split() | words = s.split() |
| Unir un array en una cadena | ','.join(words) | words.join(",")   |

Para Ruby el join de un Array es invocar a un método del objeto Array.

En Python, un join de un Array es invocar a un método del objeto String.

> Método join en clases diferentes (String vs Array)

| Acción                      | Python        | Ruby              |
| --------------------------- | ------------- | ----------------- |
| Crear array                 | i = [1,2,3]   | i = [1,2,3]       |
| Unir un array en una cadena | ???           | i.join(",")   |

Ruby sigue el mismo camino que en el paso anterior. Un método join del objeto Array se encarga de realizar el trabajo.
