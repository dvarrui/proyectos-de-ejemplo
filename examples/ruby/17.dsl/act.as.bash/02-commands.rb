#!/usr/bin/env ruby

require_relative 'lib/02-like-bash'

module Example
  extend LikeBash

  echo "[INFO] Example 02 - Commands"
  pwd
  mkdir 'temp'
end
