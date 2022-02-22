#!/usr/bin/env elixir

defmodule Loop do
  def print(0), do: :ok

  def print(n) do
    print(n - 1)
    IO.puts("Number #{n}")
  end

  def print_reverse(0), do: :ok

  def print_reverse(n) do
    IO.puts("Number #{n}")
    print(n - 1)
  end
end

Loop.print(10)
Loop.print_reverse(10)
