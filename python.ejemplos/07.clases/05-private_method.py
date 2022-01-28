
# Python no tiene el concepto de "privado".
#
# Construido en el principio que dice que los usuarios
# van a usar las Clases de forma responsable.
#
# Los atributos a partir de una sola o de doble subrayado
# son tratados como parte de la implementaciOn interna,
# pero que en realidad no se oculta a los usuarios.

class Person:
    def __init__(self, name):
        self.name = name
        self.__hidden__()

    def __hidden__(self):
        print('bla, bla, bla')

p = Person('Invisible man')
p.__hidden__()
