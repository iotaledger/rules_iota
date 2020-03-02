load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository", "new_git_repository")
load("//internal:boost.bzl", "boost_deps")

def load_gflags():
    git_repository(
        name = "com_github_gflags_gflags",
        commit = "e292e0452fcfd5a8ae055b59052fc041cbab4abf",
        remote = "https://github.com/gflags/gflags.git",
    )

def load_glog():
    git_repository(
        name = "com_github_google_glog",
        commit = "2f493d292c92abf16ebd46cfd0cc0bf8eef5724d",
        remote = "https://github.com/google/glog.git",
    )

def load_gtest():
    http_archive(
        name = "com_google_googletest",
        url = "https://github.com/google/googletest/archive/587ceaeaee6c2ccb5e565858d7fe12aaf69795e6.tar.gz",
        strip_prefix = "googletest-587ceaeaee6c2ccb5e565858d7fe12aaf69795e6",
        sha256 = "c9bc49be74e3551826b8b2554342ef388c67b831c635520cf67c200ed565ce1e",
        build_file = "@rules_iota//:build/BUILD.googletest",
    )

def load_rxcpp():
    http_archive(
        name = "rxcpp",
        url = "https://github.com/Reactive-Extensions/RxCpp/archive/v4.1.0.tar.gz",
        sha256 = "d3bb49c7ac6b5c43235df710510fce87d827bb88a1b78242017f190d2acbbdea",
        strip_prefix = "RxCpp-4.1.0",
        build_file = "@rules_iota//:build/BUILD.rxcpp",
    )

def load_libsodium():
    http_archive(
        name = "libsodium",
        url = "https://github.com/jedisct1/libsodium/archive/1.0.16.tar.gz",
        strip_prefix = "libsodium-1.0.16",
        sha256 = "0c14604bbeab2e82a803215d65c3b6e74bb28291aaee6236d65c699ccfe1a98c",
        build_file = "@rules_iota//:build/BUILD.libsodium",
    )

def load_libzmq():
    http_archive(
        name = "libzmq",
        url = "https://github.com/zeromq/libzmq/archive/v4.3.1.tar.gz",
        strip_prefix = "libzmq-4.3.1",
        sha256 = "e1dec061725b55d791e0c6952b8c220846c8cd901c09d1283a6e902898205b9d",
        build_file = "@rules_iota//:build/BUILD.libzmq",
    )

def load_cppzmq():
    http_archive(
        name = "cppzmq",
        url = "https://github.com/zeromq/cppzmq/archive/97d2cb249851447856a850216d5f8fb68264511a.zip",
        strip_prefix = "cppzmq-97d2cb249851447856a850216d5f8fb68264511a",
        sha256 = "8ad004a648172479ff31126045c1034f90b4b5ca8c6349c7b6903504f37384cf",
        build_file = "@rules_iota//:build/BUILD.cppzmq",
    )

def load_fmtlib():
    http_archive(
        name = "fmtlib",
        url = "https://github.com/fmtlib/fmt/archive/5.0.0.tar.gz",
        strip_prefix = "fmt-5.0.0",
        sha256 = "fc33d64d5aa2739ad2ca1b128628a7fc1b7dca1ad077314f09affc57d59cf88a",
        build_file = "@rules_iota//:build/BUILD.fmt",
    )

def load_unity():
    http_archive(
        name = "unity",
        url = "https://github.com/ThrowTheSwitch/Unity/archive/v2.4.3.tar.gz",
        strip_prefix = "Unity-2.4.3",
        sha256 = "a8c5e384f511a03c603bbecc9edc24d2cb4a916998d51a29cf2e3a2896920d03",
        build_file = "@rules_iota//:build/BUILD.unity",
    )

def load_yaml():
    http_archive(
        name = "yaml",
        url = "https://github.com/yaml/libyaml/archive/0.2.2.tar.gz",
        strip_prefix = "libyaml-0.2.2",
        sha256 = "46bca77dc8be954686cff21888d6ce10ca4016b360ae1f56962e6882a17aa1fe",
        build_file = "@rules_iota//:build/BUILD.yaml",
    )

def load_rb_tree():
    http_archive(
        name = "rb_tree",
        url = "http://web.mit.edu/~emin/www.old/source_code/red_black_tree/rb_tree.tar.gz",
        sha256 = "899a13a40c2d1c64a4690f0f316e9832c5db0df4971d51e35a66084295f7d0fc",
        build_file = "@rules_iota//:build/BUILD.rb_tree",
    )

def load_civetweb():
    http_archive(
        name = "civetweb",
        strip_prefix = "civetweb-1.9.1",
        sha256 = "880d741724fd8de0ebc77bc5d98fa673ba44423dc4918361c3cd5cf80955e36d",
        url = "https://github.com/civetweb/civetweb/archive/v1.9.1.tar.gz",
        build_file = "@rules_iota//:build/BUILD.civetweb",
    )

def load_com_google_protobuf():
    http_archive(
        name = "com_google_protobuf",
        sha256 = "826425182ee43990731217b917c5c3ea7190cfda141af4869e6d4ad9085a740f",
        strip_prefix = "protobuf-3.5.1",
        url = "https://github.com/google/protobuf/archive/v3.5.1.tar.gz",
    )

def load_prometheus_cpp():
    http_archive(
        name = "prometheus_cpp",
        url = "https://github.com/jupp0r/prometheus-cpp/archive/6f7d712eba93f807cca58d144f525ac53147a234.zip",
        strip_prefix = "prometheus-cpp-6f7d712eba93f807cca58d144f525ac53147a234",
        sha256 = "42f4854c83aad5d6688f130375d55bb14e000062c541050c58ba533d5aedb8ee",
    )

def load_yaml_cpp():
    http_archive(
        name = "yaml_cpp",
        url = "https://github.com/jbeder/yaml-cpp/archive/4fb1c4b92bf8d94b32ebccdd890407d45b3bc794.zip",
        strip_prefix = "yaml-cpp-4fb1c4b92bf8d94b32ebccdd890407d45b3bc794",
        sha256 = "e434837d4eb49832fa982c111c7da4e3c9c2b8d5627736f295dd129199559f42",
        build_file = "@rules_iota//:build/BUILD.yaml_cpp",
    )

def load_keccak():
    http_archive(
        name = "keccak",
        url = "https://github.com/XKCP/XKCP/archive/a7a105cefc172178c3c9bb7e5f0768e0b226016b.zip",
        strip_prefix = "XKCP-a7a105cefc172178c3c9bb7e5f0768e0b226016b",
        build_file = "@rules_iota//:build/BUILD.keccak",
        sha256 = "1e8130ab11718592b7dacd5294b0cb2409973ae2a962193592c1c1bfb4f3e4b8",
    )

def load_libcuckoo():
    http_archive(
        name = "libcuckoo",
        url = "https://github.com/efficient/libcuckoo/archive/6591795a944fa8c7268848d181ba2852f4a7897f.zip",
        strip_prefix = "libcuckoo-6591795a944fa8c7268848d181ba2852f4a7897f",
        build_file = "@rules_iota//:build/BUILD.libcuckoo",
        sha256 = "c31f300fe33a5668528027174150715b238c96f9e9a77cd1d933d7ba43480452",
    )

def load_cjson():
    http_archive(
        name = "cJSON",
        url = "https://github.com/DaveGamble/cJSON/archive/v1.7.12.tar.gz",
        strip_prefix = "cJSON-1.7.12",
        sha256 = "760687665ab41a5cff9c40b1053c19572bcdaadef1194e5cba1b5e6f824686e7",
        build_file = "@rules_iota//:build/BUILD.cJSON",
    )

def load_optional_lite():
    http_archive(
        name = "optional_lite",
        build_file = "@rules_iota//:build/BUILD.optional_lite",
        sha256 = "4627df0f5c8631b1f1e09a520a023d1b690f44b0c8addc31a09f38bc62b12c1f",
        url = "https://github.com/martinmoene/optional-lite/archive/807da49219e55210614402e4937f364f486b897d.zip",
        strip_prefix = "optional-lite-807da49219e55210614402e4937f364f486b897d",
    )

def load_nlohmann():
    http_archive(
        name = "nlohmann",
        build_file = "@rules_iota//:build/BUILD.nlohmann_json",
        sha256 = "a422ae5511024efd36111716bb5a9dae21813caaaec365990747dbf76d77960a",
        url = "https://github.com/th0br0/json/archive/0ae87e9993dc802b17ad7850a727b86bb9b98287.zip",
        strip_prefix = "json-0ae87e9993dc802b17ad7850a727b86bb9b98287",
    )

def load_argon2():
    http_archive(
        name = "argon2",
        build_file = "@rules_iota//:build/BUILD.argon2",
        sha256 = "eaea0172c1f4ee4550d1b6c9ce01aab8d1ab66b4207776aa67991eb5872fdcd8",
        strip_prefix = "phc-winner-argon2-20171227",
        url = "https://github.com/P-H-C/phc-winner-argon2/archive/20171227.tar.gz",
    )

def load_sqlite3():
    http_archive(
        name = "sqlite3",
        build_file = "@rules_iota//:build/BUILD.sqlite3",
        sha256 = "00fc566f1cece7f4264dc93a7151c64bb794e58c5d20ea65f46b9f7cb36bc34b",
        strip_prefix = "sqlite-amalgamation-3270200",
        url = "https://www.sqlite.org/2019/sqlite-amalgamation-3270200.zip",
    )

def load_logger():
    http_archive(
        name = "com_github_embear_logger",
        url = "https://github.com/embear/logger/archive/v4.0.x.zip",
        strip_prefix = "logger-4.0.x",
        sha256 = "f82b485ef0e3d42de22b49f483c93c4c721d80a9ee8b6bd80c1c0ceb3bfc64a0",
        build_file = "@rules_iota//:build/BUILD.logger",
    )

def load_uthash():
    http_archive(
        name = "com_github_uthash",
        url = "https://github.com/troydhanson/uthash/archive/f19dde22d80a563948a263afe00947e6e42ed8f4.zip",
        strip_prefix = "uthash-f19dde22d80a563948a263afe00947e6e42ed8f4",
        sha256 = "65eed620bfde10a6d5ac88f42c06f5e14f4d98ce3b0e380be8e7a26903c665eb",
        build_file = "@rules_iota//:build/BUILD.uthash",
    )

def load_http_parser():
    http_archive(
        name = "http_parser",
        url = "https://github.com/nodejs/http-parser/archive/v2.9.2.zip",
        sha256 = "be8c89075527aeacecea1c1cbff994cfcfe8c592ecf4517d6e90248c164fcdd6",
        strip_prefix = "http-parser-2.9.2",
        build_file = "@rules_iota//:build/BUILD.http_parser",
    )

def load_concurrencykit():
    http_archive(
        name = "concurrencykit",
        url = "https://github.com/concurrencykit/ck/archive/8698ada9532d880eb1276f3535ef879a23dee8cf.zip",
        sha256 = "220a13bd1ad663139f15c27f1053594be174e2ce49b29e6fbdb9e6975b3a44f1",
        strip_prefix = "ck-8698ada9532d880eb1276f3535ef879a23dee8cf",
        build_file = "@rules_iota//:build/BUILD.concurrencykit",
    )

def load_libmicrohttpd():
    http_archive(
        name = "libmicrohttpd",
        url = "https://ftp.gnu.org/gnu/libmicrohttpd/libmicrohttpd-0.9.65.tar.gz",
        sha256 = "f2467959c5dd5f7fdf8da8d260286e7be914d18c99b898e22a70dafd2237b3c9",
        strip_prefix = "libmicrohttpd-0.9.65",
        build_file = "@rules_iota//:build/BUILD.libmicrohttpd",
    )

def load_mbedtls():
    http_archive(
        name = "mbedtls",
        url = "https://github.com/ARMmbed/mbedtls/archive/mbedtls-2.17.zip",
        sha256 = "59cec8d3e56e8207b101c93095a038aa62126860bf1f1e8acb552a005a2c6eba",
        strip_prefix = "mbedtls-mbedtls-2.17",
        build_file = "@rules_iota//:build/BUILD.mbedtls",
    )

def load_xxhash():
    http_archive(
        name = "xxhash",
        url = "https://github.com/Cyan4973/xxHash/archive/v0.7.0.zip",
        sha256 = "9de5d352ddfcf9b3a6a3fe4d533e870edebb402c01c51286a14c2983b73306e3",
        strip_prefix = "xxHash-0.7.0",
        build_file = "@rules_iota//:build/BUILD.xxhash",
    )

def load_iota_lib_cpp():
    new_git_repository(
        name = "iota_lib_cpp",
        build_file = "@rules_iota//:build/BUILD.iota_lib_cpp",
        commit = "1dfde65ac4ea3b81e4ac3a1cabd2e98dc65211be",
        remote = "https://github.com/thibault-martinez/iota.lib.cpp.git",
    )

def load_libuv():
    http_archive(
        name = "libuv",
        build_file = "@rules_iota//:build/BUILD.libuv",
        sha256 = "44c8fdadf3b3f393006a4ac4ba144020673a3f9cd72bed1fbb2c366ebcf0d199",
        strip_prefix = "libuv-1.30.0",
        url = "https://github.com/libuv/libuv/archive/v1.30.0.tar.gz",
    )

def load_boring_ssl():
    new_git_repository(
        name = "boringssl",
        commit = "1df19da23c005eee572747a5038072bc9404047f",
        remote = "https://boringssl.googlesource.com/boringssl",
        build_file = "@rules_iota//:build/BUILD.boringssl",
    )

def load_mariadb():
    http_archive(
        name = "mariadb",
        build_file = "@rules_iota//:build/BUILD.mariadb",
        sha256 = "7afac2ef28aea7d71c95473c7a3da0f021a5ef2364480cd3e80eab83016341c2",
        strip_prefix = "mariadb-connector-c-3.1.3",
        url = "https://github.com/MariaDB/mariadb-connector-c/archive/v3.1.3.tar.gz",
    )

def load_linenoise():
    http_archive(
        name = "linenoise",
        url = "https://github.com/antirez/linenoise/archive/4a961c0108720741e2683868eb10495f015ee422.tar.gz",
        strip_prefix = "linenoise-4a961c0108720741e2683868eb10495f015ee422",
        sha256 = "b2aa29de7480bf93fdd875a19800d5f087b7436ca77f27d0e2177232941e6938",
        build_file = "@rules_iota//:build/BUILD.linenoise",
    )

def load_argtable3():
    http_archive(
        name = "argtable3",
        url = "https://github.com/argtable/argtable3/releases/download/v3.1.5.1c1bb23/argtable-3.1.5-amalgamation.tar.gz",
        strip_prefix = "argtable-3.1.5-amalgamation",
        sha256 = "336fadb994cd5aae06fd58b05afa8c53cdff6c9ae2fc30b7910863deedd6746c",
        build_file = "@rules_iota//:build/BUILD.argtable3",
    )

def iota_cpp_repositories():
    load_fmtlib()
    load_cppzmq()
    load_libzmq()
    load_libsodium()
    load_rxcpp()
    load_glog()
    load_gtest()
    load_gflags()
    load_unity()
    load_yaml()
    load_rb_tree()
    load_com_google_protobuf()
    load_civetweb()
    load_prometheus_cpp()
    load_yaml_cpp()
    load_keccak()
    load_libcuckoo()
    load_cjson()
    load_optional_lite()
    load_nlohmann()
    load_argon2()
    load_sqlite3()
    load_logger()
    load_uthash()
    load_http_parser()
    load_concurrencykit()
    load_libmicrohttpd()
    load_mbedtls()
    load_xxhash()
    load_iota_lib_cpp()
    load_libuv()
    load_boring_ssl()
    load_mariadb()
    load_linenoise()
    load_argtable3()

def iota_deps():
    iota_cpp_repositories()
    boost_deps()

def iota_common_external():
    load_unity()
    load_keccak()
    load_logger()
    load_uthash()
    load_gtest()

def iota_client_external():
    iota_common_external()
    load_cjson()
    load_http_parser()
    load_mbedtls()
    load_linenoise()
    load_argtable3()
