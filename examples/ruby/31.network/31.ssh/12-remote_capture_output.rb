#!/usr/bin/env ruby
require "net/ssh"

user = "vagrant"
pass = "vagrant"
host = "192.168.1.95"

def remote_exec(cmd, ssh)
  # capture only stdout matching a particular pattern
  stdout = ""
  stderr = ""
  ssh.exec!(cmd) do |channel, stream, data|
    stdout << data if stream == :stdout
    stderr << data if stream == :stderr
  end
  puts "  CMD: #{cmd}"
  puts "  OUT: #{stdout}"
  puts "  ERR: #{stderr}"
  puts
end

puts "==> SSH #{host} ..."
Net::SSH.start( host.to_s, user.to_s, :password => pass.to_s ) do |ssh|

  cmds = [ "pwd", "whoami", "kk", "ping -c 1 1.1.1", "ping -c 1 192.168.1.69" ]
  cmds.each { |cmd| remote_exec(cmd, ssh) }
end
puts "==> Logging out..."
