[<<back](README.md)

# Ruby Numbers

Numeric clases in Ruby: Integer, Float and Complex.

Variables of numeric types are created when you assign a value to them:

```ruby
a = 6    # Integer
b = 1.6  # Float
c = 1i   # Complex
```

To verify the class of any object in Ruby, use the class method:

```ruby
puts a.class
puts b.class
puts c.class
```

## Integer

Integer is a whole number, positive or negative, without decimals, of unlimited length.

```ruby
a = 1
b = 35656222554887711
c = -3255522

puts a.class
puts b.class
puts c.class
```

## Float

Float, or "floating point number" is a number, positive or negative, containing one or more decimals.

```ruby
a = 16.11
b = 6.0
c = -13.04

puts a.class
puts b.class
puts c.class
```

Float can also be scientific numbers with an "e" to indicate the power of 10.
Example

```ruby
a = 35e3
b = 12E4
c = -87.7e100

puts a.class
puts b.class
puts c.class
```

## Complex

Complex numbers are written with a "i" as the imaginary part:

```ruby
a = 3+5i
b = 5i
c = -5i
```

## Class conversion

You can create a new class Object with the to_i, to_f, and to_c methods:

```ruby
a = 1    # Integer
b = 2.8  # Float
c = 1i   # Complex

x = a.to_f # from Integer to Float:
y = b.to_i # from Float to Integer:
z = a.to_c # from Integer to Complex:
```

Note: You can convert some Complex numbers into another number type.

```ruby
c = (6+0i)
c.class   #=> Complex
c.to_i    #=> 6

d = (6+1i)
d.class   #=> Complex
d.to_i    #=> can't convert 6+1i into Integer (RangeError)
```

## Random Number

Ruby have a Random class that can be used to make random numbers:

```ruby
rand      #=> Random number between 0 and 1
rand * 10 #=> Random number between 0 and 10
```

Exercise: Insert the correct syntax to convert a into a floating point number.

```
a = 6
a = a.????
```
