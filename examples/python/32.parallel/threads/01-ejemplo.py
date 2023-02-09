#!/usr/bin/env python3	
from threading import Thread
from time import sleep
 
def espera(n):
 print("Hilo: Espero %s segundos." % n)
 sleep(n)
 print("Hilo: Yo acabé.")
 
 
subproceso = Thread(target=espera, args=(5,))

subproceso.start() 
print("Main: Yo espero menos.")
subproceso.join()
print("Main: por fin!")
