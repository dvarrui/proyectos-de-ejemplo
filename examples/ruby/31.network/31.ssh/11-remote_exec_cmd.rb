#!/usr/bin/env ruby
require "net/ssh"

user = "vagrant"
pass = "vagrant"
host = "192.168.1.16"

puts "==> Open SSH session wiht #{host}"

Net::SSH.start( host.to_s, user.to_s, password: pass.to_s ) do |ssh|
  puts ssh.exec!("hostname")
end

puts "==> Close session"
