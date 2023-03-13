[<<back](README.md)

# Ruby - Modify Strings

Ruby has a set of built-in methods that you can use on Strings.

## Upper Case

The upcase method returns the string in upper case:

```ruby
a = "Hello, World!"
puts a.upcase
```

## Lower Case

The downcase method returns the string in lower case:

```ruby
a = "Hello, World!"
puts a.downcase
```

## Remove Whitespace

Whitespace is the space before and/or after the actual text, and very often you want to remove this space.

The strip method removes any whitespace from the beginning or the end:

```ruby
a = " Hello, World! "
puts a.strip # returns "Hello, World!"
```

## Replace String

The gsub method replaces a string with another string:

```ruby
a = "Hello, World!"
puts a.gsub("H", "J")
```

## Split String

The split method returns a list where the text between the specified separator becomes the list items.

The split() method splits the string into substrings if it finds instances of the separator:

```ruby
a = "Hello, World!"
puts a.split(",") # returns ['Hello', ' World!']
```
