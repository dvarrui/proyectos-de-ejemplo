
# Elixir

Enlaces de interés:
* www.elixirschool.com

---

# Ejemplo 01

Elixir:

```
iex> defmodule Hello do
...>   def print(lang \\ :en)
...>   def print(:de), do: "Hallo Welt"
...>   def print(:en), do: "Hello World"
...>   def print(:es), do: "Hola Mundo"
...>   def print(:ru), do: "Привет мир"
...> end

iex> Hello.print()
"Hello World!"
iex> Hello.print(:es)
"Hola Mundo"
iex> Hello.print(:ru)
"Привет мир"
```

Ruby:
```
module Hello
  def self.print(lang = :en)
    case lang
    when :de
      return "Hallo Welt"
    when :en
      return "Hello World"
    when :es
      return "Hola Mundo"
    when :ru
      return "Привет мир"
    end
  end
end

Hello.print(:es)
```

En Elixir se pueden definir funciones que se llaman igual pero que implementan código diferente en función de la entrada recibida.

La forma Ruby define un sólo método que contiene la función a realizar.
Pero se puede modificar el compartamiento cin un case.
