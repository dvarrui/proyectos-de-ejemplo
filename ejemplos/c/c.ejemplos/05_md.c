/* ***********************************************************************
**************************************************************************/
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <sys/timeb.h>


#define M_PI_2   1.57079632679489661923  /* pi/2 */
#define NDIM 3

int NPARTS;       /* No. of particles */
int NSTEPS;       /* No. of simulation steps */

typedef double vnd_t[NDIM];

/* -----------------------------------------------------------------------
                          PROTOTYPES
 * ----------------------------------------------------------------------- */

double v(double x);
double dv(double x);
void initialize(int np, int nd, vnd_t box, vnd_t *pos, vnd_t *vel, vnd_t *acc);
double dist(int nd, vnd_t r1, vnd_t r2, vnd_t dr);
double dot_prod(int n, vnd_t x,vnd_t y);
void compute(int np, int nd, vnd_t *pos, vnd_t *vel, double mass, vnd_t *f, double *pot_p, double *kin_p);
void update(int np, int nd, vnd_t *pos, vnd_t *vel, vnd_t *f, vnd_t *a, double mass, double dt);
int main (int argc, char **argv);

/* -----------------------------------------------------------------------
                          IMPLEMENTATION
 * ----------------------------------------------------------------------- */
/* -----------------------------------------------------------------------
   statement function for the pair potential.
   This potential is a harmonic well which smoothly saturates to a
   maximum value at PI/2.  
 * ----------------------------------------------------------------------- */
double v(double x) {
  if (x < M_PI_2) 
    return pow(sin(x), 2.0);
  else
    return 1.0;
}
/* -----------------------------------------------------------------------
   statement function for the derivative of the pair potential
 * ----------------------------------------------------------------------- */
double dv(double x) {
  if (x < M_PI_2) 
    return 2.0 * sin(x) * cos(x);
  else
    return 0.0;
}
/* -----------------------------------------------------------------------
   Initialize the positions, velocities, and accelerations.
 * ----------------------------------------------------------------------- */
void initialize(int np, int nd, vnd_t box, vnd_t *pos, vnd_t *vel, vnd_t *acc) {
  int i, j;
  double x;
  
  srand(4711L);
  for (i = 0; i < np; i++) {
    for (j = 0; j < nd; j++) {
      x = rand() % 10000 / (double)10000.0;
      pos[i][j] = box[j] * x;
      vel[i][j] = 0.0;
      acc[i][j] = 0.0;
    }
  }
}
/* -----------------------------------------------------------------------
   Compute the displacement vector (and its norm) between two particles. 
 * ----------------------------------------------------------------------- */
double dist(int nd, vnd_t r1, vnd_t r2, vnd_t dr) {
  int i;
  double d;
  
  d = 0.0;
  for (i = 0; i < nd; i++) {
    dr[i] = r1[i] - r2[i];
    d += dr[i] * dr[i];
  }
  return sqrt(d);
}
/* -----------------------------------------------------------------------
   Return the dot product between two vectors of type double and length n 
 * ----------------------------------------------------------------------- */
double dot_prod(int n, vnd_t x, vnd_t y) {
  int i;
  double t = 0.0;
  
  for (i = 0; i < n; i++) {
    t += x[i] * y[i];
  }
  return t;
}
/* -----------------------------------------------------------------------
   Compute the forces and energies, given positions, masses,
   and velocities
 * ----------------------------------------------------------------------- */
void compute(int np, int nd, vnd_t *pos, vnd_t *vel, 
	     double mass, vnd_t *f, double *pot_p, double *kin_p) {
  int i, j, k;
  vnd_t rij;
  double  d;
  double pot, kin;
  
  pot = 0.0;
  kin = 0.0;
  /* The computation of forces and energies is fully parallel. */
#pragma omp parallel for default(shared) private(i, j, k, rij, d) reduction(+ : pot, kin)
  for (i = 0; i < np; i++) {
    /* compute potential energy and forces */
    for (j = 0; j < nd; j++)
      f[i][j] = 0.0;
    for (j = 0; j < np; j++) {
      if (i != j) {
        d = dist(nd, pos[i], pos[j], rij);
        /* attribute half of the potential energy to particle 'j' */
        pot = pot + 0.5 * v(d);
        for (k = 0; k < nd; k++) {
          f[i][k] = f[i][k] - rij[k]* dv(d) /d;
        }
     } 
   }
   /* compute kinetic energy */
   kin = kin + dot_prod(nd, vel[i], vel[j]);
  }
  kin = kin * 0.5 * mass;
  *pot_p = pot;
  *kin_p = kin;
}
/* -----------------------------------------------------------------------
   Perform the time integration, using a velocity Verlet algorithm
 * ----------------------------------------------------------------------- */
void update(int np, int nd, vnd_t *pos, vnd_t *vel, vnd_t *f, vnd_t *a, double mass, double dt) {
  int i, j;
  double rmass;
  
  rmass = 1.0/mass;
  /* The time integration is fully parallel */
#pragma omp parallel for default(shared) private(i, j) 
  for (i = 0; i < np; i++) {
    for (j = 0; j < nd; j++) {
      pos[i][j] = pos[i][j] + vel[i][j]*dt + 0.5*dt*dt*a[i][j];
      vel[i][j] = vel[i][j] + 0.5*dt*(f[i][j]*rmass + a[i][j]);
      a[i][j] = f[i][j]*rmass;
    }
  }
}
/* ----------------------------------------------------------------------- */
int main (int argc, char **argv) {
  /* simulation parameters */
  double mass = 1.0;
  double dt = 1.0e-4;
  vnd_t box;
  vnd_t *position;
  vnd_t *velocity;
  vnd_t *force;
  vnd_t *accel;
  double potential, kinetic, E0;
  int i;
  struct timeb start, end;


  if (argc != 3) {
    printf("ERROR missing params!!\nSyntax:  %s <num particles> <num steps>\nExample: %s 8192 10\n", argv[0], argv[0]);
    exit(-1);
  }
 NPARTS = atoi(argv[1]);
  NSTEPS = atoi(argv[2]);

	/* Memory allocation */
	position = calloc(NPARTS, sizeof(vnd_t));
	velocity = calloc(NPARTS, sizeof(vnd_t));
	force    = calloc(NPARTS, sizeof(vnd_t));
	accel    = calloc(NPARTS, sizeof(vnd_t));

  if (position == NULL || velocity == NULL || force == NULL || accel == NULL) {
    printf("ERROR! Not enough memory!\n");
    exit(-1);
  }

  for (i = 0; i < NDIM; i++)
    box[i] = 10.0;
  /* set initial positions, velocities, and accelerations */
  initialize(NPARTS, NDIM, box, position, velocity, accel);
  ftime(&start);

  /* compute the forces and energies */
  compute(NPARTS, NDIM, position, velocity, mass, force, &potential, &kinetic);
  E0 = potential + kinetic;
  for (i = 0; i < NSTEPS; i++) {
    compute(NPARTS, NDIM, position, velocity, mass, force, &potential, &kinetic);
    update(NPARTS, NDIM, position, velocity, force, accel, mass, dt);
    printf("%17.9e %17.9e %17.9e\n", potential, kinetic, (potential + kinetic - E0) / E0);
  }

  ftime(&end);
  printf("\nTotal time %ld seconds.\n", (end.time - start.time));
  return 0;
}

