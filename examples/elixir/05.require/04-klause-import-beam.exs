#!/usr/bin/env elixir
#
# https://elixir-lang.org/getting-started/alias-require-and-import.html
#

# Alias the module so it can be called as Bar instead of Foo.Bar
# alias Foo.Bar, as: Bar
#
# IMPORTANTE!!!: elixirc lib/klause-lib.exs

require Klause
alias Klause, as: Math

IO.puts "[ info ] odd? 1, 2"
IO.puts Math.is_odd 1
IO.puts Math.is_odd 2

IO.puts "[ info ] even? 1, 2"
IO.puts Math.is_even 1
IO.puts Math.is_even 2
