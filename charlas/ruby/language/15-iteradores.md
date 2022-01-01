
[<< back](14-bloques.md)|[next>>](16-metaprogramacion.md)

# I Love Ruby

---

# Bucles

Interador de un array:

```
jedis = [ 'obiwan', 'yoda', 'quigon']

jedis.each do |name|
  puts name
end
```

Salida:
```
obiwan
yoda
quigon
```

---

Iterador de un Hash:

```
me = { :name => 'david', :age => 42 }

me.each do |key,value|
  puts "Param <#{key}> with <#{value}> value."
end
```

Salida:

```
Param <name> with <David> value.
Param <age> with <42> value.
```

[<< back](14-bloques.md)|[next>>](16-metaprogramacion.md)
