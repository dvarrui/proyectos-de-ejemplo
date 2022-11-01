[<< back](README.md)

# Capa: lenguajes de alto nivel

Los lenguajes de alto nivel nos permiten escribir nuestros programas de forma que nos podemos "olvidar" de los detalles de la máquina que hay debajo (memoria, arquitectura, etc.). Sólo nos tenemos que "concentrar" en resolver nuestro problema.

Los lenguajes de alto nivel suelen tener las siguientes características:
* Lenguajes interpretados
* Tipado dinámico
* Recolector de basura
* etc.

Ejemplos de lenguajes de alto nivel: Lisp, Python, Ruby, etc. Ejemplo en Ruby (En Python es igual):

```
# Crear una variable string.
film = "starwars"
film += "(episode I)"

# Creación de un Array/lista y añadir un valor
names = ['obiwan', 'vader']
names += ['yoda']
```

## Resumen

Los lenguajes de alto nivel tienen en común que "ocultan" al humano (programador) los detalles de implementación (la máquina). El foco se pone en resolver el algoritmo que da respuesta a nuestro problema sin prestar atención a los detalles de cómo lo resuelve la máquina. Confiamos en que el intérprete/compilador tome las decisiones adecuadas en ese sentido.

Los lenguajes de bajo nivel, por el contrario, implican al "humano" en la toma de decisiones de la implementación (decisiones a nivel de máquina).

A veces necesitaremos bajo nivel y otras alto nivel. Depende.
