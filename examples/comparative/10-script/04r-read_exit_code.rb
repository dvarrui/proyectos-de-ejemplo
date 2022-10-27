#!/usr/bin/env ruby

system("ping 192.168.1.1 -c 1 > /dev/null")
puts $?.exitstatus
system("ping 192.168.16.16 -c 1 > /dev/null")
puts $?.exitstatus
