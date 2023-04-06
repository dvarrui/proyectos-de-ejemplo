#!/usr/bin/env ruby
require "net/ssh"

user = "vagrant"
pass = "vagrant"
host = "192.168.1.16"

def execute_remote_cmd(cmd, ssh)
  output = ssh.exec!(cmd)
  puts "  Execute : #{cmd}"
  puts "  Output  : #{output}"
  puts "  Status  : #{output.exitstatus}\n\n"
end

puts "==> SSH open #{host}"

Net::SSH.start( host.to_s, user.to_s, password: pass.to_s ) do |ssh|
  cmd = "hostname"
  execute_remote_cmd(cmd, ssh)

  cmd = "sl"
  execute_remote_cmd(cmd, ssh)
end

puts "==> SSH close"
