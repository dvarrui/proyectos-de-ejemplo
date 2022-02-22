
defmodule Clause do

  def is_even(num) when num === 1 do
    false
  end

  def is_even(num) when num === 2 do
    true
  end

  def is_odd(num) when num === 1 do
    true
  end

  def is_odd(num) when num === 2 do
    false
  end
end
