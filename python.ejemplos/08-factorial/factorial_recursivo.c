#include<stdio.h>

int factorial(int n) {
  int f;
  if(n<=1) {
    return 1;
  }
  f = n * factorial(n-1);
  return f;
}

int main() {
  int n;
  printf ("Escriba el número: ");
  scanf("%d",&n);
  printf ("El Factorial es: %d", factorial(n) );
}

/*
*/
