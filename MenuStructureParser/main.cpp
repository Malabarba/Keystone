#include "myprint.hpp"

short VERBOSE_LEVEL = 4;

int main( int argc, char* args[] ){
  if (argc < 2) {
    mpe("Need filename!");
  }
  return 0;
}
