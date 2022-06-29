#include <stdio.h>
#include <unistd.h>
#include <stdbool.h>

int main(int argc, char** argv) {
  int x;
  bool print = true, printedR = false;
  while ((x = getc(stdin)) != EOF) {
    print = true;
    if (x > 127) {
      putchar('_');
      print = false;
    }
    if (x == 0x0a) { // newline
      if (!printedR) {
        putchar(0x0d);
        fflush(stdout);
        sleep(1);
        putchar(0x0a);
        print = false;
      }
    }
    printedR = (x == 0x0d);
    if (print) {
      putchar(x);
      fflush(stdout);
    }
  }
  return 0;
}
