
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

Arranque automático del contenedor ([Dockerfile](Dockerfile)):
```
mkdir proyecto
(Download Dockerfile)
cd proyecto

docker images
docker build -t rubyrails .
docker images

docker run --name=rojo -p 4567 -t rubyrails /bin/bash
```

---

# ANEXO

docker rmi bkimminich/juice-shop

Arranque manual del contenedor:
```
docker run --name=azul -i -t opensuse/tumbleweed /bin/bash
docker ps -a
```
