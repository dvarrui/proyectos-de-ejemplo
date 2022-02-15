/* ***********************************************************************
**************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <sys/timeb.h> 
#include <mpi.h>



#define DEFAULT_PREC 10000000000   /* Default precision */

int main(int argc, char *argv[]) {
  double PI25DT = 3.141592653589793238462643;
  double local, w, total_time, pi;
  struct timeb start, end;
  unsigned long long i, N;   /* Precision */
  int myrank, nprocs;

  MPI_Init(&argc, &argv);
  MPI_Comm_rank(MPI_COMM_WORLD, &myrank);
  MPI_Comm_size(MPI_COMM_WORLD, &nprocs);

  N = (argc >= 2) ? atol(argv[1]) : DEFAULT_PREC;
  ftime(&start);

  w = 1.0 / N;
  pi = 0.0;

  for(i = myrank; i < N; i+=nprocs) {
    local = (i + 0.5) * w;
    pi += 4.0 / (1.0 + local * local);
  }
  double pi_tot;
  MPI_Reduce(&pi, &pi_tot, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);
  pi_tot *= w;
  
  ftime(&end);
  printf("\tITERS: %llu   TIME: %ld sec.   PI:%.18lf    ERROR:%g\n", N, (end.time-start.time), pi_tot, PI25DT-pi_tot);
  MPI_Finalize();
  return 0;
}

