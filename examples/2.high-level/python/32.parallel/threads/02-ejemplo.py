#!/usr/bin/env python3
from threading import Thread
from time import sleep
from random import choice

def espera(n):
 sleep(n)
 print("Hilo: terminé!")

subproceso = Thread(target=espera, args=(5,))

subproceso.start()

while(subproceso.is_alive()):
 print("Main: Esperando...")
 sleep(1)

print("Main: OK")
