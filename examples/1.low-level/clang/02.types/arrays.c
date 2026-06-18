#include <stdio.h>
#include <stdlib.h> // Necesario para la función atoi()

/* * El main ahora recibe dos argumentos:
 * argc: El contador de argumentos (incluye el nombre del programa).
 * argv: El vector de argumentos (array de cadenas de texto).
 */
int main(int argc, char *argv[]) {
    // Si la función se llama "programa.exe" y pasamos 3 números:
    // argc será 4 (programa.exe, num1, num2, num3)

    // 1. Verificar que se haya pasado al menos un número
    if (argc < 2) {
        printf("Uso: %s <numero1> <numero2> <numero3> ...\n", argv[0]);
        printf("Ejemplo: %s 10 20 30 40 50\n", argv[0]);
        return 1; // Terminar con error
    }

    // El número de elementos a guardar es (argc - 1), 
    // porque argv[0] es el nombre del programa.
    int tamano = argc - 1;
    
    // 2. Declarar el array (el tamaño es la cantidad de argumentos numéricos)
    int numeros[tamano];
    int i; 

    // 3. Recorrer los argumentos de la línea de comandos y guardarlos
    // Empezamos desde i = 1 porque argv[0] es el nombre del programa.
    printf("Guardando %d números en el array...\n", tamano);
    for (i = 1; i < argc; i++) {
        // La función atoi() (ASCII to Integer) convierte la cadena de texto 
        // del argumento (argv[i]) en un número entero.
        numeros[i - 1] = atoi(argv[i]);
    }

    // 4. Mostrar el contenido del array para verificar
    printf("\n--- Contenido del Array (leído de los argumentos) ---\n");
    for (i = 0; i < tamano; i++) {
        printf("Posición %d: %d\n", i, numeros[i]);
    }
    printf("\n");

    return 0;
}
