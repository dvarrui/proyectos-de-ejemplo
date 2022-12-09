#!/usr/bin/env ruby

require_relative "lib/gitlab"

data = gitlab.group(ENV['GITLAB_GROUP_ID']).to_h
labels = %w(id web_url visibility)
labels.each do |label|
  puts "#{label.rjust(15)} #{data[label]}"
end
puts "projects".rjust(15)
data['projects'].each do |project|
  puts "#{project['id'].to_s.rjust(15)} #{project['name']}"
end
