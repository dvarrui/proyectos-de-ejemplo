#!/usr/bin/env ruby
require "debug"
class Execute
  def initialize

  end

  def ruby(code)
    system("ruby -e '#{code}'")
  end

  def python(code)
    system("python -c '#{code}'")
  end
end

execute = Execute.new

code = <<~CODE
 puts "Hola, soy Ruby!"
CODE
execute.ruby(code)

code = <<~CODE
  print("Hola, soy Python!")
CODE
execute.python(code)
