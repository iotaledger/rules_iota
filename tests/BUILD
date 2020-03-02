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
    srcs = ["yaml_cpp_test.cc"],
    deps = ["@yaml_cpp"],
)

cc_test(
    name = "keccak_test",
    srcs = ["keccak_test.c"],
    deps = [
        "@keccak",
        "@unity",
    ],
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
    deps = ["@libmicrohttpd"],
)

cc_test(
    name = "mbedtls_test",
    srcs = ["mbedtls_test.c"],
    deps = [
        "@mbedtls",
        "@unity",
    ],
)

cc_test(
    name = "xxhash_test",
    srcs = ["xxhash_test.c"],
    deps = [
        "@unity",
        "@xxhash",
    ],
)

cc_test(
    name = "libuv_test",
    srcs = ["libuv_test.c"],
    deps = ["@libuv"],
)

cc_test(
    name = "sqlite3_test",
    srcs = ["sqlite3_test.c"],
    deps = ["@sqlite3"],
)

cc_test(
    name = "cppzmq_test",
    srcs = ["cppzmq_test.cc"],
    deps = ["@cppzmq"],
)

cc_test(
    name = "optional_lite_test",
    srcs = ["optional_lite_test.cc"],
    deps = ["@optional_lite"],
)

cc_test(
    name = "rxcpp_test",
    srcs = ["rxcpp_test.cc"],
    deps = ["@rxcpp"],
)

cc_test(
    name = "boost_beast_test",
    srcs = ["boost_beast_test.cc"],
    deps = ["@boost//:beast"],
)

cc_test(
    name = "mariadb_test",
    srcs = ["mariadb_test.c"],
    deps = ["@mariadb"],
)

cc_test(
    name = "linenoise_test",
    srcs = ["linenoise_test.c"],
    deps = ["@linenoise"],
)

cc_test(
    name = "argtable3_test",
    srcs = ["argtable3_test.c"],
    deps = [
        "@argtable3",
        "@unity",
    ],
)
