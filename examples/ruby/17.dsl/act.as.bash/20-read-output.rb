#!/usr/bin/env ruby

require_relative 'lib/03.act-as-bash'


module ActAsBash

  echo "[INFO] Example 03 - Read command output"
  username = %x(whoami)
  echo username
  rmdir 'temp'
  echo "$S1=", $S1
  echo "$S2=", $S2
end

