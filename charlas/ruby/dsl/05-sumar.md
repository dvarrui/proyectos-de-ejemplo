
# Un problema de SUMAR

## Los paréntesis no son obligatorios

```
def sumar(a, b)
  return(a+b)
end

c = sumar(3,4)
```

Los paréntesis son opcionales en Ruby.

```
def sumar(a,b)
  a+b
end

c = sumar 3, 4
```

---

## Número variable de argumentos

En este caso, *args* es un objeto Array, y dispone del método *each* para recorrer todos los elementos del mismo.

```
def sumar(*args)
  s = 0
  args.each { |i| s+= i }
  s
end
```

```
c = sumar 3, 2, 1, 1
```

> Seguimos viendo los [ejemplos de sumar](examples/sumar)
