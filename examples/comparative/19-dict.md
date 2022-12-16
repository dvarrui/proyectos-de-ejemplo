
```
PENDIENTE DE DESARROLLAR
```

# Diccionarios, Hash, etc.

```python
def guardar_bd(socios, nomfich):      # Valores separados por separador
    '''Función para guardar la base de datos de socios a fichero'''
    # De cada socio se almacena primero el NIF como clave y luego los valores
    # del resto de la información, según inserción, separados por 'separador'
    
    fichero = open(nomfich,'w')
    for nif in socios:
        fichero.write(nif)    # Primer valor es el nif
        for value in socios[nif].values():
            fichero.write(separador+str(value))
        fichero.write('\n')        # Poner cada registro en una línea
    fichero.close()
```
