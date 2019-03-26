
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

Creamos la máquina T-NODE
* Hay varias formas de instalar el software. Vamos a usar Vagrant.
* Tener instalado en local: VirtualBiox y Vagrant.
* Descargar fichero Vagrantfile para T-NODE.
* `vagrant up`

Creamos la máquina S-NODE
* Hay varias formas de instalar el software. Vamos a usar Vagrant.
* Descargar fichero Vagrantfile para S-NODE.
* `vagrant up`

---

# Creamos el reto

* Confirmar IP, y acceso SSH de S-NODE.
* Cuatro pasos:
    1. Crear el esqueleto
    1. Configuar las máquinas
    1. Definir los retos
    1. Ejecutar

## PASO 1: Crear el esqueleto**

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

## PASO 2: Configurar las máquinas

* Definir las máquinas que voy a evaluar:
```
vagrant@t-node:~> more chapi/config.yaml
---
:global:
:cases:
- :tt_members: Obiwan Kenobi
  :host1_username: root
  :host1_password: vagrant
  :host1_ip: 192.168.1.118
vagrant@t-node:~>
```

## PASO 3: Definir el reto

Enunciado para los alumnos:
* Servidor web
    * Servidor Web Apache2.
    * `index.html` con el nombre del alumno.
* Base de datos Mysql.
    * Crear tabla `aficiones` con campo `nombre`.
    * Añadir varios registros.
* [Consultar los ficheros](./examples)

## PASO 4: Ejecutar

* Ejecutar el reto `teuton chapi`.
* Consultar los resultados en `var/chapi/out`.
