#!/usr/bin/env elixir

defmodule Say do
   def hello do
       IO.puts "Hello World!"
   end
end

Say.hello

# iex(1)> c("01-hello-module.exs")
# [Say]
# iex(2)> Say.hello
# Hello World!
