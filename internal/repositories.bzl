load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_gflags():
    native.git_repository(
        name = "com_github_gflags_gflags",
        commit = "e292e0452fcfd5a8ae055b59052fc041cbab4abf",
        remote = "https://github.com/gflags/gflags.git",
    )

def load_glog():
    native.git_repository(
        name = "com_github_google_glog",
        commit = "2f493d292c92abf16ebd46cfd0cc0bf8eef5724d",
        remote = "https://github.com/google/glog.git",
    )

def load_gtest():
    http_archive(
        name = "com_google_googletest",
        url =
            "https://github.com/google/googletest/archive/587ceaeaee6c2ccb5e565858d7fe12aaf69795e6.tar.gz",
        strip_prefix = "googletest-587ceaeaee6c2ccb5e565858d7fe12aaf69795e6",
        sha256 =
            "c9bc49be74e3551826b8b2554342ef388c67b831c635520cf67c200ed565ce1e",
        build_file = "@rules_iota//:build/BUILD.googletest",
    )

def load_rxcpp():
    http_archive(
        name = "rxcpp",
        url =
            "https://github.com/Reactive-Extensions/RxCpp/archive/v4.1.0.tar.gz",
        sha256 =
            "d3bb49c7ac6b5c43235df710510fce87d827bb88a1b78242017f190d2acbbdea",
        strip_prefix = "RxCpp-4.1.0",
        build_file = "@rules_iota//:build/BUILD.rxcpp",
    )

def load_libsodium():
    http_archive(
        name = "libsodium",
        url = "https://github.com/jedisct1/libsodium/archive/1.0.16.tar.gz",
        strip_prefix = "libsodium-1.0.16",
        sha256 =
            "0c14604bbeab2e82a803215d65c3b6e74bb28291aaee6236d65c699ccfe1a98c",
        build_file = "@rules_iota//:build/BUILD.libsodium",
    )

def load_libzmq():
    http_archive(
        name = "libzmq",
        url = "https://github.com/zeromq/libzmq/archive/v4.2.5.tar.gz",
        strip_prefix = "libzmq-4.2.5",
        sha256 =
            "f33807105ce47f684c26751ce4e27a708a83ce120cbabbc614c8df21252b238c",
        build_file = "@rules_iota//:build/BUILD.libzmq",
    )

def load_cppzmq():
    http_archive(
        name = "cppzmq",
        url =
            "https://github.com/zeromq/cppzmq/archive/97d2cb249851447856a850216d5f8fb68264511a.zip",
        strip_prefix = "cppzmq-97d2cb249851447856a850216d5f8fb68264511a",
        sha256 =
            "8ad004a648172479ff31126045c1034f90b4b5ca8c6349c7b6903504f37384cf",
        build_file = "@rules_iota//:build/BUILD.cppzmq",
    )

def load_fmtlib():
    http_archive(
        name = "fmtlib",
        url = "https://github.com/fmtlib/fmt/archive/5.0.0.tar.gz",
        strip_prefix = "fmt-5.0.0",
        sha256 =
            "fc33d64d5aa2739ad2ca1b128628a7fc1b7dca1ad077314f09affc57d59cf88a",
        build_file = "@rules_iota//:build/BUILD.fmt",
    )

def load_unity():
    http_archive(
        name = "unity",
        url = "https://github.com/ThrowTheSwitch/Unity/archive/v2.4.3.tar.gz",
        strip_prefix = "Unity-2.4.3",
        sha256 =
            "a8c5e384f511a03c603bbecc9edc24d2cb4a916998d51a29cf2e3a2896920d03",
        build_file = "@rules_iota//:build/BUILD.unity",
    )

def load_yaml():
    http_archive(
        name = "yaml",
        url = "https://github.com/yaml/libyaml/archive/0.1.7.tar.gz",
        strip_prefix = "libyaml-0.1.7",
        sha256 =
            "e1884d0fa1eec8cf869ac6bebbf25391e81956aa2970267f974a9fa5e0b968e2",
        build_file = "@rules_iota//:build/BUILD.yaml",
    )

def load_rb_tree():
    http_archive(
        name = "rb_tree",
        url =
            "http://web.mit.edu/~emin/www.old/source_code/red_black_tree/rb_tree.tar.gz",
        sha256 =
            "899a13a40c2d1c64a4690f0f316e9832c5db0df4971d51e35a66084295f7d0fc",
        build_file = "@rules_iota//:build/BUILD.rb_tree",
    )

def load_civetweb():
    http_archive(
        name = "civetweb",
        strip_prefix = "civetweb-1.9.1",
        sha256 =
            "880d741724fd8de0ebc77bc5d98fa673ba44423dc4918361c3cd5cf80955e36d",
        urls = [
            "https://github.com/civetweb/civetweb/archive/v1.9.1.tar.gz",
        ],
        build_file = "@rules_iota//:build/BUILD.civetweb",
    )

def load_com_google_protobuf():
    http_archive(
        name = "com_google_protobuf",
        sha256 =
            "826425182ee43990731217b917c5c3ea7190cfda141af4869e6d4ad9085a740f",
        strip_prefix = "protobuf-3.5.1",
        urls = [
            "https://github.com/google/protobuf/archive/v3.5.1.tar.gz",
        ],
    )

def load_prometheus_cpp():
    http_archive(
        name = "prometheus_cpp",
        url =
            "https://github.com/jupp0r/prometheus-cpp/archive/6f7d712eba93f807cca58d144f525ac53147a234.zip",
        strip_prefix = "prometheus-cpp-6f7d712eba93f807cca58d144f525ac53147a234",
        sha256 =
            "42f4854c83aad5d6688f130375d55bb14e000062c541050c58ba533d5aedb8ee",
    )

def load_yaml_cpp():
    http_archive(
        name = "yaml_cpp",
        url =
            "https://github.com/jbeder/yaml-cpp/archive/4fb1c4b92bf8d94b32ebccdd890407d45b3bc794.zip",
        strip_prefix = "yaml-cpp-4fb1c4b92bf8d94b32ebccdd890407d45b3bc794",
        sha256 =
            "e434837d4eb49832fa982c111c7da4e3c9c2b8d5627736f295dd129199559f42",
        build_file = "@rules_iota//:build/BUILD.yaml_cpp",
    )

def load_keccak():
    http_archive(
        name = "keccak",
        url =
            "https://github.com/XKCP/XKCP/archive/c737139c81fd191699886a9a74d3220f6e300b29.zip",
        strip_prefix =
            "XKCP-c737139c81fd191699886a9a74d3220f6e300b29",
        build_file = "@rules_iota//:build/BUILD.keccak",
        sha256 =
            "c6afd429cb48f41fe2385fb0f796d212489ff73b14a580f2a822e307d99248b2",
    )

def load_libcuckoo():
    http_archive(
        name = "libcuckoo",
        url =
            "https://github.com/efficient/libcuckoo/archive/6591795a944fa8c7268848d181ba2852f4a7897f.zip",
        strip_prefix = "libcuckoo-6591795a944fa8c7268848d181ba2852f4a7897f",
        build_file = "@rules_iota//:build/BUILD.libcuckoo",
        sha256 =
            "c31f300fe33a5668528027174150715b238c96f9e9a77cd1d933d7ba43480452",
    )

def load_cjson():
    http_archive(
        name = "cJSON",
        url = "https://github.com/DaveGamble/cJSON/archive/v1.7.7.tar.gz",
        strip_prefix = "cJSON-1.7.7",
        sha256 =
            "6eb9d852a97ffbe149e747f54d63e39a674fa248bb24902a14c079803067949a",
        build_file = "@rules_iota//:build/BUILD.cJSON",
    )

def load_optional_lite():
    http_archive(
        name = "optional_lite",
        build_file = "@rules_iota//:build/BUILD.optional_lite",
        sha256 =
            "4627df0f5c8631b1f1e09a520a023d1b690f44b0c8addc31a09f38bc62b12c1f",
        url =
            "https://github.com/martinmoene/optional-lite/archive/807da49219e55210614402e4937f364f486b897d.zip",
        strip_prefix =
            "optional-lite-807da49219e55210614402e4937f364f486b897d",
    )

def load_nlohmann():
    http_archive(
        name = "nlohmann",
        build_file = "@rules_iota//:build/BUILD.nlohmann_json",
        sha256 =
            "a422ae5511024efd36111716bb5a9dae21813caaaec365990747dbf76d77960a",
        url =
            "https://github.com/th0br0/json/archive/0ae87e9993dc802b17ad7850a727b86bb9b98287.zip",
        strip_prefix =
            "json-0ae87e9993dc802b17ad7850a727b86bb9b98287",
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
        sha256 = "8dba212aeb7c25352a74d70141f20ba421bf20af8b2fb661f2b0dce473aba487",
        strip_prefix = "sqlite-amalgamation-3250200",
        url = "https://www.sqlite.org/2018/sqlite-amalgamation-3250200.zip",
    )

def load_logger():
    http_archive(
        name = "com_github_embear_logger",
        url = "https://github.com/embear/logger/archive/v4.0.x.zip",
        strip_prefix = "logger-4.0.x",
        sha256 =
            "f82b485ef0e3d42de22b49f483c93c4c721d80a9ee8b6bd80c1c0ceb3bfc64a0",
        build_file = "@rules_iota//:build/BUILD.logger",
    )

def load_uthash():
    http_archive(
        name = "com_github_uthash",
        url = "https://github.com/troydhanson/uthash/archive/91fcf37aea9f79535d281ae366996c9f409a1701.zip",
        strip_prefix = "uthash-91fcf37aea9f79535d281ae366996c9f409a1701",
        sha256 =
            "24f9a80d7e016ad7eb06116c96fe285d47de365232c3d08fcb7ddcbebc3df3a5",
        build_file = "@rules_iota//:build/BUILD.uthash",
    )

def load_http_parser():
    http_archive(
        name = "http_parser",
        url = "https://github.com/nodejs/http-parser/archive/v2.8.1.zip",
        sha256 = "8d734182456143fc94ab95dcea01b84c13d83b2c9345930445da7eb83ebe4090",
        strip_prefix = "http-parser-2.8.1",
        build_file = "@rules_iota//:build/BUILD.http_parser",
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
