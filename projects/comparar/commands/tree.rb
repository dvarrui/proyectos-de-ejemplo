#!/usr/bin/env ruby
require "pathname"

class TreeCommand
  BLUE = "\e[94m"
  RESET = "\e[0m"

  def initialize
    @dir_count = 0
    @file_count = 0
  end

  def run(path = ".")
    root = Pathname.new(path)
    puts "#{BLUE}#{root}#{RESET}"
    visualize(root, "")
    puts "\n#{@dir_count} directories, #{@file_count} files"
  end

  private

  def visualize(path, prefix)
    entries = path.children.sort_by { |e| [e.directory? ? 0 : 1, e.basename.to_s.downcase] }
    
    entries.each_with_index do |entry, index|
      is_last = (index == entries.size - 1)
      connector = is_last ? "└── " : "├── "

      name = entry.directory? ? "#{BLUE}#{entry.basename}#{RESET}" : entry.basename      
      puts "#{prefix}#{connector}#{name}"

      if entry.directory?
        @dir_count += 1
        new_prefix = prefix + (is_last ? "    " : "│   ")
        visualize(entry, new_prefix)
      else
        @file_count += 1
      end
    end
  rescue Errno::EACCES
    puts "#{prefix}└── [Permiso denegado]"
  end
end

TreeCommand.new.run(ARGV[0] || ".")