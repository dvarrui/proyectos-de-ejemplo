#!/usr/bin/env ruby

require_relative '01-split_text_with_dict'

def debug(dict, text)
  puts "dict :#{dict}"
  puts "text : #{text}"
  puts "solutions:"
  solutions = split_text_with_dict(text, dict)
  solutions.each { |solution| puts "* #{solution.to_s}" }
  puts "\n"
end

dict = [ "a", "b", "c" ]
text = "abc"
debug dict, text

dict = [ "a", "b", "c" ]
text = "abd"
debug dict, text

dict = [ "a", "bc", "c" ]
text = "abc"
debug dict, text
  
dict = [ "a", "ab", "bc", "c" ]
text = "abc"
debug dict, text
