#!/usr/bin/ruby

def count_words(sentence)
  summary = Hash.new(0)
  words = sentence.split(' ')
  words.each { |word| summary[word] += 1 }
  summary
end

sentence = ARGV[0]
palabras = count_words(sentence)
palabras.each_pair { |key,value| puts "#{key}: #{value}" }
