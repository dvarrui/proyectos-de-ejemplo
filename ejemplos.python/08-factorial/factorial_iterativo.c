#include<stdio.h>

int main() {
  int n, f=1;
  printf ("Digite numero:");
  scanf("%d",&n);
  if (n<0) {
    printf ("numero no valido");
  } else {
    while(n>0){
      f=n*f;
      n --;
    }
  }
  printf ("El Factorial es: %d", f);
}

/*
% ./a.out                                                                           19-01-22 - 1:46:08
Digite numero:3
El Factorial es: 6
% ./a.out                                                                           19-01-22 - 1:46:12
Digite numero:30
El Factorial es: 1409286144
% ./a.out                                                                           19-01-22 - 1:46:15
Digite numero:300
El Factorial es: 0

*/
