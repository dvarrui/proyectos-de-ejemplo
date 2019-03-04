#!/usr/bin/env ruby

def process(id, value)
  begintime=Time.now
  delay = rand(10)
  puts "[#{id}] BEGIN | input : #{value}"
  sleep(delay)
  endtime=Time.now
  duration = endtime-begintime
  puts "[#{id}] END   | delay : #{ duration.to_i}"
  result = delay
  return { duration: duration, result: result}
end

def show_begin_title(values)
  puts "="*40
  puts "BEGIN : #{values.to_s}"
  puts "="*40
end

def show_end_title(outputs)
  puts "="*40
  puts "END   : #{outpus.to_s}"
  puts "="*40
end

items = [ 1, 3, 5, 7]

show_begin_title items
items.each_with_index do |item, index|
  output = process(index, item)
end
