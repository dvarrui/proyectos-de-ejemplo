#!/usr/bin/env ruby

# ----- Definitions -----

def exec_code_v1
  yield
end

def exec_code_v2(&block)
  block.call
  puts block.class
  puts block.lambda?
end

code_v2 = ->() { puts "==> Executing code v3" }

# ----- Execute -----

exec_code_v1 { puts "==> Executing code v1" }
exec_code_v2 { puts "==> Executing code v2" }
code_v2.call
puts code_v2.class
puts code_v2.lambda?

