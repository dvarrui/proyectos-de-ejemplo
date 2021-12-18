
# Docker: ruby + rails

Enlace de interés:
* [Docker básico](https://github.com/dvarrui/libro-de-actividades/blob/master/actividades/add/devops/docker.md)

# Docker: instalación y activación

```
sudo zypper in docker
systemctl status docker
systemctl start docker
docker version

sudo sysctl net.ipv4.ip_forward
net.ipv4.ip_forward = 1
```

---

# Docker: Preparar la imagen

```
docker search opensuse|grep 'opensuse'
docker pull opensuse/tumbleweed
docker images
```

---

# Docker: Crear el contenedor

Descargar un [Dockerfile](Dockerfile):
```
mkdir proyecto
(Download Dockerfile)
cd proyecto
```

Crear nuestra imagen a partir de nuestro Dockerfile:
```
% docker images
REPOSITORY           TAG     IMAGE ID      CREATED        SIZE
opensuse/tumbleweed  latest  c794a5976b99  21 hours ago   115MB```

% docker build -t rubyrails .

% docker images
REPOSITORY           TAG     IMAGE ID      CREATED        SIZE
rubyrails            latest  e0d18f95927e  2 minutes ago  764MB
opensuse/tumbleweed  latest  c794a5976b99  21 hours ago   115MB
```

---

# Rails: Desarrollo de nuestra aplicación

Ahora dentro del contenedor comenzamos el desarrollo de nuestra aplicación de Rails.

* Crear el contenedor `iloveruby` a partir de la imagen anterior:
```
docker run --name=iloveruby -p 4567 -t rubyrails /bin/bash
```
* `rails -v` para comprobar que rails está instalado correctamente.
* Abrir otro terminal, para comprobar que el contenedor está en ejecución:
```
docker ps
```

---

# ANEXO

docker rmi bkimminich/juice-shop

Arranque manual del contenedor:
```
docker run --name=azul -i -t opensuse/tumbleweed /bin/bash
docker ps -a
```
