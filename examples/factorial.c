#include <stdio.h>

int factorial(int num)
{
  if (num == 0) return 0;
  if (num == 1) return 1;
  return num * factorial(num - 1);
}

int main(void)
{
  int num = factorial(7);
  printf("%d", num);
  return 0;
}
