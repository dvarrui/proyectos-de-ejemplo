#!/usr/bin/env ruby

def process(id, delay)
  begintime=Time.now
  puts "[#{id}] BEGIN | expected delay : #{delay}"
  sleep(delay)
  endtime=Time.now
  duration = endtime-begintime
  puts "[#{id}] END   |     real delay : #{ duration.to_i}"
  return { pid: id, duration: duration, delay: delay}
end

def show_begin_title(values)
  puts "="*40
  puts "   Script : #{$0} "
  puts "   Inputs : #{values.to_s}"
  puts "="*40
end

def show_end_title(outputs)
  duration = 0.0
  outputs.each { |output| duration += output[:duration] }
  puts "="*40
  puts "            Total duration = #{duration.to_i}"
  puts "="*40
end

inputs = [ 1, 3, 5, 7].shuffle

show_begin_title inputs
outputs = []
inputs.each_with_index do |input, index|
  outputs << process(index, input)
end
show_end_title outputs
