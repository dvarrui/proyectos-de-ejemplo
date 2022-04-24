#!/usr/bin/env ruby

require_relative '../lib/word'

word = Word.new('hello')

guess = 'bailar'
puts guess.to_s
puts word.contains?( guess ).to_s

guess = 'hola'
puts guess.to_s
puts word.contains?( guess ).to_s


