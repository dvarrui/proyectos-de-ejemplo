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
# Import functions from Foo so they can be called without the `Foo.` prefix
# import Foo
#
# IMPORTANTE: elixirc lib/11-clause-lib.exs
import Clause

IO.puts "[ info ] odd? 1, 2"
IO.puts is_odd 1
IO.puts is_odd 2

IO.puts "[ info ] even? 1, 2"
IO.puts is_even 1
IO.puts is_even 2
