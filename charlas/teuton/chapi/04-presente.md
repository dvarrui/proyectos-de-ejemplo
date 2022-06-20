
# TEUTON

![](./images/13-teuton-color-256x279.png)

---

* SysadminGame cambia a TEUTON.
* Más usuarios y colaboradores.
* Varios repositorios:

| Proyecto    | Repositorio                                  |
| ----------- | -------------------------------------------- |
| Teuton      | https://github.com/dvarrui/teuton            |
| Challenges  | https://github.com/dvarrui/teuton-challenges |
| TeutonPanel | https://github.com/fvarrui/teuton-panel      |

---

# Preparar las máquinas

Hay varias formas de instalar el software.
* Lanzar el script de instalación.
* Hacerlo manualmente siguiendo la documentación.
* [Usar Vagrant](05-vagrant.md).

> NOTA: para cada S-NODE, nos apuntamos IP, y confirmamos que funciona el acceso remoto desde T-NODE.

---

# Crear el reto

| Paso | Descripción |
| ---- | ----------- |
| 01   | Crear el esqueleto |
| 02   | Configurar las máquinas |
| 03   | Definir el reto (objetivos) |
| 04   | Ejecutar |

* [Ver ejemplos](./examples)

---

## PASO 1: Crear el esqueleto

* Entrar en T-NODE.
* Crear un esqueleto para nuestro reto(test):
```
vagrant@t-node:~> teuton create chapi

[INFO] Create project <chapi>
* Create dir        => chapi
* Create dir        => chapi/assets
* Create file       => chapi/start.rb
* Create file       => chapi/config.yaml
* Create file       => chapi/.gitignore
* Create file       => chapi/assets/README.md
```

---

## PASO 2: Configurar las máquinas

* Definir las máquinas que voy a evaluar (acceso remoto):

```
vagrant@t-node:~> more chapi/config.yaml
---
:global:
:cases:
- :tt_members: Obiwan Kenobi
  :host1_username: root
  :host1_password: vagrant
  :host1_ip: 192.168.1.118
```

---

## PASO 3: Definir el reto

Enunciado para los alumnos:
* Servidor web
    * Servidor Web Apache2.
    * `index.html` con el texto "Hola TEUTON!".
* Base de datos Mysql.
    * Crear la base de datos `chapi`.
    * Crear tabla `aficiones` con campo `nombre`.
    * Añadir 3 registrosa  al tabla.
* [Consultar los ficheros](./examples)

---

## PASO 4: Ejecutar

* `teuton chapi`, para ejecutar el reto.
* Consultar los resultados en `var/chapi/out`.
