#include<stdio.h>

double factorial(double n)
  double f;
  if (n<=1) {
    return 1;
  }
  f = n * factorial(n-1)
  return f;
}

int main() {
  printf ("Escriba el número: ");
  scanf("%d",&n);
  printf ("El Factorial es: %d", factorial(n) );
}

/*
*/
