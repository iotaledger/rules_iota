#include <gmock/gmock.h>
#include <gtest/gtest.h>

namespace {

class MockIf {
public:
  virtual void someStuff() = 0;
  virtual int someOther(int) = 0;
};

class MockClass : public MockIf {
public:
  MOCK_METHOD0(someStuff, void());
  MOCK_METHOD1(someOther, int(int));
};

TEST(SampleTest, AlwaysWorks) {
  MockClass clz;
  volatile int t = 5;

  EXPECT_EQ(t + 1, 6);
  EXPECT_CALL(clz, someStuff());
  EXPECT_CALL(clz, someOther(2));

  clz.someStuff();
  clz.someOther(2);
}
} // namespace
