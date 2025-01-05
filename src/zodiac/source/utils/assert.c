#include "zodiac.h"

void assert(int condition, const char* message) {

  // n.b.: assert condition must be true
  //
  // warning: if condition is false, the program will exit immediately and
  //          file descriptors and other resources might not be unallocated
  //          mind to use atexit()

  if (!condition) {
    printf("Assertion failed: %s\n", message);
    exit(1);
  }

}
