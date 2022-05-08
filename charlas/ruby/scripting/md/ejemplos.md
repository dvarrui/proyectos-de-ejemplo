
# Ejemplos

## i-am-username.sh

```bash
#/usr/bin/env bash

# SI poner espacios es un problema de sintaxis: name = $(whoami)
name=$(whoami)         
rol=$1

# NO poner espacios es un problema de sintáxis: if [$name == 'root']
# NO poner espacios es un problema de semántica: if [ $name=='root' ]
if [ $name == 'root' ]
then
  echo "root is not valid user!"
  exit 1
fi

echo "[$rol] My name is $name"
exit 0
```

## i-am-username.rb

```ruby
#/usr/bin/env ruby

name = %x(whoami) # name = `whoami`
rol  = ARGV[0] || 'unkown'

if name == 'root'
  puts "root is not valid user!"
  exit 1
end

puts "[#{rol}] My name is #{name}"
exit 0
```
