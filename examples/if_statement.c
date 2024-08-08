#include <stdio.h>

int main (void)
{
  int life = 42;

  if (life == 42) {
    life = 69;
  } else {
    life = 420;
  }

  printf("life = %d", life);

  return 0;
}
