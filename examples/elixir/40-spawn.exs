#!/usr/bin/env elixir

spawn(fn -> IO.puts "Hello, World!" end) |> Process.info(:memory)
