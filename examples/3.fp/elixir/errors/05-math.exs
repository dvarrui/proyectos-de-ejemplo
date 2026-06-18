#!/usr/bin/env elixir

defmodule MathTest do
  use ExUnit.Case, async: true

  test "can add two numbers" do
    assert 1 + 1 == 2
  end
end
