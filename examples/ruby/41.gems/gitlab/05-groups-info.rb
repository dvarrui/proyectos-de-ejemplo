#!/usr/bin/env ruby
require_relative "lib/gitlab"

data = gitlab

labels = %w(id name web_url full_path parent_id)
data.groups.each do |group|
  labels.each do |label|
    puts "#{label.rjust(18)}: #{group[label]}"
  end
  key = "projects"
  puts "#{key.rjust(18)}: #{data.group(group["id"])[key].size}"
  puts ""
end
