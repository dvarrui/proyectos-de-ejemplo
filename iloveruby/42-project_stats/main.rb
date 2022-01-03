#!/usr/bin/env ruby

require_relative 'lib/project_stats'

if ARGV[0].nil?
  puts "Usage: #{$PROGRAM_NAME} PATH/TO/DIR"
  exit 1
end

files = ProjectStats.get_files_from_directory(ARGV[0])

md_list = ProjectStats.get_metadata_list(files)
sum_md = ProjectStats.sumarize_metadata_list(md_list)
ProjectStats.show_summary(sum_md)
