# C template

## readline prompt
## copy/pipe output to/from processes with popen fgetc fputc
```c
#include <stdio.h>
#include <stdlib.h> // for getenv
#include <readline/readline.h> // for readline prompt; add gcc argument -lreadline

int main() {
  char prompt[100];

  // make prompt
  sprintf(prompt, "%s> ", getenv("USER"));

  // read command
  char* command = readline(prompt);

  // open processes for reading
  FILE* source = popen(command, "r"); // source program
  FILE* dest = popen("bat --language bash /dev/stdin", "w"); // destination program to pipe to

  // copy char loop
  int b = 0;
  while ((b = fgetc(source)) != EOF) {
    char c = b;
    //TODO: process char c
    fputc(c, dest);
  }

  // cleanup
  fclose(source);
  fclose(dest);

  return 0;
}
```
