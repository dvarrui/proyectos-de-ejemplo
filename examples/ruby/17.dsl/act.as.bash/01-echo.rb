#!/usr/bin/env ruby
require_relative 'lib/01-like-bash'

module Example
  extend LikeBash

  echo "[INFO] Example 01 - echo"

  echo "Hola", 42
  echo "qué", "tal?"

end
