#!/usr/bin/env ruby

class DirCommand
  def initialize
    @total= {files: 0, dirs: 0, size: 0 }
    @entries = Dir.entries(".")        
  end

  def show_title
    puts " El volumen de la unidad no tiene etiqueta."
    puts " El número de serie del volumen es: 1A2B-3C4D"
    puts ""
    puts " Directorio de #{Dir.pwd.gsub('/', '\\')}"
    puts ""
  end

  def call
    show_title

    @entries.each do |entry|
      begin
        stats = File.stat(entry)
      rescue => e
        next
      end
      mtime = stats.mtime      
      formatted_time = mtime.strftime("%d/%m/%Y  %H:%M")

      if File.directory?(entry)
        type_or_size = "<DIR>         "
        @total[:dirs] += 1
      else
        # Formatear el tamaño con separador de miles
        type_or_size = stats.size.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1.').reverse.rjust(14)
        @total[:files] += 1
        @total[:size] += stats.size
      end
      puts "#{formatted_time}    #{type_or_size} #{entry}"
    end
  end

  def show_resume
    sp15 = ' ' * 15
    sp5 = ' ' * 5    
    print "#{sp15} #{@total[:files]}"
    puts " archivos #{sp5} #{@total[:size].to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1.').reverse} bytes"
    puts "#{sp15} #{@total[:dirs]} dirs #{sp5} 1.234.567.890 bytes libres"
  end
end

DirCommand.new.call