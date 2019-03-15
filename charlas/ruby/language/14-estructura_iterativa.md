
# I Love Ruby

![](./images/caminar.png)

---

# Estructura iterativa (II): iterar

Ejemplo 1:

```
# Estilo Ruby
# Iterar usando bloques con métodos POO
10.times do |i|
  puts i
end
```

* <times> es un método del objeto <10>
* <each> es un método
* do ... end es un bloque.

---

Ejemplo 2:

```
# Iterar usando bloques con métodos POO
(0..9).each { |i| puts i }
```

* (0..9) es un objeto de tipo Range
* { ... } es un bloque
* Los bloques son objetos también.

El uso de los bloques permite aplicar el paradigma funcional (al menos en parte).

> ¡El estilo Ruby!

---

# Estructura iterativa (III): los arrays

Ejemplo 1:

```
a = Array.new
a << 4
a << 5
a << 6

puts a
```
* <a> es [3,14,27]
* <a> es un objeto Array

---

Ejemplo 2:

```
# Iterar usando bloques con métodos POO
a = [3, 14, 27]
a.each do |i|
  puts i
end
```

* <each> es un método del objeto a
* <a> es un objeto Array
* Estilo de programación funcional.

> El iterador por todas partes...

```
# Iterar usando bloques con métodos POO
[3, 14, 27].each { |i| puts i }
```
