
# Un problema

Vamos a plantearnos un problema, e intentar resolverlo u optimizarlo haciendo uso de DSL con Ruby. Por el camino iremos viendo cómo los resolvemos con Ruby.

---

# Los paréntesis no son obligatorios

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

# Número variable de argumentos

En este caso, *args* es un objeto Array, y dispone del método *each* para recorrer todos los elementos del mismo.

```
def sumar(*args)
  s = 0
  args.each { |i| s+= i }
  s
end

c = sumar 3, 2, 1, 1
```
