#!/usr/bin/env ruby

def simulate_cat
  options = ARGV.select { |arg| arg.start_with?("-") }
  files = ARGV.reject { |arg| arg.start_with?("-") }

  if files.empty?
    puts "Uso: ruby simulador_cat.rb [-n | -b] archivo1 [archivo2 ...]"
    return
  end

  line_count = 1

  files.each do |file_path|
    unless File.exist?(file_path)
      puts "cat: #{file_path}: No existe el archivo o el directorio"
      next
    end

    File.foreach(file_path) do |line|
      display_line = line

      if options.include?("-n")
        display_line = "#{line_count.to_s.rjust(6)}  #{line}"
        line_count += 1
      elsif options.include?("-b")
        if line.strip.empty?
          display_line = line
        else
          display_line = "#{line_count.to_s.rjust(6)}  #{line}"
          line_count += 1
        end
      end

      print display_line
    end
  end
end

simulate_cat
