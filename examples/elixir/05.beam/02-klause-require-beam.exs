#!/usr/bin/env elixir
#
# https://elixir-lang.org/getting-started/alias-require-and-import.html
#

# Alias the module so it can be called as Bar instead of Foo.Bar
# alias Foo.Bar, as: Bar
#
# Invokes the custom code defined in Foo as an extension point
# use Foo
#
# Load functions from Foo
# require Foo
#
# IMPORTANTE!!!: elixirc lib/clause-lib.exs
require Klause

IO.puts "[ info ] odd? 1, 2"
IO.puts Klause.is_odd 1
IO.puts Klause.is_odd 2

IO.puts "[ info ] even? 1, 2"
IO.puts Klause.is_even 1
IO.puts Klause.is_even 2
