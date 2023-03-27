[<<back](README.md)

# Ruby - Slicing Strings

You can return a range of characters by using the slice syntax. Specify the start index and the end index, separated by a colon, to return a part of the string.

```ruby
# Get 5 characters from position 6:
s = "Hello, World!"
puts s[6,5]
# => World
```

## Slice From the Start

```ruby
# Get 5 characters from position 0:
s = "Hello, World!"
puts s[0,5]
# => Hello
```

## Negative Indexing

Use negative indexes to start the slice from the end of the string:

```ruby
s = "Hello, World!"
puts s[-6,6]
# => World!
```
