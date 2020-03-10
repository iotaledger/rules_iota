#include "FIPS202/KeccakHash.h"
#include "unity/unity.h"

void test_init_keccak() {
  Keccak_HashInstance keccak;

  unsigned int rate = 832;
  unsigned int capacity = 768;
  unsigned int hashbitlen = 384;
  unsigned char delimitedSuffix = 0x01;
  TEST_ASSERT_TRUE(Keccak_HashInitialize(&keccak, rate, capacity, hashbitlen, delimitedSuffix) == KECCAK_SUCCESS);

}

int main(int argc, char** argv) {
  UNITY_BEGIN();

  RUN_TEST(test_init_keccak);

  return UNITY_END();
};
