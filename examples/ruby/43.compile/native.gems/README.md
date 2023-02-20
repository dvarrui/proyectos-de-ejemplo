
# Native gems

Enlaces de interés:
* https://notepad.onghu.com/2023/learning-by-reversing-s1-e1-native-gems/

## Instalación

Proceso:
* Tengo instalado: gcc, make y ruby-devel.
* Instalamos la gem que vamos a estudiar (`bundle install`)
* Probamos la gema:

```
❯ irb
irb> require "fast-polylines"
=> true

irb> FastPolylines.encode([[38.5, -120.2], [40.7, -120.95], [43.252, -126.453]])
=> "_p~iF~ps|U_ulLnnqC_mqNvxq`@"
```

## Unpack

Desempaquetamos la gema para poder estudiarla:
* `mkdir unpack`
* `cd unpack`
* `gem fetch fast-polylines`
* `gem unpack fast-polylines-2.2.2.gem`

De modo que tenemos lo siguiente:
```
❯ tree
.
├── fast-polylines-2.2.2
│   ├── CHANGELOG.md
│   ├── ext
│   │   └── fast_polylines
│   │       ├── extconf.rb
│   │       └── fast_polylines.c
│   ├── lib
│   │   ├── fast_polylines
│   │   │   └── version.rb
│   │   ├── fast-polylines.rb
│   │   └── fast_polylines.rb
│   ├── README.md
│   └── spec
│       ├── fast-polylines_spec.rb
│       ├── fast_polylines_spec.rb
│       └── spec_helper.rb
└── fast-polylines-2.2.2.gem
```

Nos falta un fichero más.

```
gem spec fast-polylines-2.2.2.gem --ruby > fast-polylines-2.2.2/fast-polylines.gemspec
```

> El comando anterior sin `--ruby` extrae las especificaciones en formato YAML.
`
## Source code
