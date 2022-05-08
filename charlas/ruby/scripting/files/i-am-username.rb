#/usr/bin/env ruby

name = %x(whoami) # name = `whoami`
rol  = ARGV[0] || 'unkown'

if name == 'root' 
  puts "root is not valid user!"
  exit 1
end

puts "[#{rol}] My name is #{name}"
exit 0

