
# I love ruby

![](images/iloveruby.png)

---

# Variables locales

## Integer y Float
```
age   = 42            # Integer
price = 9.99          # Float
42.to_s               # "42"
```

---

## String

String es un tipo de datos... pero es una clase. Y todos los Strings son objetos, con sus propios métodos ("TODO es un objeto en Ruby").

```
name = "David"        # String
name.upcase           # DAVID
name + "ubi"          # Davidubi
name.gsub('v','b')    # Dabid
name.chars            # ["D", "a", "v", "i", "d"]
"16".to_i             # 16
```

```
puts "My name is #{name}. I'm #{age} years old."
```

---

## Symbol

Los símbolos son como Strings inmutables, o como campos Enum de C con valores constantes. Pero también son objetos.

```
a = "hola"    #=> "hola"
b = "hola"    #=> "hola"
b.class       #=> String
a==b          #=> true

a.object_id == b.object_id  #=> false
a.object_id   #=> 47008196880100
b.object_id   #=> 47008196911520

c = :hello    #=> :hello
d = :hello    #=> :hello
d.class       #=> Symbol
c == d        #=> true
c.object_id == d.object_id  #=> true
```
---

## Array

```
jedis = [ 'obiwan', 'yoda', 'quigon'] # Array
jedis.size                            # 3
jedis[1]                              # yoda

numbers = []       # []
numbers << 16      # [16]
numbers << 11      # [16, 11]
numbers << 70      # [16, 11, 70]

```

---

## Hash

```
me    = { name: 'david', age: 42 }       # Hash
me    = { :name => 'david', :age => 42 } # Hash
```

---

## Otros

* Variables globales: `$PROGRAMNAME`
* Variables de instancia: `@name`
* Variables de clase: `@@id`
* Constantes: `VERSION=3`
