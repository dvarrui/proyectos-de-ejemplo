
# Calificador

Los cursos que hacemos en Moodle (Como Campus Virtual o EVAGD) tienen un sistema para llevar las calificaciones. De esta forma, no es necesario llevar el control en una hoja de cálculo externa.

## Supuesto

Vamos a crear una configuración del calificador para resolver el siguiente supuesto. Queremos tener notas/calificaciones en lo siguiente:
* Trim1 y trim2.
* Para dos temas o unidades dentro de trim1.
* Para dos temas o unidades dentro de trim2.
* Para la parte de actividades y pruebas de cada una de las unidades.

## Pasos

Los pasos son:
* Crear las categorías
* Configurar las categorías
* Mover las tareas a su categorías
* Comprobar los resultados.

---

# 1. Crear las categorías

* Ir a `Campus Virtual`. Entrar en nuestro curso de pruebas.
* A la derecha `Administración -> Configuración Calificaciones`.
* `Añadir categoría` con:

| Campo  | Valor | Descripción |
| ------ | ----- | ----------- |
| Nombre | `curso` ||
|Cálculo total | `Media ponderada de calificaciones` | **Esta parte es MUY IMPORTANTE!!!**. Establece el sistema de pesos que vamos a usar |
| Total categoría -> Calificación para aprobar | `50` | Estamos definiendo que todo lo que sea superior a 50% lo pinte en verde y y es inferior lo ponga en rojo |

* `Añadir categoría` con:

| Campo  | Valor   | Descripción |
| ------ | ------- | ----------- |
| Nombre | `trim1` ||
|Cálculo total | `Media ponderada de calificaciones` | **Esta parte es MUY IMPORTANTE!!!**. Establece el sistema de pesos que vamos a usar |
| Total categoría -> Calificación para aprobar | `50` | Estamos definiendo que todo lo que sea superior a 50% lo pinte en verde y y es inferior lo ponga en rojo |
| Categoría padre | `curso` | Nombre de la categoría de nivel superior |

* Seguimos así, hasta obtener la siguiente estructura:

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

---

# 2. Configurar cada categoría
