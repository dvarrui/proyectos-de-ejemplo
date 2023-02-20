#include <stdio.h>
#include <string.h>

int main() {
  char *token;
  char line[] = "Sólo sé que no sé nada.";
  char *search = " ";

  // Token will point to "SEVERAL".
  token = strtok(line, search);

  while(strlen(token)>0) {
    puts(token);
    token = strtok(NULL, search);
  }
  return 0;
}
