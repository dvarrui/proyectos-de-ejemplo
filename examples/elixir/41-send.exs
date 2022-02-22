#!/usr/bin/env elixir

defmodule MySend

  def send_hi()
    send(self(), :hi)
  end

  def info()
    p = Process.info(self(), :messages)
    IO.puts p
  end
end

