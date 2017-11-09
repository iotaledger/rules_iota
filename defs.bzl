load("//internal:repositories.bzl", "iota_cpp_repositories")
load("//internal:boost.bzl", "boost_deps")

def iota_deps():
  iota_cpp_repositories()
  boost_deps()
