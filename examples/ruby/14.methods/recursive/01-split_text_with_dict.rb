#!/usr/bin/env ruby

def split_text_with_dict(text, dict, prefix=[])
  return prefix.flatten if text.empty?

  solutions = []
  dict.each do |word|
    if text.start_with? word
      new_text = text.delete_prefix word
      new_prefix = prefix << word
      sol =  split_text_with_dict(new_text, dict, new_prefix)
      solutions << sol unless sol.nil?
    end
  end

  return solutions
end

text = "a"
dict = [ "a" ]
sol = split_text_with_dict(text, dict)

