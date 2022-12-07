#!/usr/bin/env ruby

require_relative "lib/gitlab"

projects = gitlab.projects(per_page: 5)

loop do
  projects.each do |project|
    next unless project["name"].start_with? "dv"
    puts "#{project['name'].rjust(20)} #{project['ssh_url_to_repo']}"
  end
end
puts projects[0].to_h
