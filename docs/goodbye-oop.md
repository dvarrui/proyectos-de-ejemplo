
# Good Bye OOP

> Steve me pasó el siguiente enlace (["Good Bye OOP"](https://medium.com/@cscalfani/goodbye-object-oriented-programming-a59cda4c0e53)) el 1 de enero de 2019, y no pude resistir la tentación de empezar a leerlo. El título era demasiado atrevido para dejarlo pasar.
>
> ¿Cómo era posible que alguien hiciera una artículo analizando la POO para intentar descartarla?
>
> El paradigma POO era un pilar fundamental en mis construcciones mentales. ¿Había llegado el momento de cambiar? ¿Acaso se había descubierto algo mejor? ¡Uff!
>
> Decidí portarme como un valiente. Empecé a leer el artículo ["Good Bye OOP"](https://medium.com/@cscalfani/goodbye-object-oriented-programming-a59cda4c0e53) y me puse a escribir mis pensamientos...

---

# Antecendentes

El autor comenta que tiene mucha experiencia en POO, usando los lenguajes C++, Smalltalk, .NET y Java.

---

# 1. La herencia: el primer pilar en caer.

Pienso igual que el autor en que **la herencia NO es un pilar importante** de la POO. Apesar de que sea lo primero que se enseña y se pone mucho énfasis. Pero es por una cuestión de que es fácil de ver y es educativo.

Pero es verdad que a la hora de la verdad la herencia NO es tan importante como nos la han "vendido". Es mejor la composición que la herencia. En el sentido de que la composición es lo que nos permitirá resolver la mayoría de los problemas reales que nos vamos a encontrar.

> **Conclusiones:**
> * Cuando nos enseñaron las clases pusieron demasiado énfasis en la herencia.
> * Hay que tener un poco de sentido común y no hay que creerse lo que diga la documentación hasta que no lo experimentemos por nosotros mismos.
> * Empate!

---

# 2. La herencia múltiple: _The diamond problem_

> Estoy de acuerdo con lo que dice el autor acerca de que la teoría de la herencia múltiple es muy bonita, pero a la hora de implementarla la cosa no está tan clara.
>
> De hecho C++ si tiene herencia múltiple, pero C#, Java y Ruby NO tienen herencia múltiple. ¡Problema resuelto!
>
> Pero ¿hay alguna forma "razonable" de tener la función de "herencia múltiple"? Porque incluso C++ tiene "problemillas" con ella.

* En Ruby NO se permite la herencia múltiple. Para resolver este problema tiene los MIXINS.
* [Ejemplo1 (herencia01.rb)](./files/herencia01.rb): No hay herencia múltiple. Ejemplo de la salida:
```
files> ./herencia01.rb
Scanner: Starting...
 * Scanning...
```

* [Ejemplo2: (herencia02.rb)](./files/herencia02.rb): Resolver el problema de la herencia múltiple usando Mixins.
    * El código que queremos reusar se escribe en módulos (clases no instanciables).
    * Cada clase puede reutilizar el códido de dichos módulos usando `include` (_Parecido al include de PHP_).
    * En el ejemplo tenemos un nuevo dispositivo que tiene código de Scanner y de Printer.
```
files> ./herencia02.rb
PowerDevice: Starting...
 * Scanning...
 * Writting...
```

* Hay otras formas de resolver este problema (_problema del diamante_) como  _"contain and delegate"_. Pero requieren trabajo manual para ajustarla... los Mixins son mucho más fáciles de usar.

> **Conclusiones:**
> * Teniendo _Mixins_ tenemos el efecto de herencia múltiple. Siendo más felices.
> * E problema del autor es pensar que la forma de resolver la herencia múltiple de Java es un problema extensible al paradigma POO.
> * _¡Me encanta la forma de pensar de Ruby!_

---

# 3. Los Genéricos

* Creamos la clase base ([MyArrayBase](./files/my-array-base.rb)) y la probamos ([base01.rb](./files/base01.rb)):
```
files> ./base01.rb
[ DO ] MyArrayBase => add 1, add 2, add 3
[INFO] [1, 2, 3]
[ DO ] MyArrayBase => add_all [4,5,6]
[INFO] [1, 2, 3, 4, 5, 6]
```
* Creando la clase [MyArrayCount](./files/my-array-count.rb) y [probándola](./files/base02.rb):
```
files> ./base02.rb
[ DO ] MyArrayCount => add 1, add 2, add 3
[INFO] count = 3 with [1, 2, 3]
[ DO ] MyArrayCount => add_all [4,5,6]
[INFO] count = 6 with [1, 2, 3, 4, 5, 6]
```

> Todo ¡OK! por ahora...

* ¡Rompamos la clase base como indica el enlace! ¡Ohps! ¡No se puede romper!. En Ruby hay definiciones de "genéricos" (no está la "a" del ejemplo para poderla quitar).

```
Java: ¡Vale, si! ¿Pero cómo funciona Ruby?
      ¿Por qué no tiene genéricos como Java?

Ruby: Porque Ruby usa "Duck typing" y tipado dinámico.
```

El problema viene que en Java "inventaron" los genéricos para poder crear 1 clase que pudiera servir para muchos tipos de datos diferentes.
* El programador irá cambiando el valor <Object> según el tipo de datos
que se quiera guardar en el ArrayList de Java. Para esto se usa esa "a": `private ArrayList<Object> a = new ArrayList<Object>();`
* Al quitar la "a" del método de la clase base, cuando la clase derivada invoca al método "add" de la clase base, ésta a su vez invoca al método de la clase derivada (creando un ciclo), y NO a la suya misma... porque la suya es "a.add"!!!
* **Ruby NO tiene ese problema porque tiene tipado dinámico y además "Duck typing"**. Esto es, una clase se declara y "da igual el tipo de los objetos dentro del contenedor".
* **Duck typing** dice: "si se habla como un pato, nada como un pato y camina como un pato... lo tratamos como un pato". No se verifica el tipo de datos (Clase) sino que tenga los métodos públicos que se van a usar desde fuera.

> **Conclusiones:**
> * El problema que menciona el autor es una sorpresa o factor inesperado al programar genéricos en Java pero NO tiene que ver con el paradigma de POO.
> * Además, tiene todo el sentido del mundo que un error en la programación de la clase base afectará inevitablemente a las clases derivadas. ¡Sí o sí!
> * while(true) { "I love ruby" }

---


# 4. La herencia: _The Fragile Base Class Problem_

> Además tengo que decir que el ejemplo del artículo tiene un error de programación. Que (también hay que decir) NO afecta a las conclusiones del artículo, pero bueno...¡ya que estamos! ¡Lo comento!

* Veamos la clase base del artículo:

```
import java.util.ArrayList;

public class Array
{
  private ArrayList<Object> a = new ArrayList<Object>();

  public void add(Object element)
  {
    a.add(element);
  }

  public void addAll(Object elements[])
  {
    for (int i = 0; i < elements.length; ++i)
      a.add(elements[i]); // this line is going to be changed
  }
}
```

* Y ahora echemos un vistazo a la clase derivada.

```
public class ArrayCount extends Array
{
  private int count = 0;

  @Override
  public void add(Object element)
  {
    super.add(element);
    ++count;
  }

  @Override
  public void addAll(Object elements[])
  {
    super.addAll(elements);
    count += elements.length;
  }
}
```

* ¿Ya lo viste? ¡Fallo en la clase derivada!
* Se supone que la clase derivada incluye una nueva funcionalidad que no tiene la clase base. Esto es, la capacidad de contar el número de elementos que se van añadiendo al ArrayList.
* El contador se incrementa en el método "add" y en "addAll", por tanto cada vez que se invoca al método "addAll" los items que se añaden al ArrayList... se cuentan dos veces. Pero cuando se añaden, de uno en uno por el modo "add" se cuentan de forma correcta.
* Hay que quitar el contador del método "addAll", y dejar que "add" sea el único que cuente.

> **Conclusiones:**
> * El problema que menciona el autor es una sorpresa o factor inesperado al programar usando herencias.
> * La clase derivada debe saber cómo está implementada la clase base para no tener sorpresas. Con lo cual de alguna manera hay que saltarse la encapsulación o
> * La clase base debe no reusar código para que la clase derivada no tenga que saber nada de la base. Pero claro, entonces fuera reusabilidad de componentes.
>
> ¿Cómo enfrentamos esta paradoja? "Contain and delegate". OK lo que pasa es que la herencia... no es tan buena idea.

---

> ¡Jajajaja! Soy un friki de los lenguajes de la programación ¡Es verdad!
>
> Pero es que si me "tocas" la POO, me "tocas" a Ruby... y eso... ¡no lo puedo dejar pasar así como así! ¡Ojito!
>
> ¡Thanks Steve! Estoy disfrutando con esto
>
> Fran ¡lo siento! Java no mola. ;-)
