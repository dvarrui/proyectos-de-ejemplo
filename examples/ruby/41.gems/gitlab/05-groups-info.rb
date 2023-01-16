#!/usr/bin/env ruby
require_relative "lib/gitlab"

groups = gitlab.groups

labels = %w(id name web_url name parent_id)
groups.each do |group|
  labels.each do |label|
    puts "#{label.rjust(18)}: #{group[label]}"
  end
  puts ""
end
