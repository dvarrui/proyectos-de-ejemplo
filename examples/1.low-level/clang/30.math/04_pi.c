/* ***********************************************************************
**************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <sys/timeb.h> 



#define DEFAULT_PREC 10000000000   /* Default precision */

int main(int argc, char *argv[]) {
  double PI25DT = 3.141592653589793238462643;
  double local, w, total_time, pi;
  struct timeb start, end;
  unsigned long long i, N;   /* Precision */

  N = (argc >= 2) ? atol(argv[1]) : DEFAULT_PREC;
  ftime(&start);

  w = 1.0 / N;
  pi = 0.0;
/* #pragma omp parallel for default(shared) private(i, local)reduction(+:pi) schedule(static, 1) */
#pragma omp parallel for default(shared) private(i, local)reduction(+:pi)
  for(i = 0; i < N; i++) {
    local = (i + 0.5) * w;
    pi += 4.0 / (1.0 + local * local);
  }
  pi *= w;
  
  ftime(&end);
  printf("\tITERS: %llu   TIME: %ld sec.   PI:%.18lf    ERROR:%g\n", N, (end.time-start.time), pi, PI25DT-pi);
  return 0;
}

