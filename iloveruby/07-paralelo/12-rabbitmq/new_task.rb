#!/usr/bin/env ruby
require 'bunny'

connection = Bunny.new(automatically_recover: false)
connection.start

channel = connection.create_channel
queue = channel.queue('task_queue', durable: true)

message = ARGV.empty? ? 'Hello World!' : ARGV.join(' ')

messages = message.split(" ")
messages.each do |m|
  queue.publish(m, persistent: true)
  sleep m.size
  puts " [x] Sent #{m}"
end
connection.close
