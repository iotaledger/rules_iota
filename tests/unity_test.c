#include "unity.h"
#include "unity_fixture.h"

TEST_GROUP(ProductionCode);

// sometimes you may want to get at local data in a module.
// for example: If you plan to pass by reference, this could be useful
// however, it should often be avoided
int Counter;

TEST_SETUP(ProductionCode) {
  // This is run before EACH TEST
  Counter = 0x5a5a;
}

TEST_TEAR_DOWN(ProductionCode) {}

TEST(ProductionCode, Dummy) {}

TEST_GROUP_RUNNER(ProductionCode) { RUN_TEST_CASE(ProductionCode, Dummy); }

static void RunAllTests(void) { RUN_TEST_GROUP(ProductionCode); }

int main(int argc, const char *argv[]) {
  return UnityMain(argc, argv, RunAllTests);
}
