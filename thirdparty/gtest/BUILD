cc_library(
    name = "gtest",
    srcs = [
        'src/gtest-all.cc',
    ],
    warning = 'No',
    incs = ['.', 'include'],
    defs = [
        'GTEST_HAS_PTHREAD=1'
    ],
    deps = ['#pthread'],
    optimize = '-O2',
)

cc_library(
    name = "gtest_main",
    srcs = [
        'src/gtest_main.cc',
    ],
    warning = 'No',
    incs = ['.', 'include'],
    defs = [
        'GTEST_HAS_PTHREAD=1'
    ],
    deps = ['#pthread', ':gtest'],
    optimize = '-O2',
)


