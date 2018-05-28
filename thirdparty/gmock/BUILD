cc_library(
    name = "gmock",
    srcs = [
        'src/gmock-all.cc',
    ],
    warning = 'No',
    incs = ['.', 'include'],
    defs = [
        'GTEST_HAS_PTHREAD=1'
    ],
    deps = ['#pthread', '//thirdparty/gtest:gtest'],
    optimize = '-O2',
)

cc_library(
    name = "gmock_main",
    srcs = [
        'src/gmock_main.cc',
    ],
    warning = 'No',
    incs = ['.', 'include'],
    defs = [
        'GTEST_HAS_PTHREAD=1'
    ],
    deps = ['#pthread', ':gmock'],
    optimize = '-O2',
)


