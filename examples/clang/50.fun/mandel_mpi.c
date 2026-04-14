#include <stdio.h>
#include <stdlib.h>
#include <sys/timeb.h>
#include <mpi.h>

#define MAX_COLOR 255
#define XMIN -1.7
#define XMAX 0.5
#define YMIN -1.2
#define YMAX 1.2
#define THRESHOLD 4.0


int main(int argc, char **argv) {
  double xp, x0, yp, y0, xtemp, dx, dy;
  unsigned long ii, xx, yy, width, height, max_iters, outside = 0;
  unsigned char *image = NULL;
  struct timeb start, end;
  int myrank, nprocs;
  FILE *fp = NULL;
  int partner;
  MPI_Status status;

  MPI_Init(&argc, &argv);
  MPI_Comm_rank(MPI_COMM_WORLD, &myrank);
  MPI_Comm_size(MPI_COMM_WORLD, &nprocs);
  
  if (argc != 5) {
    printf("ERROR: syntax %s <image_name.pgm> <width> <height> <max_iters>\n", argv[0]);
    exit(-1);
  }
  width = atol(argv[2]);
  height = atol(argv[3]);
  max_iters = atol(argv[4]);

  dx = ((XMAX - XMIN) / width);
  dy = ((YMAX - YMIN) / height);
 
  if (myrank == 0) { 
    image = (unsigned char*)malloc(width*height);

    fp=fopen(argv[1],"wb");
    fprintf(fp,"P5\n%s\n%lu %lu\n%d\n","#comment",width,height,MAX_COLOR);
  }
  else {
    image = (unsigned char*)malloc(width);
  }

  if (image == NULL) {
    printf("ERROR: Image size (%lux%lu) is too big!!\n", width, height);
    MPI_Abort(MPI_COMM_WORLD, -1);
  }
 
  printf("Computing...\n");
  ftime(&start);

  for(yy = myrank; yy < height; yy+=nprocs) {

    for(xx = 0; xx < width; xx++) {
      x0 = XMIN + xx * dx;
      y0 = YMIN + yy * dy;
      xp = 0.0;
      yp = 0.0;
      for (ii=0; ii < max_iters; ii++) {
        if (xp*xp + yp*yp >= THRESHOLD) {
          outside++;
          break;
        }
        xtemp = xp*xp - yp*yp + x0;
        yp = 2*xp*yp + y0;
        xp=xtemp;
      }
      if (myrank == 0) {
        image[yy*width+xx] = (double) ((MAX_COLOR*ii)/max_iters);
      } 
      else {
        image[xx] = (double) ((MAX_COLOR*ii)/max_iters);
      }
    } 

    if (myrank == 0) {
      for (partner = 1; partner < nprocs; partner++) {
        MPI_Recv(&image[(yy+partner)*width], width, MPI_CHAR, partner, 0, MPI_COMM_WORLD, &status);
      }
    }
    else {
      MPI_Send(&image[0], width, MPI_CHAR, 0, 0, MPI_COMM_WORLD);
    }

        
  }
  int prb;
  MPI_Reduce(&outside, &prb, 1, MPI_INT, MPI_SUM, 0, MPI_COMM_WORLD);      
        
  ftime(&end);
  printf("\nTotal time %ld seconds\n", (end.time - start.time));
  
  /* Writing image */
  if (myrank == 0) { 
    fwrite(image, sizeof(unsigned char), width*height, fp);
    fclose(fp);
  }
  free(image);
  printf("Image (%lux%lu) written in file %s (%lu max iterations. Total points: %lu, outside: %lu)\n", 
         width, height, argv[1], max_iters, width*height,prb);

  MPI_Finalize();
  return 0; 
}   

