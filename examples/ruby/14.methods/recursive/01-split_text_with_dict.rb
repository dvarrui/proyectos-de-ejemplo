#!/usr/bin/env ruby

def split_text_with_dict(text, dict, splited=[])
  solutions = []
  #puts "[DEBUG.1] text=#{text}, splited=#{splited.to_s}, solutions=#{solutions.to_s}"
  dict.each do |word|
    if text.start_with? word
      new_text = text.delete_prefix word
      new_splited = splited.dup<< word
      if new_text.empty?
        solutions << new_splited
      else
        sols = split_text_with_dict(new_text, dict, new_splited)
        sols.each { |s| solutions << s } 
        #puts "[DEBUG.2] solutions=#{solutions} sols=#{sols}"
      end
    end
  end

  #puts "[DEBUG.3] text=#{text}, splited=#{splited.to_s}, solutions=#{solutions.to_s}"
  return solutions
end

