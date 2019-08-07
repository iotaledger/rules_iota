# Taken from https://github.com/nelhage/rules_boost
# License: Apache 2.0 - https://github.com/nelhage/rules_boost/commit/f27dac072f2c830b08f0aec3aeaef8c313987202

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", 'http_archive')

include_pattern = "boost/%s/"

hdrs_patterns = [
    "boost/%s.h",
    "boost/%s_fwd.h",
    "boost/%s.hpp",
    "boost/%s_fwd.hpp",
    "boost/%s/**/*.hpp",
    "boost/%s/**/*.ipp",
    "boost/%s/**/*.h",
    "libs/%s/src/*.ipp",
]

srcs_patterns = ["libs/%s/src/*.cpp", "libs/%s/src/*.hpp", ]

# Building boost results in many warnings for unused values. Downstream users
# won't be interested, so just disable the warning.
default_copts = ["-Wno-unused-value"]


def srcs_list(library_name):
    return native.glob([p % (library_name, ) for p in srcs_patterns])


def includes_list(library_name):
    return [".", include_pattern % library_name]


def hdr_list(library_name):
    return native.glob([p % (library_name, ) for p in hdrs_patterns])


def boost_library(name,
                  defines=None,
                  includes=None,
                  hdrs=None,
                  srcs=None,
                  deps=None,
                  copts=None,
                  exclude_src=[],
                  linkopts=None,
                  visibility=["//visibility:public"]):
    if defines == None:
        defines = []

    if includes == None:
        includes = []

    if hdrs == None:
        hdrs = []

    if srcs == None:
        srcs = []

    if deps == None:
        deps = []

    if copts == None:
        copts = []

    if linkopts == None:
        linkopts = []

    return native.cc_library(
        name=name,
        visibility=visibility,
        defines=defines,
        includes=includes_list(name) + includes,
        hdrs=hdr_list(name) + hdrs,
        srcs=[s for s in srcs_list(name) if s not in exclude_src] + srcs,
        deps=deps,
        copts=default_copts + copts,
        linkopts=linkopts,
        licenses=["notice"], )


def boost_deps():
    if "net_zlib_zlib" not in native.existing_rules():
        http_archive(
            name="net_zlib_zlib",
            build_file="@rules_iota//build:BUILD.zlib",
            sha256=
            "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1",
            strip_prefix="zlib-1.2.11",
            url="https://zlib.net/zlib-1.2.11.tar.gz", )

    if "org_bzip_bzip2" not in native.existing_rules():
        http_archive(
            name="org_bzip_bzip2",
            build_file="@rules_iota//build:BUILD.bzip2",
            sha256=
            "a2848f34fcd5d6cf47def00461fcb528a0484d8edef8208d6d2e2909dc61d9cd",
            strip_prefix="bzip2-1.0.6",
            url="http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz", )

    if "org_lzma_lzma" not in native.existing_rules():
        http_archive(
            name="org_lzma_lzma",
            build_file="@rules_iota//build:BUILD.lzma",
            sha256=
            "71928b357d0a09a12a4b4c5fafca8c31c19b0e7d3b8ebb19622e96f26dbf28cb",
            strip_prefix="xz-5.2.3",
            urls=[
                "https://phoenixnap.dl.sourceforge.net/project/lzmautils/xz-5.2.3.tar.gz",
                "https://newcontinuum.dl.sourceforge.net/project/lzmautils/xz-5.2.3.tar.gz",
                "http://cfhcable.dl.sourceforge.net/project/lzmautils/xz-5.2.3.tar.gz",
                "https://superb-sea2.dl.sourceforge.net/project/lzmautils/xz-5.2.3.tar.gz",
                "https://cytranet.dl.sourceforge.net/project/lzmautils/xz-5.2.3.tar.gz",
                "https://iweb.dl.sourceforge.net/project/lzmautils/xz-5.2.3.tar.gz",
                "https://gigenet.dl.sourceforge.net/project/lzmautils/xz-5.2.3.tar.gz",
                "https://ayera.dl.sourceforge.net/project/lzmautils/xz-5.2.3.tar.gz",
                "https://astuteinternet.dl.sourceforge.net/project/lzmautils/xz-5.2.3.tar.gz",
                "https://pilotfiber.dl.sourceforge.net/project/lzmautils/xz-5.2.3.tar.gz",
                "https://svwh.dl.sourceforge.net/project/lzmautils/xz-5.2.3.tar.gz",
            ])

    if "boost" not in native.existing_rules():
        http_archive(
            name="boost",
            url=
            "https://dl.bintray.com/boostorg/release/1.66.0/source/boost_1_66_0.tar.gz",
            build_file="@rules_iota//:build/BUILD.boost",
            strip_prefix="boost_1_66_0/",
            sha256=
            "bd0df411efd9a585e5a2212275f8762079fed8842264954675a4fddc46cfcf60", )
