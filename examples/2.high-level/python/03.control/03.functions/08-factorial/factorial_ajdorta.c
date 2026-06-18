#include <stdio.h>
#include <stdlib.h>

long double factorial (long long unsigned val) {
  if (val == 1) {
    return 1;
  }
  return (val * factorial(val -1));
}

int main(int argc, char *argv[]) {
  long double val;

  if (argc != 2) {
    printf("ERROR!! Debe indicar el valor para calcular el factorial");
    return 1;
  }

  val = (long double) atof(argv[1]);
  printf("El factorial de %LF es %LF\n", val, factorial(val));

  return 0;
}
