#!/usr/bin/ruby

def count_words(sentence)
  summary = {}
  words = sentence.split(' ')
  words.each do |word|
    if summary[word].nil?
      summary[word] = 1
    else
      summary[word] += 1
    end
  end
  summary
end

sentence = ARGV[0]
palabras = count_words(sentence)
palabras.each_pair { |key,value| puts "#{key}: #{value}" }
