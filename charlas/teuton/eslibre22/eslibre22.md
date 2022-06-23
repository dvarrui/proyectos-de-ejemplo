
# TEUTON: Test de infraestructura

```
Fecha : Viernes 24
Lugar : Sala Núñez
Hora  : 10:30-10:55
```

![](images/teuton-logo.png)

# 2. Agradecimientos

¡Muchas gracias!
* Organización **EsLibre22**
* Equipo Teuton Software
* Comunidad Teuton de Telegram

```
Todo lo que vamos a ver está hecho con Software Libre
```

# 3. Presentación

* David Vargas
* GitHub: **@dvarrui**
* Ruby, software libre y StarWars.

![](images/presentacion.png)

# 4. Teuton

¿Qué es?
* Programa multiplataforma.
* Licencia Software libre.
* Test de infraestructura.

¿Qué resuelve?
1. Revisar nuestra infraestructura como si fuera código.
2. Automatizar las correcciones de las MV remotas de los alumnos.

# 5. TDD

Defnición
* **Desarrollo guiado por pruebas de software**.
* Lograr un código limpio que funcione.
* Garantizar que el software cumple con los requisitos que se han establecido.

```
=> "Clean Code"        Robert C. Martin
=> "Código sostenible" Carlos Ble
```

# 6. Ejemplo: Factorizar

![mymath-factorize.png](images/mymath-factorize.png)

```ruby
module MyMath
  def self.factorize(number)
    factors = []
    divisor = 2
    while(number > 1)
      while (number % divisor).zero?
        factors << divisor
        number /= divisor
      end
      divisor += 1
    end
    return factors
  end
end
```

# 7. Ejemplo: test_factorize

![test-factorize.png](images/test-factorize.png)

```ruby
require 'test/unit'
require_relative 'mymath.rb'

class TestFactor < Test::Unit::TestCase
  def test_factorize_34
    assert_equal [2, 17], MyMath.factorize(34)
  end
end
```

# 8. Concurso de programación

![programame](images/programame.png)

# 9. QA

Aplicar **tests para mantener la calidad** de...
* Mi código.
* ¿Mi infraestructura?
* ¿Mis scripts?

![](images/rubygems.png)

# 10. Instalar Teuton

Instalar TEUTON:
* Instalar Ruby
* `gem install teuton`, instalar la gema

![](images/command-teuton.png)

# 11. Test local

![](images/localtest.png)

Para ejecutar el test hacemos:
```
teuton localtest
```

# 12. DSL sencillo

* **target**: Descripción del objetivo
* **run**: Comando que ejecutamos para comprobar.
* **expect**: Lo que esperamos "ver" en la salida del comando anterior.

```
1) Si sabes qué comando usar para comprobar el target...
2) Y sabes que debes "mirar" en la salida del comando...
¡Ya tienes el test!
```

> https://github.com/dvarrui/teuton-tests

# 13. Equipos remotos

![](images/teuton-esquema.png)

* Un host tiene teuton instalado.
* El resto tienen SSH para poder acceder.

# 14. Test remoto

¿Existe el usuario "Obiwan" en los equipos remotos?

![](images/remotetest.png)

Para ejecutar el test hacemos:
```
teuton remotetest
```

# 15. Configuración de los hosts

![](images/configyaml.png)

# 16. Saber más

* GitHub y docs: https://github.com/teuton-software/teuton
* Rubygems: https://rubygems.org/gems/teuton
* Ejemplos: https://github.com/dvarrui/teuton-tests

# 17. Muchas Gracias

* **Email**: teuton.software@protonmail.com
* **Telegram**: "TEUTON Software"
* **GitHub**: @teuton-software, @dvarrui
