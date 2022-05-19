
# 16. Ejemplo en Bash

![](images/whoami.sh.png)

Ejemplo: **whoami.sh**

```bash
#/usr/bin/env bash

# OJO poner espacios es un problema de sintaxis: name = $(whoami)
name=$(whoami)         
rol=$1

# OJO: no poner espacios es un problema de sintáxis: if [$name == 'root']
# OJO: no poner espacios es un problema de semántica: if [ $name=='root' ]
if [ $name == 'root' ]
then # OJO: No hay que olvidar el then
  echo "root is not valid user!"
  exit 1
fi

echo "[$rol] My name is $name"
exit 0
```

# 17. Ejemplo en Ruby

![](images/whoami.rb.png)

Ejemplo: **whoami.rb**

```ruby
#/usr/bin/env ruby

name = %x(whoami) # Es equivalente a => name = `whoami`
rol  = ARGV[0] || 'unkown'

if name == 'root'
  puts "root is not valid user!"
  exit 1
end

puts "[#{rol}] My name is #{name}"
exit 0
```

# 18. Resumen

* Ruby es ideal para **aprender** a programar.
* Transformación directa desde **pseudocódigo**.
* Transformación directa desde Bash.
* Se escribe casi como en **inglés natural**.
* Las **empresas usan Ruby** y Python como lenguages de scripting.

![](images/rubygems.png)

# 19. Fin

```
puts "Muchas gracias!" * 1000
```

* **GitHub**: `@dvarrui`
* **Email**: `dvarrui@protonmail.com`
* **Presentación**: https://github.com/dvarrui/proyectos-de-ejemplo/tree/master/charlas/ruby/scripting/slides

![](images/puerto-de-la-cruz.png)
