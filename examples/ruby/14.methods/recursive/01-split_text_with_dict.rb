#!/usr/bin/env ruby

def split_text_with_dict(text, dict, prefix=[])
  return prefix if text.empty?

  solutions = []
  puts "[DEBUG.1] text=#{text}, prefix=#{prefix.to_s}, solutions=#{solutions.to_s}"
  dict.each do |word|
    if text.start_with? word
      new_text = text.delete_prefix word
      new_prefix = prefix << word
      sols =  split_text_with_dict(new_text.dup, dict, new_prefix.dup)
      sols.each { |s| solutions << s }
    end
  end

  puts "[DEBUG.2] text=#{text}, prefix=#{prefix.to_s}, solutions=#{solutions.to_s}"
  return solutions
end

