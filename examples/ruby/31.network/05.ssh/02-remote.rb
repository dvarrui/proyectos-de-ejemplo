#!/usr/bin/env ruby
require "net/ssh"

user = "vagrant"
pass = "vagrant"
host = "192.168.1.95"

puts "SSHing #{host} ..."
Net::SSH.start( host.to_s, user.to_s, :password => pass.to_s ) do |ssh|
  puts ssh.exec!('hostname')
  puts "Logging out..."
end
