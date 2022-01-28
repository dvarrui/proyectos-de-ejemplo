import sys
import crayons

def show_contacts(phone_book):
    for name, phone in sorted(phone_book.items()):
        print(f'{name}: {phone}')

def add_contact(phone_book, name, phone):
    if name in phone_book:
        print(crayons.red('Ya existe el nombre en la agenda!'))
    else:
        phone_book[name] = phone

def remove_contact(phone_book, name):
    if name in phone_book:
        del(phone_book[name])
    else:
        print(crayons.red('No existe el nombre en la agenda!'))

def menu():
    phone_book = {}
    while True:
        print('''
            1. Mostrar lista de contactos.
            2. Añadir contacto.
            3. Borrar contacto.
            4. Salir''')
        option = input('')
        if option == '1':
            show_contacts(phone_book)
        elif option == '2':
            name = input('Introduzca el nombre: ')
            phone = input('Introduzca el teléfono: ')
            add_contact(phone_book, name, phone)
        elif option == '3':
            name = input('Introduzca el nombre: ')
            remove_contact(phone_book, name)
        elif option == '4':
            sys.exit()
 
if __name__ == '__main__':
    menu()
