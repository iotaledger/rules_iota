cc_test(name="nanomsg_test",
        size="small",
        srcs=["nanomsg_test.c"],
        deps=["@nanomsg//:nanomsg"])

cc_test(name="yaml_test",
        size="small",
        srcs=["yaml_test.c"],
        deps=["@yaml//:yaml"])

cc_test(name="gtest_test",
        size="small",
        srcs=["gtest_test.cc"],
        deps=["@gtest//:gtest_main"])

cc_test(name="unity_test",
        size="small",
        srcs=["unity_test.c"],
        deps=["@unity//:unity"])

cc_test(name="prometheus_test",
        size="small",
        srcs=["prometheus_test.cc"],
        deps=["@prometheus_cpp//:prometheus_cpp"])

cc_test(name="cpprestsdk_test",
        size="small",
        srcs=["cpprestsdk_test.cc"],
        deps=["@cpprestsdk//:cpprestsdk"])

cc_test(name="sodium_test",
        srcs=glob(['sodium/*.c', 'sodium/*.h', 'sodium/*.exp']),
        deps=["@libsodium//:sodium"])

cc_test(name="boost_log_test",
        srcs=["boost_log_test.cc"],
        deps=["@boost//:log",])

cc_test(name="yaml_cpp_test",
        size="small",
        srcs=["yaml_cpp_test.cc"],
        data = [":copy_config_test_example_file"],
        deps=["@yaml_cpp//:yaml_cpp"])

genrule(name = 'copy_config_test_example_file',
        local = 1,
        srcs = glob(['config_test_example.yaml']),
        outs = ["config_example.yaml"],
        cmd = "cp $(SRCS) $@",
        output_to_bindir = 1,)
