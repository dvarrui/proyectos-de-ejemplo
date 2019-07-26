
# Similitudes: Ejemplos

## Hola mundo!

Python:
```
print "Hola mundo!"
```

Ruby:
```
print "Hola mundo!"
```

---

## Condicionales

Python:
```
import sys
edad = int(sys.argv[1])

if edad >= 18:
    print("Eres MAYOR de edad")
else:
    print("Eres MENOR")
```

Ruby:
```
edad = ARGV[0].to_i

if edad >= 18
  puts "Eres MAYOR de edad"
else
  puts "Eres MENOR"
end
```

---

## Funciones

Python:
```
import sys

def mayor_de_edad(edad):
    if int(edad) >= 18:
        return "Eres MAYOR de edad"
    return "Eres MENOR"

print mayor_de_edad(sys.argv[1]))
```

Ruby:
```
def mayor_de_edad(edad)
  return "Eres MAYOR de edad" if edad.to_i >= 18
  "Eres MENOR"
end

puts mayor_de_edad ARGV[0]
```

---

## Bucles/iteradores

Python:
```
i=0
while i<10:
	print "Bucle",i
	i+=1

for i in range(0,10):
	print "Iterador",i

for i in [1,3,5,7]:
  	print "Array",i
```

Ruby:
```
i=0
while i<10
  puts "Bucle #{i}"
  i+=1
end

for i in 0..9
  puts i
end

[1,3,5,7].each do |i|
  puts "Array #{i}"
end

```
