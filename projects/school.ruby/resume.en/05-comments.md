
# Ruby Comments

* Comments can be used to explain Ruby code.
* Comments can be used to make the code more readable.
* Comments can be used to prevent execution when testing code.

```
(Código sostenible - Página 280 - Carlos Blé)

Hoy en día, los comentarios ya no son necesarios para explicar lo que hace el código,
sino para contar aquellas cosas que el propio código no puede contar por sí mismo.

Tenemos todas las herramientas necesarias para escribir código autoexplicativo, que se
pueda entender como un manual.

La fuente de la verdad está en el código, no en los comentarios
(porque no se ejecutan y siempre compilan)

...los comentarios suelen estar obsoletos o ser imprecisos/inútiles, haciéndome
perder tiempo o confundiéndome más todavía.

Los comentarios se quedan obsoletos muy pronto; con el paso del tiempo, el código
cambia, pero nadie se toma la molestia de actualizar el comentario.

(Página 282)

Cuando un API es buena, no necesitamos leer su documentación, se cae de maduro el uso.
```

## Creating a Comment

Comments starts with a #, and Ruby will ignore them. It is also recommended to leave a space after the `#` symbol.:

```ruby
# This is a comment
puts("Hello, World!")
```

Comments can be placed at the end of a line, and Ruby will ignore the rest of the line:

```ruby
puts("Hello, World!") # This is a comment
```

Comments should not explain the code because then it is a sign that the code is not well written. Comments should be directed at documenting the code, not commenting on it.

```ruby
# puts "Hello, World!"
puts "Cheers, Mate!"
```

## Special comment line

Normally all scripting languages have a special commented line at the beginning of the script (SheBang) that indicates which program will be responsible for interpreting and executing the code in the file.

```ruby
#!/usr/bin/env ruby

puts "Hello World!"
```

## Multiline Comments

In Ruby you can make multiline comments in several ways.

**Mode 1 (Preferred mode)**: To add a multiline comment you could insert a # for each line:

```ruby
##
# This is a comment
# written in more than just one line
# most people
# do this

puts "Using # symbol"
```

**Mode 2**: Writing comments between `=begin` and `=end` keywords:

```ruby
=begin
Every body mentioned this way
to have multiline comments.

The =begin and =end must be at the beginning of the line or
it will be a syntax error.
=end

puts "Using =begin and =end keywords"
```

**Mode 3**: Using multiline string. As long as the string is not assigned to a variable, Ruby will read the code, but then ignore it, and you have made a multiline comment.

```ruby
<<-DOC
Also, you could create a docstring.
which...
DOC

puts "Using multine string value not assigned to a variable"
```

```ruby
"..is kinda ugly and creates
a String instance, but I know one guy
with a Smalltalk background, who
does this."

puts "Using multine string value not assigned to a variable"
```

**Mode 4:** Using `__END__` keyword.

```ruby
pus "Using __END__ keyword"

__END__

But all forgot there is another option.
Only at the end of a file, of course.
```

> Exercise: Comments in Ruby are written with a special character, which one?
