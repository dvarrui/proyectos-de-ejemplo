#!/usr/bin/env elixir

case {1, 2, 3} do
  {4, 5, 6} ->
    IO.puts "case: This clause won't match"
  {1, _x, 3} ->
    IO.puts "case: This clause will match and bind x to 2 in this clause"
   _ ->
    IO.puts "case: This clause would match any value"
end

cond do
  2 + 2 == 5 ->
    IO.puts "cond: This will not be true"
  2 * 2 == 3 ->
    IO.puts "cond: Nor this"
  1 + 1 == 2 ->
    IO.puts "cond: But this will"
end

if nil do
  IO.puts  "if: This won't be seen"
else
  IO.puts "if: This will"
end

