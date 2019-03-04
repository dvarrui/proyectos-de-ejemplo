#!/usr/bin/env ruby

require_relative '03-secuencia-lib'

numbers = [ 1, 3, 5, 7].shuffle
show_begin_title numbers

tasks = []
numbers.each { |n| tasks << SequentialProcess.new(n) }
tasks.each { |t| t.process }

show_end_title tasks
