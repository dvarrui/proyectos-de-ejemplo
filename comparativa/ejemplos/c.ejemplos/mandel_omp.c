#include <stdio.h>
#include <stdlib.h>
#include <sys/timeb.h>

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
  
  if (argc != 5) {
    printf("ERROR: syntax %s <image_name.pgm> <width> <height> <max_iters>\n", argv[0]);
    exit(-1);
  }
  width = atol(argv[2]);
  height = atol(argv[3]);
  max_iters = atol(argv[4]);

  dx = ((XMAX - XMIN) / width);
  dy = ((YMAX - YMIN) / height);
  image = (unsigned char*)malloc(width*height);
  if (image == NULL) {
    printf("ERROR: Image size (%lux%lu) is too big!!\n", width, height);
    exit(-1);
  }
  FILE *fp=fopen(argv[1],"wb");
  fprintf(fp,"P5\n%s\n%lu %lu\n%d\n","#comment",width,height,MAX_COLOR);
  
  printf("Computing...\n");
  ftime(&start);

  #pragma omp parallel for default(none)  \
              private(xx, x0, y0, xp, yp, ii, xtemp) \
              shared(dx, dy, width, height, max_iters, image) \
              reduction(+:outside)
  //#pragma omp parallel for 
  for(yy = 0; yy < height; yy++) {
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
      image[yy*width+xx]= (double) ((MAX_COLOR*ii)/max_iters);
    }     
  }      
        
  ftime(&end);
  printf("\nTotal time %ld seconds\n", (end.time - start.time));
  
  /* Writing image */
  fwrite(image, sizeof(unsigned char), width*height, fp);
  fclose(fp);
  free(image);
  printf("Image (%lux%lu) written in file %s (%lu max iterations. Total points: %lu, outside: %lu)\n", 
         width, height, argv[1], max_iters, width*height,outside);

  return 0; 
}   

