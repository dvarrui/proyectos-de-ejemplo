
# Haskell

Haskell es un lenguaje funcional puro, declarativo y con tipos estáticos.
Veamos unos ejemplos para hacernos una idea.

## Ejemplo 1

Obtener 10 números pares a partir del 42.

**Haskell**: Filtra los números pares desde el 43 en adelante, y coge 10.
O coge 10 números después de filtrar los pares de la secuencia 43 a infinito.

```haskell
> take 10 (filter even [43..])
[44,46,48,50,52,54,56,58,60,62]
```

**Ruby**: Ruby es un lenguaje imperativo POO pero los métodos de sus objetos permiten escribir el código imperativo en un estilo que nos "recuerda" la solución funcional de Haskell. Veamos:

```ruby
(43..).lazy.select(&:even?).take(10).to_a  
=> [44, 46, 48, 50, 52, 54, 56, 58, 60, 62]
```

Esto es, tengo un rango de valores desde 43 hasta el infinito y quiero seleccionar (lazy = no lo calculo inmediatamente sino cuando sea necesario) los que devuelven `true` al enviarles el mensaje (o invocar método) `even?`. Los objetos (números) que sean pares devolverán `true`. Luego a ese resultado le voy a coger 10 elementos y finalmente los devuelvo como un Array.

**Ruby2**: Una forma más imperativa u estructurada de hacer la misma tarea sería la siguiente:

```ruby
numbers = []
i = 43
while numbers.size < 10
  if i % 2 == 0
    numbers << i
  end
  i += 1
end

>> numbers
=> [44, 46, 48, 50, 52, 54, 56, 58, 60, 62]
```

**Ruby3**: Ahora una forma imperativa pero usando más la POO, los iteradores y los objetos bloques (Proc).

```ruby
numbers = []

(43..).each do |i|
  numbers << i if i.even?
  break if numbers.size == 10
end
```

## Ejemplo 2: Números primos

primes = filterPrime [2..] where
  filterPrime (p:xs) =
    p : filterPrime [x | x <- xs, x `mod` p /= 0]
