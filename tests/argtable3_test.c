#include <stdio.h>
#include <string.h>

#include "argtable3.h"
#include "unity/unity.h"

#if defined(_MSC_VER)
#pragma warning(push)
#pragma warning(disable : 4204)
#endif

void test_arglit_basic_001() {
  struct arg_lit* a = arg_lit0(NULL, "hello,world", "either --hello or --world or none");
  struct arg_lit* b = arg_lit0("bB", NULL, "either -b or -B or none");
  struct arg_lit* c = arg_lit1("cC", NULL, "either -c or -C");
  struct arg_lit* d = arg_litn("dD", "delta", 2, 4, "-d|-D|--delta 2..4 occurences");
  struct arg_lit* help = arg_lit0(NULL, "help", "print this help and exit");
  struct arg_end* end = arg_end(20);
  void* argtable[] = {a, b, c, d, help, end};
  int nerrors;

  char* argv[] = {"program", "--help", NULL};
  int argc = sizeof(argv) / sizeof(char*) - 1;

  TEST_ASSERT_TRUE(arg_nullcheck(argtable) == 0);

  nerrors = arg_parse(argc, argv, argtable);

  TEST_ASSERT_TRUE(nerrors == 2);
  TEST_ASSERT_TRUE(a->count == 0);
  TEST_ASSERT_TRUE(b->count == 0);
  TEST_ASSERT_TRUE(c->count == 0);
  TEST_ASSERT_TRUE(d->count == 0);
  TEST_ASSERT_TRUE(help->count == 1);

  arg_freetable(argtable, sizeof(argtable) / sizeof(argtable[0]));
}

void test_argstr_basic_001() {
  struct arg_str* a = arg_str0(NULL, "hello,world", "STRVAL", "either --hello or --world or none");
  struct arg_str* b = arg_str0("bB", NULL, "STRVAL", "either -b or -B or none");
  struct arg_str* c = arg_str1("cC", NULL, "STRVAL", "either -c or -C");
  struct arg_str* d = arg_strn("dD", "delta", "STRVAL", 2, 4, "-d|-D|--delta 2..4 occurences");
  struct arg_end* end = arg_end(20);
  void* argtable[] = {a, b, c, d, end};
  int nerrors;

  char* argv[] = {"program", "--hello=string1", NULL};
  int argc = sizeof(argv) / sizeof(char*) - 1;

  TEST_ASSERT_TRUE(arg_nullcheck(argtable) == 0);

  nerrors = arg_parse(argc, argv, argtable);

  TEST_ASSERT_TRUE(nerrors == 2);
  TEST_ASSERT_TRUE(a->count == 1);
  TEST_ASSERT_EQUAL_STRING(a->sval[0], "string1");
  TEST_ASSERT_TRUE(b->count == 0);
  TEST_ASSERT_TRUE(c->count == 0);
  TEST_ASSERT_TRUE(d->count == 0);

  arg_freetable(argtable, sizeof(argtable) / sizeof(argtable[0]));
}

void test_argint_basic_001() {
  struct arg_int* a = arg_int1(NULL, NULL, "a", "a is <int>");
  struct arg_int* b = arg_int0(NULL, NULL, "b", "b is <int>");
  struct arg_int* c = arg_int0(NULL, NULL, "c", "c is <int>");
  struct arg_int* d = arg_intn("dD", "delta", "<int>", 0, 3, "d can occur 0..3 times");
  struct arg_int* e = arg_int0(NULL, "eps,eqn", "<int>", "eps is optional");
  struct arg_int* f = arg_intn("fF", "filler", "<int>", 0, 3, "f can occur 0..3 times");
  struct arg_end* end = arg_end(20);
  void* argtable[] = {a, b, c, d, e, f, end};
  int nerrors;

  char* argv[] = {"program", "0", NULL};
  int argc = sizeof(argv) / sizeof(char*) - 1;

  TEST_ASSERT_TRUE(arg_nullcheck(argtable) == 0);

  nerrors = arg_parse(argc, argv, argtable);

  TEST_ASSERT_TRUE(nerrors == 0);
  TEST_ASSERT_TRUE(a->count == 1);
  TEST_ASSERT_EQUAL_INT(a->ival[0], 0);
  TEST_ASSERT_TRUE(b->count == 0);
  TEST_ASSERT_TRUE(c->count == 0);
  TEST_ASSERT_TRUE(d->count == 0);
  TEST_ASSERT_TRUE(e->count == 0);
  TEST_ASSERT_TRUE(f->count == 0);

  arg_freetable(argtable, sizeof(argtable) / sizeof(argtable[0]));
}

void test_argdate_basic_001() {
  struct arg_date* a = arg_date1(NULL, NULL, "%H:%M", NULL, "time 23:59");
  struct arg_date* b = arg_date0("b", NULL, "%Y-%m-%d", NULL, "date YYYY-MM-DD");
  struct arg_date* c = arg_daten(NULL, "date", "%D", NULL, 1, 2, "MM/DD/YY");
  struct arg_end* end = arg_end(20);
  void* argtable[] = {a, b, c, end};
  int nerrors;

  char* argv[] = {"program", "23:59", "--date", "12/31/04", NULL};
  int argc = sizeof(argv) / sizeof(char*) - 1;

  TEST_ASSERT_TRUE(arg_nullcheck(argtable) == 0);

  nerrors = arg_parse(argc, argv, argtable);

  TEST_ASSERT_TRUE(nerrors == 0);
  TEST_ASSERT_TRUE(a->count == 1);
  TEST_ASSERT_EQUAL_INT(a->tmval->tm_sec, 0);
  TEST_ASSERT_EQUAL_INT(a->tmval->tm_min, 59);
  TEST_ASSERT_EQUAL_INT(a->tmval->tm_hour, 23);
  TEST_ASSERT_EQUAL_INT(a->tmval->tm_mday, 0);
  TEST_ASSERT_EQUAL_INT(a->tmval->tm_mon, 0);
  TEST_ASSERT_EQUAL_INT(a->tmval->tm_year, 0);
  TEST_ASSERT_EQUAL_INT(a->tmval->tm_wday, 0);
  TEST_ASSERT_EQUAL_INT(a->tmval->tm_yday, 0);
  TEST_ASSERT_EQUAL_INT(a->tmval->tm_isdst, 0);
  TEST_ASSERT_TRUE(b->count == 0);
  TEST_ASSERT_TRUE(c->count == 1);
  TEST_ASSERT_EQUAL_INT(c->tmval->tm_sec, 0);
  TEST_ASSERT_EQUAL_INT(c->tmval->tm_min, 0);
  TEST_ASSERT_EQUAL_INT(c->tmval->tm_hour, 0);
  TEST_ASSERT_EQUAL_INT(c->tmval->tm_mday, 31);
  TEST_ASSERT_EQUAL_INT(c->tmval->tm_mon, 11);
  TEST_ASSERT_EQUAL_INT(c->tmval->tm_year, 104);
  TEST_ASSERT_EQUAL_INT(c->tmval->tm_wday, 0);
  TEST_ASSERT_EQUAL_INT(c->tmval->tm_yday, 0);
  TEST_ASSERT_EQUAL_INT(c->tmval->tm_isdst, 0);

  arg_freetable(argtable, sizeof(argtable) / sizeof(argtable[0]));
}

void test_argfile_basic_001() {
  struct arg_file* a = arg_file1(NULL, NULL, "<file>", "filename to test");
  struct arg_end* end = arg_end(20);
  void* argtable[] = {a, end};
  int nerrors;

  char* argv[] = {"program", "foo.bar", NULL};
  int argc = sizeof(argv) / sizeof(char*) - 1;

  TEST_ASSERT_TRUE(arg_nullcheck(argtable) == 0);
  nerrors = arg_parse(argc, argv, argtable);

  TEST_ASSERT_TRUE(nerrors == 0);
  TEST_ASSERT_TRUE(a->count == 1);
  TEST_ASSERT_EQUAL_STRING(a->filename[0], "foo.bar");
  TEST_ASSERT_EQUAL_STRING(a->basename[0], "foo.bar");
  TEST_ASSERT_EQUAL_STRING(a->extension[0], ".bar");

  arg_freetable(argtable, sizeof(argtable) / sizeof(argtable[0]));
}

void test_argrex_basic_001() {
  struct arg_rex* a = arg_rex0("a", NULL, "hello", NULL, 0, "blah blah");
  struct arg_rex* b = arg_rex1(NULL, "beta", "[Ww]orld", NULL, 0, "blah blah");
  struct arg_rex* c = arg_rexn(NULL, NULL, "goodbye", NULL, 1, 5, ARG_REX_ICASE, "blah blah");
  struct arg_rex* d = arg_rex0(NULL, NULL, "any.*", NULL, ARG_REX_ICASE, "blah blah");
  struct arg_end* end = arg_end(20);
  void* argtable[] = {a, b, c, d, end};
  int nerrors;

  char* argv[] = {"program", "--beta", "world", "goodbye", NULL};
  int argc = sizeof(argv) / sizeof(char*) - 1;

  TEST_ASSERT_TRUE(arg_nullcheck(argtable) == 0);

  nerrors = arg_parse(argc, argv, argtable);
  TEST_ASSERT_TRUE(nerrors == 0);

  TEST_ASSERT_TRUE(a->count == 0);
  TEST_ASSERT_TRUE(b->count == 1);
  TEST_ASSERT_EQUAL_STRING(b->sval[0], "world");
  TEST_ASSERT_TRUE(c->count == 1);
  TEST_ASSERT_EQUAL_STRING(c->sval[0], "goodbye");
  TEST_ASSERT_TRUE(d->count == 0);

  arg_freetable(argtable, sizeof(argtable) / sizeof(argtable[0]));
}

void test_argdstr_basic_001() {
  arg_dstr_t ds = arg_dstr_create();

  arg_dstr_set(ds, "hello ", ARG_DSTR_VOLATILE);
  TEST_ASSERT_TRUE(strcmp(arg_dstr_cstr(ds), "hello ") == 0);

  arg_dstr_cat(ds, "world");
  TEST_ASSERT_TRUE(strcmp(arg_dstr_cstr(ds), "hello world") == 0);

  arg_dstr_destroy(ds);
}

int cmd1_proc(int argc, char* argv[], arg_dstr_t res) {
  if (argc == 0) {
    arg_dstr_catf(res, "cmd1 fail");
    return 1;
  }

  arg_dstr_catf(res, "%d %s", argc, argv[0]);
  return 0;
}

void test_argcmd_basic_001() {
  arg_cmd_init();
  TEST_ASSERT_EQUAL_INT(0, arg_cmd_count());

  arg_cmd_register("cmd1", cmd1_proc, "description of cmd1");
  TEST_ASSERT_EQUAL_INT(1, arg_cmd_count());

  char* argv[] = {
      "cmd1",
      "-o",
      "file1",
  };
  int argc = 3;
  TEST_ASSERT_TRUE(strcmp(argv[0], "cmd1") == 0);
  TEST_ASSERT_TRUE(strcmp(argv[1], "-o") == 0);
  TEST_ASSERT_TRUE(strcmp(argv[2], "file1") == 0);

  arg_dstr_t res = arg_dstr_create();
  int err = arg_cmd_dispatch("cmd1", argc, argv, res);
  TEST_ASSERT_EQUAL_INT(0, err);
  TEST_ASSERT_TRUE(strcmp(arg_dstr_cstr(res), "3 cmd1") == 0);

  arg_dstr_reset(res);
  err = arg_cmd_dispatch("cmd1", 0, NULL, res);
  TEST_ASSERT_EQUAL_INT(1, err);
  TEST_ASSERT_TRUE(strcmp(arg_dstr_cstr(res), "cmd1 fail") == 0);

  arg_cmd_uninit();
}

int main(void) {
  UNITY_BEGIN();

  RUN_TEST(test_arglit_basic_001);
  RUN_TEST(test_argstr_basic_001);
  RUN_TEST(test_argint_basic_001);
  RUN_TEST(test_argdate_basic_001);
  RUN_TEST(test_argfile_basic_001);
  RUN_TEST(test_argrex_basic_001);
  RUN_TEST(test_argdstr_basic_001);
  RUN_TEST(test_argcmd_basic_001);

  return UNITY_END();
}
