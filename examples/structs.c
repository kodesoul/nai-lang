#include <stdio.h>

struct Color {
  unsigned char r;
  unsigned char g;
  unsigned char b;
  unsigned char a;
};

int main(void) {
  struct Color red = {0xFF, 0x00, 0x00, 0xFF};

  printf(
    "red = %i, green = %i, blue = %i", 
    red.r, red.g, red.b
  );
}
