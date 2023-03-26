[<<back](README.md)

# Ruby Casting

There may be times when you want to specify a class(type) on to a variable. This can be done with casting. Ruby is an object-orientated language, and as such it uses classes to define data types, including its primitive types.

Casting in python is therefore done using `to_XXX` methods or constructors:

* Integer(X): constructs an integer number from an integer literal, a float literal (by removing all decimals), or a string literal (providing the string represents a whole number)
* Float(X): constructs a float number from an integer literal, a float literal or a string literal (providing the string represents a float or an integer)
* String(X): constructs a string from a wide variety of data types, including strings, integer literals and float literals

```ruby
# Integers:
x = Integer(1)   # x will be 1
y = Integer(2.8) # y will be 2
z = Integer("3") # z will be 3

x = 1            # x will be 1
y = 2.8.to_i     # y will be 2
z = "3".to_i     # z will be 3
```

```ruby
# Floats:
x = Float(1)     # x will be 1.0
y = Float(2.8)   # y will be 2.8
z = Float("3")   # z will be 3.0
w = Float("4.2") # w will be 4.2

x = 1.to_f       # x will be 1.0
y = 2.8.to_f     # y will be 2.8
z = "3".to_f     # z will be 3.0
w = "4.2".to_f   # w will be 4.2
```

```ruby
# Strings:
x = String(:s1)  # x will be 's1'
y = String(2)    # y will be '2'
z = String(3.0)  # z will be '3.0'

x = :s1.to_s     # x will be 's1'
y = 2.to_s       # y will be '2'
z = 3.0.to_s     # z will be '3.0'
```
