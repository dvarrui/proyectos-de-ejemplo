#!/usr/bin/env elixir
#
# https://elixir-lang.org/getting-started/alias-require-and-import.html
#

# Import functions from Foo so they can be called without the `Foo.` prefix
# import Foo
#

import Klause

IO.puts "[ info ] odd? 1, 2"
IO.puts is_odd 1
IO.puts is_odd 2

IO.puts "[ info ] even? 1, 2"
IO.puts is_even 1
IO.puts is_even 2
