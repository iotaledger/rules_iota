_CIVETWEB_BUILD_FILE = """
licenses(["notice"])  # MIT license

cc_library(
    name = "civetweb",
    srcs = [
        "src/CivetServer.cpp",
        "src/civetweb.c",
    ],
    hdrs = [
        "include/CivetServer.h",
        "include/civetweb.h",
    ],
    copts = [
        "-DUSE_IPV6",
        "-DNDEBUG",
        "-DNO_CGI",
        "-DNO_CACHING",
        "-DNO_SSL",
        "-DNO_FILES",
    ],
    includes = [
        "include",
    ],
    textual_hdrs = [
        "src/md5.inl",
        "src/handle_form.inl",
    ],
    visibility = ["//visibility:public"],
)
"""

_PROMETHEUS_CLIENT_MODEL_BUILD_FILE = """
licenses(["notice"])  # BSD license

load("@com_google_protobuf//:protobuf.bzl", "cc_proto_library")

cc_proto_library(
    name = "prometheus_client_model",
    srcs = ["metrics.proto"],
    default_runtime = "@com_google_protobuf//:protobuf",
    protoc = "@com_google_protobuf//:protoc",
    visibility = ["//visibility:public"],
)
"""

def load_gflags():
    native.http_archive(
        name="com_github_gflags_gflags",
        url="https://github.com/gflags/gflags/archive/v2.2.1.tar.gz",
        strip_prefix="gflags-2.2.1",
        sha256=
        "ae27cdbcd6a2f935baa78e4f21f675649271634c092b1be01469440495609d0e")


def load_gtest():
    native.new_http_archive(
        name="gtest",
        url="https://github.com/google/googletest/archive/release-1.8.0.tar.gz",
        strip_prefix="googletest-release-1.8.0",
        sha256=
        "58a6f4277ca2bc8565222b3bbd58a177609e9c488e8a72649359ba51450db7d8",
        build_file="@rules_iota//:build/BUILD.gtest")


def load_influxdb_cpp_rest():
    native.new_http_archive(
        name="influxdb_cpp_rest",
        url=
        "https://github.com/d-led/influxdb-cpp-rest/archive/50f597b2fbfa361dede850d4d54288f1c40c6f74.zip",
        strip_prefix=
        "influxdb-cpp-rest-50f597b2fbfa361dede850d4d54288f1c40c6f74",
        sha256=
        "a6f3508d24ead6c92e54f87d117a73ee056e971d08d0ead9a1846c1d3247d250",
        build_file="@rules_iota//:build/BUILD.influxdb-cpp-rest")


def load_glog():
    native.new_http_archive(
        name="glog",
        url="https://github.com/google/glog/archive/v0.3.5.tar.gz",
        sha256=
        "7580e408a2c0b5a89ca214739978ce6ff480b5e7d8d7698a2aa92fadc484d1e0",
        strip_prefix="glog-0.3.5",
        build_file="@rules_iota//:build/BUILD.glog", )


def load_rxcpp():
    native.new_http_archive(
        name="rxcpp",
        url=
        "https://github.com/Reactive-Extensions/RxCpp/archive/v4.0.0.tar.gz",
        sha256=
        "50e7395ab1bc2a0000df126c6920a36dd3c4ee04a71496b2f4c10adf50d65178",
        strip_prefix="RxCpp-4.0.0",
        build_file="@rules_iota//:build/BUILD.rxcpp", )


def load_libsodium():
    native.new_http_archive(
        name="libsodium",
        url="https://github.com/jedisct1/libsodium/archive/1.0.15.tar.gz",
        strip_prefix="libsodium-1.0.15",
        sha256=
        "8889835aee49f3e216bb0f25d1b15aefd0b84da6dcdedbbcff1f77d881083407",
        build_file="@rules_iota//:build/BUILD.libsodium")


def load_libzmq():
    native.new_http_archive(
        name="libzmq",
        url="https://github.com/zeromq/libzmq/archive/v4.2.2.tar.gz",
        strip_prefix="libzmq-4.2.2",
        sha256=
        "ea5eecbb9cc231a750535a7b74f887b18656014cc92601e8ab34734db799b796",
        build_file="@rules_iota//:build/BUILD.libzmq")


def load_cppzmq():
    native.new_http_archive(
        name="cppzmq",
        url="https://github.com/zeromq/cppzmq/archive/v4.2.2.tar.gz",
        strip_prefix="cppzmq-4.2.2",
        sha256=
        "3ef50070ac5877c06c6bb25091028465020e181bbfd08f110294ed6bc419737d",
        build_file="@rules_iota//:build/BUILD.cppzmq")


def load_fmtlib():
    native.new_http_archive(
        name="fmtlib",
        url="https://github.com/fmtlib/fmt/archive/4.0.0.tar.gz",
        strip_prefix="fmt-4.0.0",
        sha256=
        "35300a0d356529447a79ed5ccf419239d8b34f916e5d4625f046fd37afa3650a",
        build_file="@rules_iota//:build/BUILD.fmt")


def load_cpprestsdk():
    native.new_http_archive(
        name="cpprestsdk",
        url="https://github.com/Microsoft/cpprestsdk/archive/v2.10.0.tar.gz",
        strip_prefix="cpprestsdk-2.10.0",
        sha256=
        "de333da67f1cb3d1b30be118860531092467f18d24ca6b4d36f6623fecab0de0",
        build_file="@rules_iota//:build/BUILD.cpprestsdk")


def load_nanomsg():
    native.new_http_archive(
        name="nanomsg",
        url="https://github.com/nanomsg/nanomsg/archive/1.1.2.tar.gz",
        strip_prefix="nanomsg-1.1.2",
        sha256=
        "3c52165a735c2fb597d2306593ae4b17900688b90113d4115ad8480288f28ccb",
        build_file="@rules_iota//:build/BUILD.nanomsg")


def load_unity():
    native.new_http_archive(
        name="unity",
        url="https://github.com/ThrowTheSwitch/Unity/archive/v2.4.2.tar.gz",
        strip_prefix="Unity-2.4.2",
        sha256=
        "633bda7e0bd298aac404e50f6189a29213f3edf61657dda125409ad35290a603",
        build_file="@rules_iota//:build/BUILD.unity")

def load_yaml():
    native.new_http_archive(
        name="yaml",
        url="https://github.com/yaml/libyaml/archive/0.1.7.tar.gz",
        strip_prefix="libyaml-0.1.7",
        sha256=
        "e1884d0fa1eec8cf869ac6bebbf25391e81956aa2970267f974a9fa5e0b968e2",
        build_file="@rules_iota//:build/BUILD.yaml")

def load_rb_tree():
    native.new_http_archive(
        name="rb_tree",
        url="http://web.mit.edu/~emin/www.old/source_code/red_black_tree/rb_tree.tar.gz",
        sha256=
        "899a13a40c2d1c64a4690f0f316e9832c5db0df4971d51e35a66084295f7d0fc",
        build_file="@rules_iota//:build/BUILD.rb_tree")

def load_civetweb():
    native.new_http_archive(
        name = "civetweb",
        strip_prefix = "civetweb-1.9.1",
        sha256 = "880d741724fd8de0ebc77bc5d98fa673ba44423dc4918361c3cd5cf80955e36d",
        urls = [
           "https://github.com/civetweb/civetweb/archive/v1.9.1.tar.gz",
       ],
       build_file_content = _CIVETWEB_BUILD_FILE,
    )

def load_prometheus_client_model():
    native.new_git_repository(
        name = "prometheus_client_model",
        remote = "https://github.com/prometheus/client_model.git",
        commit = "99fa1f4be8e564e8a6b613da7fa6f46c9edafc6c",
        build_file_content = _PROMETHEUS_CLIENT_MODEL_BUILD_FILE,
    )

def load_com_google_protobuf():
    native.http_archive(
        name = "com_google_protobuf",
        sha256 = "8e0236242106e680b4f9f576cc44b8cd711e948b20a9fc07769b0a20ceab9cc4",
        strip_prefix = "protobuf-3.4.1",
        urls = [
            "https://github.com/google/protobuf/archive/v3.4.1.tar.gz",
        ],
    )

def load_prometheus_cpp():
    native.http_archive(
        name="prometheus_cpp",
        url="https://github.com/th0br0/prometheus-cpp/archive/11057d8cc5618ee7f1e77051dcd67d7d8255c13a.zip",
        strip_prefix=
        "prometheus-cpp-11057d8cc5618ee7f1e77051dcd67d7d8255c13a",
        sha256=
        "63d8be02166ed2ca520750e414146bf3727872a63194ddbe803585b456b618e4")


def iota_cpp_repositories():
    load_cpprestsdk()
    load_fmtlib()
    load_cppzmq()
    load_libzmq()
    load_libsodium()
    load_rxcpp()
    load_glog()
    load_gtest()
    load_gflags()
    load_influxdb_cpp_rest()
    load_nanomsg()
    load_unity()
    load_yaml()
    load_rb_tree()
    load_com_google_protobuf()
    load_prometheus_client_model()
    load_civetweb()
    load_prometheus_cpp()
