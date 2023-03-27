[<<back](README.md)

# Assign String to a Variable

Assigning a string to a variable is done with the variable name followed by an equal sign and the string:

```ruby
a = "Hello"
puts a
```

## Multiline Strings

You can assign a multiline string to a variable by using three quotes:

```ruby
a = <-STR
String
Multiline
example
STR
```

```ruby
b = "String
Multiline
example"
```

> Note: in the result, the line breaks are inserted at the same position as in the code.

## Strings are Arrays

Like many other popular programming languages, strings in Ruby are arrays of bytes representing unicode characters.

However, Ruby does not have a character data type, a single character is simply a string with a length of 1.

Square brackets can be used to access elements of the string.

Example, get the character at position 1 (remember that the first character has the position 0):

```ruby
a = "Hello, World!"
puts a[1] #=> e
```

## Looping Through a String

Since strings are arrays, we can loop through the characters in a string, with a for loop.
Example

Loop through the letters in the word "banana":

```ruby
for c in "banana".chars do
  puts c
end
```

> Learn more about For Loops in our Python For Loops chapter.

## String Length

To get the length of a string, use:
* length method: Returns the count of characters (not bytes).
* size method: is an alias for length.    

```ruby
a = "Hello, World!"
puts a.length       # => 13

"\x80\u3042".length # => 2            
"hello".length      # => 5                 
```

## Check String

To check if a certain phrase or character is present in a string, we can use the keyword `include?`.

```ruby
# Check if "free" is present in the following text:
txt = "The best things in life are free!"
puts txt.include? "free"
```

```ruby
# Print only if "free" is present:
txt = "The best things in life are free!"
if txt.include? "free"
  puts "Yes, 'free' is present."
end
```

Learn more about If statements in our Ruby If...Else chapter.

## Check if NOT

To check if a certain phrase or character is NOT present in a string, we can use the keyword not include?.

```ruby
# Check if "expensive" is NOT present in the following text:
txt = "The best things in life are free!"
puts "Not present" unless txt.include? "expensive"
```
