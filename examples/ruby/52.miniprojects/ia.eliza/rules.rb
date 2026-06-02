class Eliza
  # Diccionario para intercambiar pronombres y verbos (Efecto espejo)
  REFLECTIONS = {
    "yo"     => "tú",
    "mi"     => "tu",
    "mis"    => "tus",
    "me"     => "te",
    "soy"    => "eres",
    "fui"    => "fuiste",
    "tengo"  => "tienes",
    "mío"    => "tuyo",
    "tú"     => "yo",
    "tu"     => "mi",
    "tus"    => "mis",
    "te"     => "me",
    "eres"   => "soy",
    "tienes" => "tengo"
  }

  # Reglas de conversación: [Expresión regular, [Lista de posibles respuestas]]
  RULES = [
    [/\b(?:hola|buenos dias|buenas tardes)\b/i, [
      "Hola, ¿cómo estás hoy?",
      "Hola. ¿De qué te gustaría hablar?",
      "Hola, ¿qué te trae por aquí hoy?"
    ]],
    
    [/me siento (.*)/i, [
      "¿Por qué te sientes %1?",
      "¿Desde cuándo te sientes %1?",
      "¿Qué crees que te hace sentir %1?"
    ]],
    
    [/por qué no (.*)/i, [
      "¿De verdad crees que no %1?",
      "Quizás lo haga en el futuro, ¿quién sabe?",
      "¿Te gustaría que yo %1?"
    ]],
    
    [/puedes (.*)/i, [
      "¿Qué te hace pensar que puedo %1?",
      "Si pudiera %1, ¿en qué te ayudaría?",
      "¿Por qué deseas que sea capaz de %1?"
    ]],
    
    [/eres (.*)/i, [
      "¿Te importa que sea %1?",
      "¿Por qué crees que soy %1?",
      "¿Tal vez te recuerde a alguien el hecho de que sea %1?"
    ]],
    
    [/mi (madre|padre|hermano|hermana|familia) (.*)/i, [
      "Cuéntame más sobre tu %1.",
      "¿Cómo es tu relación con tu %1?",
      "¿El comportamiento de tu %1 te afecta a menudo?"
    ]],
    
    [/(.*) (triste|enojado|asustado|mal|deprimido|cansado) (.*)/i, [
      "Lamento escuchar que te sientas %2.",
      "¿Qué crees que causó ese sentimiento de estar %2?",
      "¿Hablar de ello te ayuda a sentirte mejor?"
    ]],
    
    [/quiero (.*)/i, [
      "¿Qué significaría para ti conseguir %1?",
      "¿Por qué quieres %1?",
      "Si consiguieras %1, ¿qué cambiaría en tu vida?"
    ]],
    
    [/(.*) (computadora|ordenador|ia|robot|maquina) (.*)/i, [
      "¿Te generan desconfianza las máquinas?",
      "¿Por qué mencionas a la tecnología?",
      "¿Crees que una máquina no puede llegar a comprenderte?"
    ]],
    
    [/\bsi\b/i, [
      "Se te ve muy seguro de eso.",
      "Ya veo. Por favor, continúa.",
      "¿Podrías profundizar un poco más en ese 'sí'?"
    ]],
    
    [/\bno\b/i, [
      "¿Por qué no?",
      "¿Estás diciendo 'no' solo por llevar la contraria?",
      "Ya veo. ¿Y qué es lo que sí consideras correcto?"
    ]],
    
    # Comodín / Fallback: Cuando no entiende nada de lo anterior
    [/(.*)/, [
      "Por favor, continúa.",
      "¿Qué te hace decir eso?",
      "Ya veo. ¿Y cómo te hace sentir eso?",
      "¿Puedes explicarme un poco más sobre eso?",
      "¿Qué crees que significa eso en el fondo?"
    ]]
  ]
end