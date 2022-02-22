#!/usr/bin/env elixir

defmodule MY do

  def send_hi() do
    send(self(), :hi)
  end

  def info() do
    p = Process.info(self(), :messages)
    IO.puts p
  end
end


MY.send_hi

MY.info
