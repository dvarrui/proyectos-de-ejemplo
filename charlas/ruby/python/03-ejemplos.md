
# Similitudes: Ejemplos

## Hola mundo!

Python:
```python
print "Hola mundo!"
```

Ruby:
```ruby
print "Hola mundo!"
```

---

## Condicionales

Python:
```python
import sys
edad = int(sys.argv[1])

if edad >= 18:
    print("Eres MAYOR de edad")
else:
    print("Eres MENOR")
```

Ruby:
```ruby
edad = ARGV[0].to_i

if edad >= 18
  puts "Eres MAYOR de edad"
else
  puts "Eres MENOR"
end
```

---

## Funciones

```python
import sys

def mayor_de_edad(edad):
    if int(edad) >= 18:
        return "Eres MAYOR de edad"
    return "Eres MENOR"

print mayor_de_edad(sys.argv[1]))
```

```ruby
def mayor_de_edad(edad)
  return "Eres MAYOR de edad" if edad.to_i >= 18
  "Eres MENOR"
end

puts mayor_de_edad ARGV[0]
```
