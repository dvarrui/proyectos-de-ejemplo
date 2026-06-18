#!/usr/bin/env elixir
#
# https://elixir-lang.org/getting-started/alias-require-and-import.html
#
# IMPORTANTE!!!: elixirc lib/clause-lib.exs

require Klause

IO.puts "[ info ] odd? 1, 2"
IO.puts Klause.is_odd 1
IO.puts Klause.is_odd 2

IO.puts "[ info ] even? 1, 2"
IO.puts Klause.is_even 1
IO.puts Klause.is_even 2
