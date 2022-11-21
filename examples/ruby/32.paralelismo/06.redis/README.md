
# Redis

Servidor Redis
* `zypper in redis` para instalar Redis en la máquina.
* Documentación: https://redis.io/docs/data-types/
* `redis-server`, iniciar el servicio Redis.

Cliente Redis:
* Documentación: Usar el cliente (https://redis.io/docs/manual/cli/)
* `gem install redis`, para instalar el binding ruby a redis
* `ruby 01-set.rb`, ejemplo para escribir valores en Redis.
* `ruby 02-set.rb`, ejemplo para leer valores en Redis.

## Distributed 

* Ejemplo `examples/distributed_redis.rb`.
* Se trabaja en paralelo en varias BD Redis para todas las operaciones.

