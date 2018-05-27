cc_library(
    name = "gflags_nothreads",
    srcs = [
        'src/gflags.cc',
        'src/gflags_reporting.cc',
        'src/gflags_completions.cc',
    ],
    warning = 'No',
    incs = ['include'],
    defs = ['GFLAGS_IS_A_DLL=0', 'NO_THREADS', 'NDEBUG'],
    optimize = '-O3',
)

cc_library(
    name = "gflags",
    srcs = [
        'src/gflags.cc',
        'src/gflags_reporting.cc',
        'src/gflags_completions.cc',
    ],
    warning = 'No',
    incs = ['include'],
    defs = ['GFLAGS_IS_A_DLL=0', 'NDEBUG'],
    deps = ['#pthread'],
    optimize = '-O3',
)
