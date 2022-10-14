#!/usr/bin/env -S godot -s
extends SceneTree

func _init():
    var number = 4
    show_table(number)
    quit() # step 4

func show_table(number):
    for i in range(1, 11): # step 2
        print(" %2d * %2d = %3d" % [i, number, i*number]) # step 3
