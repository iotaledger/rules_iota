cc_test(
    name = "yaml_test",
    size = "small",
    srcs = ["yaml_test.c"],
    deps = ["@yaml"],
)

cc_test(
    name = "gtest_test",
    size = "small",
    srcs = ["gtest_test.cc"],
    deps = ["@com_google_googletest//:gtest_main"],
)

cc_test(
    name = "unity_test",
    size = "small",
    srcs = ["unity_test.c"],
    deps = ["@unity"],
)

cc_test(
    name = "prometheus_test",
    size = "small",
    srcs = ["prometheus_test.cc"],
    deps = ["@prometheus_cpp"],
)

cc_test(
    name = "sodium_test",
    srcs = glob([
        "sodium/*.c",
        "sodium/*.h",
        "sodium/*.exp",
    ]),
    deps = ["@libsodium//:sodium"],
)

cc_test(
    name = "boost_log_test",
    srcs = ["boost_log_test.cc"],
    deps = ["@boost//:log"],
)

cc_test(
    name = "yaml_cpp_test",
    size = "small",
    srcs = ["yaml_cpp_test.cc"],
    data = [":copy_config_test_example_file"],
    deps = ["@yaml_cpp"],
)

genrule(
    name = "copy_config_test_example_file",
    srcs = glob(["config_test_example.yaml"]),
    outs = ["config_example.yaml"],
    cmd = "cp $(SRCS) $@",
    local = 1,
    output_to_bindir = 1,
)

cc_test(
    name = "keccak_test",
    srcs = ["keccak_test.c"],
    deps = ["@keccak"],
)

cc_test(
    name = "libcuckoo_test",
    srcs = ["libcuckoo_test.cc"],
    deps = ["@libcuckoo"],
)

cc_test(
    name = "cJSON_test",
    srcs = ["cJSON_test.c"],
    deps = ["@cJSON"],
)

cc_test(
    name = "argon2_and_sodium_test",
    srcs = ["argon2_and_sodium_test.cc"],
    linkopts = ["-lpthread"],
    deps = ["@libsodium//:sodium"],
)

cc_test(
    name = "logger_test",
    srcs = ["logger_test.c"],
    deps = ["@com_github_embear_logger//:logger"],
)

cc_test(
    name = "nlohmann_test",
    srcs = ["nlohmann_test.cc"],
    deps = ["@nlohmann//:json"],
)

cc_test(
    name = "uthash_test",
    srcs = ["uthash_test.c"],
    deps = ["@com_github_uthash//:uthash"],
)

cc_test(
    name = "http_parser_test",
    srcs = ["http_parser_test.c"],
    deps = ["@http_parser"],
)

cc_test(
    name = "concurrencykit_test",
    srcs = ["concurrencykit_test.c"],
    deps = ["@concurrencykit"],
)

cc_test(
    name = "libmicrohttpd_test",
    srcs = ["libmicrohttpd_test.c"],
    deps = ["@libmicrohttpd//:libmicrohttpd.so"],
)
