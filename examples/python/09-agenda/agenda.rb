#!/usr/bin/env ruby
require 'rainbow'

def show_contacts(phone_book)
  phone_book.each_pair do |name,phone|
    puts "#{name} => #{phone}"
  end
end

def add_contact(phone_book, name, phone)
  if phone_book[name]
    puts Rainbow('Ya existe el nombre en la agenda!').red
    return
  end
  phone_book[name] = phone
end

def remove_contact(phone_book, name)
  if phone_book[name]
    phone_book.delete(name)
    return
  end
  puts Rainbow('No existe el nombre en la agenda!').red
end

def menu
  phone_book = {}
  while true
    puts <<-EOF
      1. Mostrar lista de contactos.
      2. Añadir contacto.
      3. Borrar contacto.
      4. Salir
    EOF
    option = gets.chop
    if option == '1'
      show_contacts(phone_book)
    elsif option == '2'
      print('Introduzca el nombre: ')
      name = gets.chop
      print('Introduzca el teléfono: ')
      phone = gets.chop
      add_contact(phone_book, name, phone)
    elsif option == '3'
      print('Introduzca el nombre: ')
      name = gets.chop
      remove_contact(phone_book, name)
    elsif option == '4'
      exit(0)
    end
  end
end

menu
