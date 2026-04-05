#!/usr/bin/env ruby

def simulate_dir
  puts " El volumen de la unidad no tiene etiqueta."
  puts " El número de serie del volumen es: 1A2B-3C4D"
  puts "\n Directorio de #{Dir.pwd.gsub('/', '\\')}\n\n"

  total_files = 0
  total_dirs = 0
  total_size = 0

  entries = Dir.entries(".")

  entries.each do |entry|
    begin
      stats = File.stat(entry)
    rescue => _e
      next
    end

    mtime = stats.mtime
    formatted_time = mtime.strftime("%d/%m/%Y  %H:%M")
      
    if File.directory?(entry)
      type_or_size = "<DIR>         "
      total_dirs += 1
    else
      type_or_size = stats.size.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1.').reverse.rjust(14)
      total_files += 1
      total_size += stats.size
    end

    puts "#{formatted_time}    #{type_or_size} #{entry}"
  end

  puts "#{' ' * 15} #{total_files} archivos       #{total_size.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1.').reverse} bytes"
  puts "#{' ' * 15} #{total_dirs} dirs       1.234.567.890 bytes libres"
end

simulate_dir