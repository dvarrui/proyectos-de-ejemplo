#!/usr/bin/ruby

def counter(text, letters)
  total = 0
  text.each_char do |letra|
    total = total + 1 if letters.include?(letra)
  end

  total
end

def halves(text)
  mitad = text.size / 2
  mitad_uno = text[0,mitad]
  mitad_dos = text[mitad,text.size]
  mitad_uno + ' | ' + mitad_dos
end

def upper_vowels(text)
  vowels = 'aeiou'
  salida = ''
  text.each_char do |letra|
    if vowels.include?(letra)
      salida = salida + letra.upcase
    else
      salida = salida + letra
    end
  end
  salida
end

def sorted_by_words(text)
    palabras = text.split()
    palabras.sort()
    ordenado = ' '.join(palabras)
    return ordenado
end

def length_of_words(text)
  salida = []
  text.split(' ').each do |palabra|
    salida << palabra.size
  end
  salida
end

text = ARGV[0]
puts "Number of vowels      : #{counter(text, 'aeiou')}"
puts "Number of whitespaces : #{counter(text, ' ')}"
puts "Number of digits      : #{counter(text, '0123456789')}"
puts "Number of words       : #{text.split(' ').size}"
puts "Reverse of text       : #{text.reverse}"
puts "Length of text        : #{text.size}"
puts "Halves of text        : #{halves(text)}"
puts "Uppercased vowels     : #{upper_vowels(text)}"
puts "Sorted by words       : #{text.split(' ').sort.join(' ')}"
puts "Length of words       : #{length_of_words(text)}"
