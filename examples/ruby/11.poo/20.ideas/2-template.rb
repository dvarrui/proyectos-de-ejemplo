#!/usr/bin/env ruby

# IDEA:
#
# template <class T>
# etiqueta E;
# if T is Stack { E = top() }
# if T is Queue { E = front() }
# 
# void MostrarPrimerElemento {
#   T lista;
#   cout << lista.E ;
# }
#

class Stack
  def top
    "Stack.top()"
  end
end

class Queue
  def front
    "Queue.front()"
  end
end

# v = Stack.new
v = Queue.new

if v.is_a?(Stack)
  m = :top
elsif v.is_a?(Queue)
  m = :front
else
  puts "Error"
  exit 1
end

puts v.send(m)

