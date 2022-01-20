
# Installation


## rbenv environment

**dvarrui:** I did this:

`sudo gem install curses -v 1.4.2`

```
> gem list |grep curse
curses (1.4.3)
sudo zypper se curses
Cargando datos del repositorio...
Leyendo los paquetes instalados...
```

I had rbenv with ruby 3.0.3

**shugo:** Which version of underlying curses library do you use?

$ ruby -r curses -e 'p Curses::VERSION'
```
> ruby -r curses -e 'p Curses::VERSION'
"ncurses 6.1.20180317"
```

**dvarrui**: I see ncurses... I hadn't that gem but is installed on my system.
I proceed to purge ncurses on my system.

## system

`zypper se curses`, this package name dosn't exist on OpenSUSE 15.3.

```
S  | Name                          | Summary                                                          | Type
---+-------------------------------+------------------------------------------------------------------+------------
   | BitTorrent-curses             | Scatter-Gather Network File Transfer - Curses based UI           | paquete
   | gambas3-gb-ncurses            | The ncurses component for Gambas                                 | paquete
   | libncurses5                   | Terminal control library                                         | paquete
   | libncurses5-32bit             | Terminal control library                                         | paquete
i  | libncurses6                   | Terminal control library                                         | paquete
   | libncurses6-32bit             | Terminal control library                                         | paquete
   | libyui-ncurses                | Libyui - NCurses (text based) user interface                     | paquete src
   | libyui-ncurses-devel          | Libyui - Header fles for the NCurses (text based) user interface | paquete
   | libyui-ncurses-pkg            | Libyui - yast2 package selector widget for the NCurses UI        | paquete src
   | libyui-ncurses-pkg-devel      | Libyui-ncurses-pkg header files                                  | paquete
   | libyui-ncurses-pkg-doc        | Libyui-ncurses-pkg documentation                                 | paquete
   | libyui-ncurses-pkg-doc        | Libyui-ncurses-pkg documentation                                 | paquete src
   | libyui-ncurses-pkg11          | Libyui - yast2 package selector widget for the ncurses UI        | paquete
i  | libyui-ncurses-pkg15          | Libyui - yast2 package selector widget for the NCurses UI        | paquete
   | libyui-ncurses-rest-api       | Libyui - REST API plugin for the Ncurses frontend                | paquete src
   | libyui-ncurses-rest-api-devel | Libyui - Header files for the NCurses REST API plugin            | paquete
   | libyui-ncurses-rest-api15     | Libyui - REST API plugin for the Ncurses frontend                | paquete
   | libyui-ncurses-tools          | Libyui - tools for the NCurses (text based) user interface       | paquete
i  | libyui-ncurses11              | Libyui - Character Based User Interface                          | paquete
i  | libyui-ncurses15              | Libyui - NCurses (text based) user interface                     | paquete
   | ncurses                       | Terminal control library                                         | paquete src
i+ | ncurses-devel                 | Development files for the ncurses6 terminal control library      | paquete
   | ncurses-devel-32bit           | Development files for the ncurses6 terminal control library      | paquete
i  | ncurses-utils                 | Tools using the new curses libraries                             | paquete
   | ncurses5-devel                | Development files for the ncurses5 terminal control library      | paquete
   | ncurses5-devel-32bit          | Development files for the ncurses5 terminal control library      | paquete
   | ocaml-curses                  | OCaml bindings for ncurses                                       | paquete
   | ocaml-curses-devel            | Development files for ocaml-curses                               | paquete
   | perl-Curses                   | Terminal screen handling and optimization                        | paquete
   | perl-CursesWidgets            | CursesWidgets Perl module                                        | paquete
   | python-curses                 | Python Interface to the (N)Curses Library                        | paquete
i  | python3-curses                | Python Interface to the (N)Curses Library                        | paquete
   | python39-curses               | Python Interface to the (N)Curses Library                        | paquete
i  | qemu-ui-curses                | Curses based UI support for QEMU                                 | paquete
```
