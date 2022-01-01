
[<< back](13-estructura_iterativa.md)|[next>>](15-iteradores.md)

# I Love Ruby

---

# Bloques?

Enlace de interés:
* https://www.tutorialspoint.com/ruby/ruby_blocks.htm

¿Qué son los bloques? ... son objetos y además "trozos" de código.

```
#!/usr/bin/ruby

def test(&block)
   block.call
end

test { puts "Hello World!"}
```

---

## Mostrar 2 veces "I love Ruby!"

```
class MyIterator
  def initialize(times)
    @times = times
  end

  def each(block)
    i = 0
    while(i<@times)
      puts "[#{i}] Executing block"
      block.call
      i += 1
    end
  end
end

p = Proc.new{ puts "I love Ruby!" }
i = MyIterator.new(3)
i.each(p)
```

---

```
class MyIterator
  def initialize(times)
    @times = times
  end

  def each(&block)
    i = 0
    while(i<@times)
      puts "[#{i}] Executing block"
      block.call
      i += 1
    end
  end
end

i = MyIterator.new(3)
i.each { puts "I love Ruby!"  }
```

---

```
class MyIterator
  def initialize(times)
    @times = times
  end

  def each
    i = 0
    while(i<@times)
      puts "[#{i}] Executing block"
      yield
      i += 1
    end
  end
end

i = MyIterator.new(3)
i.each { puts "I love Ruby!"  }
```

---

# Conclusión

```
3.times { puts "I love Ruby!" }
```

[<< back](13-estructura_iterativa.md)|[next>>](15-iteradores.md)
