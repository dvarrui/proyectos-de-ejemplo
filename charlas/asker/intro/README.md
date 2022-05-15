
# Asker

![](../images/logo.png)

* Rubygems: https://rubygems.org/gems/asker-tool/
* Repositorio: https://github/teuton-software/asker

# Agradecimientos

* Organización
* Baltazar
* Comunidad Asker (https://t.me/+FsuphhJSaaGVpKcv)
* Teuton Software

# Presentación

* David Vargas Ruiz
* Ingeniero Informático por la ULPGC
* Profesor FP de Sistemas (IES Puerto de la Cruz).
* Ruby, software libre y StarWars.

# El problema

* Como profesor siempre tenemos poco tiempo.
* Corregir es aburrido, pero el feedback es muy importante.
* Buscar formas/herramientas para automatizar tareas.
* Los cuestionarios de Moodle se corrigen solos pero... las preguntas hay que crearlas.

# Buscando la felicidad del profesorado

_El problema ahora es cómo crear las preguntas de forma fácil_.

# ¿Qué es Asker?

* Es un generador de preguntas que se pueden importar facilmente en el **banco de preguntas de Moodle**.
* Software libre
* Multiplataforma
* Desarrollado en Ruby

# Inputs


 para **crear muchas preguntas a
partir de unos contenidos de entrada (input)**.


Actualmente los "inputs" se crean con un editor de texto, pero la próxima
versión de Asker incluirá una **herramienta gráfica** para ayudar a elaborar
los "inputs" (contenidos de conocimiento).

## Documentación

Para saber más de la herramienta:
* [Rubygems](https://rubygems.org/gems/asker-tool/): https://rubygems.org/gems/asker-tool/
* [Documentación (versión 2.1)](https://www.rubydoc.info/gems/asker-tool/2.1.7)

## Ejemplos

* [Ejemplos](https://github.com/dvarrui/asker/tree/devel/docs/examples)
* [Más ejemplos](https://github.com/dvarrui/asker-inputs)

# 1. Presentation

**Who** are we?
* We are computer engineers.
* We teach IT in the Canary Islands (iespto.es)

**What** is Asker?
* Cross-platform Ruby tool.
* Free Software license.
* Create many questions from `conceptual map`.

**Why** create Asker?
* Because we are teachers and we want be happy

**How** will we be happy?
* Eliminating repetitive and boring tasks. Example boring task: "correcting the same activity over and over again".

We use Moodle (eLearning Platform) quizzes.
And there is no need to correct quizzes! But also with Asker...

```
We dont need to create questions!
(Leitmotiv)
```

**Where** is useful?
* Asker is ideal for creating activities very quickly on theoretical content of any domain.
* The aim is to improve the quality of life of the teacher.

---
_If teachers are happy, they will be more productive and as result... the students will learn better._
---

# 2. Installation

URL:
* Rubygem: https://rubygems/gems/asker-tool

Installation:
* Install Ruby: `sudo apt install ruby`.
* Install Ruby gem: `sudo gem install asker-tool`.

# 3. Use

Command line:
* Open a terminal
* Run `asker PATH/TO/HAML/FILE`

> NOTE: GUI front end in next future

* Your output are saved into `output` folder.
* Then, import `FILENAME.xml` into Moodle platform.

# 4. Inputs

_How Asker knows... what have to do?_

* Plain text file (HAML or XML)
* Input contains **Conceptual map** with
    * Concepts (and their definitions)
    * relationships are not required because are guessed by Asker.
* More input examples at https://github.com/dvarrui/asker-inputs.

# 5. Learning

URLs:
* Rubygems: https://rubygems/gems/asker-tool
* GitHub: https://guthub.com/teuton-software/asker

Documentation with
* Tutorials and videos

More help
* Regular Jitsi ONLINE events
* Telegram Chat
* email: teuton.software@protonmail.com

# 6. Create an input

Creating a basic asker input.
* Create plain HAML file
* Context
* Concept: names
* Concept: tags
* Concept: defs

**Improving inputs**
* Concept: tables and rows
* Concept: def with files
* More HAML files into the same folder

# 7. Future

* A lot of new ideas...

_Thank you very much!_

* David Vargas Ruiz
* GitHub: @dvarrui
* Twitter: @dvarrui
* Email: dvarrui@protonmail.com
