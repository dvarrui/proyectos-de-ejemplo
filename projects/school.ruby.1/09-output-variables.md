[<<back](README.md)

# Ruby - Output Variables

The Ruby puts method is often used to output variables.

```ruby
a = "I love Ruby"
puts a
```

In the puts method, you output multiple variables, separated by a comma:

```ruby
a = "I"
b = "love"
c = "Ruby"
puts a, b, c
```

You can also use the + operator to output multiple variables:

```ruby
a = "I "
b = "love "
c = "Ruby"
puts a + b + c
```

> Notice the space character after "I " and "love ", without them the result would be "IloveRuby".

For numbers, the + character works as a mathematical operator:

```ruby
x = 5
y = 10
puts x + y
```

In the puts method, when you try to combine a string and a number with the + operator, Ruby will give you an error:

```ruby
a = 6
b = "Obiwan"
puts a + b

# => `+': String can't be coerced into Integer (TypeError)
```

The best way to output multiple variables in the puts method is to separate them with commas, which even support different data types:

```ruby
a = 6
b = "Obiwan"
puts a , b
```
