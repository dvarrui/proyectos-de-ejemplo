#!/usr/bin/env ruby

require_relative 'lib/02.act-as-bash'

module ActAsBash

  echo "[INFO] Example 02 - Commands"
  pwd
  mkdir 'temp'
  whoami
end
