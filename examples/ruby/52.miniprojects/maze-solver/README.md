
# Maze solver

Resolver el problema de encontrar la salida dentro de un laberinto.

## Modo de uso

* Crear el laberinto en un fichero `txt`. Por ejemplo [example/maze1.txt](./example/maze1.txt)
    - 0: Celda vacía
    - 1: Muro
    - 8: El player
    - 9: El target
* A continuación ejecutar `ruby main.rb example/maze1.txt`

Salida por pantalla:

```bash
$ ruby main.rb example/maze1.txt 

Maze (4x4)| player(0,1)| target(2,3)| solved? false

0 | #*##
1 | #  #
2 | #  X
3 | ####

Maze (4x4)| player(0,1)| target(2,3)| solved? true

0 | #*##
1 | #..#
2 | # .X
3 | ####
```
