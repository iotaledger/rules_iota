#include <string.h>

#include "xxhash.h"

unsigned long long calcul_hash(const void *buffer, size_t length) {
  unsigned long long const seed = 0; /* or any other value */
  unsigned long long const hash = XXH64(buffer, length, seed);

  return hash;
}

int main() {
  char const *const buffer = "Hello World";

  calcul_hash(buffer, strlen(buffer));

  return 0;
}
