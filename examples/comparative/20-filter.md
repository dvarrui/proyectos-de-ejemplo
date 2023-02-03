
# Filtrado

Veamos un ejemplo el que se crea una nueva lista a partir de filtrar resultados de otra. Primero lo haremos con bucles:

```python
# Python ejemplo con bucles

fruits = ["apple", "banana", "cherry", "kiwi", "mango"]
newlist = []

for x in fruits:
  if "a" in x:
    newlist.append(x)

print(newlist)
```

```ruby
# Ruby ejemplo con bucles

fruits = ["apple", "banana", "cherry", "kiwi", "mango"]
newlist = []

for x in fruits do
  newlist.append(x) if x.contains? "a"
end

puts(newlist)
```

Ahora vamos a ver un ejemplo usando una característica llamada "List Comprehension" de Python.

```python
# Python ejemplo 2
fruits = ["apple", "banana", "cherry", "kiwi", "mango"]

newlist = [x for x in fruits if "a" in x]

print(newlist)
```

Ruby realiza el filtrado con el propio método `filter` o `select` del Array.

```ruby
# Ruby ejemplo 2
fruits = ["apple", "banana", "cherry", "kiwi", "mango"]

newlist = fruits.select { |x| x.include?("a") }

puts(newlist)
```

```ruby
# Ruby ejemplo 3
fruits = ["apple", "banana", "cherry", "kiwi", "mango"]

newlist = fruits.filter { _1.include? "a" }

puts(newlist)
```
