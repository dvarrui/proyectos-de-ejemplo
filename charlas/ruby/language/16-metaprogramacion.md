
# I Love Ruby

![](./images/iloveruby.png)

---

# Metaprogramación

`Programas que escriben programas`... pero... con matices.

Enlaces de interés:
* https://www.leighhalliday.com/ruby-metaprogramming-creating-methods

## Wikipedia: Metaprogramación

La metaprogramación consiste en escribir programas que escriben o manipulan otros programas (o a sí mismos) como datos, o que hacen en tiempo de compilación parte del trabajo que, de otra forma, se haría en tiempo de ejecución. Esto permite al programador ahorrar tiempo en la producción de código.

Un ejemplo sencillo de un metaprograma sería este script de Bash:

```
#!/bin/bash
# metaprogram
echo '#!/bin/bash' >program
for ((I=1; I<=992; I++)); do
   echo "echo $I" >>program
done
chmod +x program
```

---

# Reflexividad

```
$ irb

irb(main):001:0> a=[1,2,3]
=> [1, 2, 3]

irb(main):002:0> a.class
=> Array

irb(main):003:0> a.public_methods.sort
=> [:!, :!=, :!~, :&, :*, :+, :-, :<<, :<=>, :==, :===, :=~, :[], :[]=, :__id__, :__send__, :all?, :any?, :append, :assoc, :at, :bsearch, :bsearch_index, :chunk, :chunk_while, :class, :clear, :clone, :collect, :collect!, :collect_concat, :combination, :compact, :compact!, :concat, :count, :cycle, :define_singleton_method, :delete, :delete_at, :delete_if, :detect, :dig, :display, :drop, :drop_while, :dup, :each, :each_cons, :each_entry, :each_index, :each_slice, :each_with_index, :each_with_object, :empty?, :entries, :enum_for, :eql?, :equal?, :extend, :fetch, :fill, :find, :find_all, :find_index, :first, :flat_map, :flatten, :flatten!, :freeze,
...
```

---

## Metaprogramar de forma dinámica
