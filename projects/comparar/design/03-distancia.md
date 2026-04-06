[<< back](./README.md)

# 3. Distancia


Supongo que lo ideal sería que el modelo del problema que se quiera resolver haga match con el modelo cognitivo del lenguaje X para considerarlo el lenguaje apropiado para ese problema
Gemini ha dicho

Has dado en el clavo. De hecho, ese "match" o sintonía es el santo grial de la arquitectura de software. Cuando el modelo mental de la solución y el modelo cognitivo del lenguaje están alineados, el código se siente natural, casi como si se escribiera solo.

A este fenómeno se le suele llamar reducción de la Distancia Cognitiva (o evitar el "Impedance Mismatch").
1. El concepto de "Distancia Cognitiva"

La Distancia Cognitiva es el esfuerzo que debe hacer tu cerebro para traducir una idea de la vida real a instrucciones de computadora.

    Poca distancia: Si estás diseñando una base de datos de contabilidad y usas SQL, el lenguaje habla de "tablas", "relaciones" y "conjuntos", que es exactamente como un contador ve sus libros. El match es casi perfecto.

    Mucha distancia: Si intentas programar una interfaz gráfica de usuario (GUI) altamente interactiva usando C puro. Tu cerebro quiere pensar en "botones" y "clics", pero el lenguaje te obliga a pensar en "punteros de memoria" e "interrupciones de hardware". La distancia es enorme y ahí es donde aparecen los errores.

2. Ejemplos de "Matches" Perfectos

Aquí tienes casos donde la elección del lenguaje se basa totalmente en que su modelo cognitivo "imita" la naturaleza del problema:
Problema	Modelo del Problema	Lenguaje Ideal	¿Por qué hacen match?
Sistemas de Chat (WhatsApp)	Millones de personas hablando a la vez independientemente.	Erlang / Elixir	Usa el Modelo de Actores. Cada usuario es un "proceso" aislado que envía mensajes. El lenguaje piensa igual que el chat.
Inteligencia Artificial / Datos	Transformaciones matemáticas y estadísticas sobre grandes volúmenes.	Python (con R/NumPy)	Su sintaxis es casi notación matemática. No te preocupas por la memoria, sino por la matriz.
Contratos Inteligentes (Blockchain)	Reglas estrictas de "si pasa A, entonces se transfiere B".	Solidity	Está diseñado para ser un modelo de "máquina de estados" con propiedad integrada.
Navegadores Web	Documentos jerárquicos con estilos visuales.	HTML / CSS	Son lenguajes declarativos. No dices cómo dibujar un círculo, dices que hay un círculo.
3. ¿Qué pasa cuando el match es forzado?

A veces, por moda o por exigencias del proyecto, usamos el lenguaje equivocado para el modelo del problema. Esto produce:

    Código "Espagueti": Tienes que crear tantas capas de traducción que la lógica original se pierde.

    Fricción Mental: Sientes que estás "luchando contra el lenguaje" en lugar de usarlo como una herramienta.

    Fragilidad: Como el modelo no encaja, cualquier cambio pequeño en el problema requiere una reestructuración masiva del código.
