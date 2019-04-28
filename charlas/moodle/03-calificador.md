
# Calificador

Los cursos que hacemos en Moodle (Como Campus Virtual o EVAGD) tienen un sistema para llevar las calificaciones, y que no tengamos que llevarlas en una hoja de cáculo externa.

# 1. Supuesto 

Vamos a crear un esquema/fórmula de calificación de la siguiente forma:


# 2. Crear las categorías 

* Ir a `Campus Virtual`. Entrar en nuestro curso de pruebas.
* A la derecha `Administración -> Configuración Calificaciones`.
* Crear `categorías` para obtener la siguiente estructura:
```
curso
  ├───trim1
  │   ├───ud_intro
  │   │   ├───act_intro
  │   │   └───pru_intro
  │   └───ud_rojo
  │       ├───act_rojo
  │       └───pru_rojo
  └───trim2
      ├───ud_verde
      │   ├───act_verde
      │   └───pru_verde
      └───ud_azul
          ├───act_azul
          └───pru_azul
```
