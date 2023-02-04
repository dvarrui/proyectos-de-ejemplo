[<< back](README.md)

# Ruby Variables

Variables are containers for storing data values. Ruby has no command for declaring a variable. A variable is created the moment you first assign a value to it.

```ruby
x = 5
y = "John"
puts x
puts y
```

Variables do not need to be declared with any particular type, and can even change type after they have been set.

```Ruby
x = 4       # x is of type int
x = "Sally" # x is now of type str
puts x
```

## Casting

All Ruby data are objects so every data (object) has methods. If you want to change the data type (object), this can be done using object methods.

```ruby
x = 3.to_s    # x will be '3'
y = 3.to_i    # y will be 3
z = 3.to_f    # z will be 3.0
```

## Get the Type

You can get the data type of a variable with the `class` method.

```Ruby
x = 5
y = "John"
puts x.class
puts y.class
```

You will learn more about data classes and casting later.

## Single or Double Quotes?

String variables can be declared either by using single or double quotes:

```ruby
x = "John"
# is the same as
x = 'John'
```

## Case-Sensitive

Variable names are case-sensitive. This will create two variables:

```ruby
a = 4
A = "Sally"
# A will not overwrite a
```
