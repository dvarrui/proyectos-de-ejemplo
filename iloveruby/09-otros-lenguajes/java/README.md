
# Artículo


[Method Overloading In Ruby](https://medium.com/@Nicholson85/method-overloading-in-ruby-22a169e704c7)

As most people reading this will be aware, it is naive to assume that core concepts which exist in one language are guaranteed to exist in…

# Comparativa

Los métodos sobrecargados de Customer.DisplayInfo en Java:
* 14 líneas.
* Acepta sólo 3 combinaciones:
    * firstname
    * firstname-lastname
    * firstname-lastname-email

El método customer.display_info de Ruby:
* 10 líneas de código.
* Acepta siguientes combinaciones
    * firstname, lastname, email, vacío
    * firstname-lastname, lastname-firstname, firstname-email, lastname-email, etc....
    * 3 argumentos en cualquier orden.
