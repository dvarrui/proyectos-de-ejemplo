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

  def same
    top
  end
end

class Queue
  def front
    "Queue.front()"
  end

  def same
    front
  end
end

# v = Stack.new
v = Queue.new

puts v.same

