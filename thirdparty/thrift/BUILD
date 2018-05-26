################################################################################
# Thrift Runtime Library
################################################################################

def_list = ['HAVE_CONFIG_H', '__STDC_FORMAT_MACROS', '__STDC_LIMIT_MACROS']

cc_library(
    name = "thrift",
    srcs = [
        'lib/src/thrift/TApplicationException.cpp',
        'lib/src/thrift/TOutput.cpp',
        'lib/src/thrift/async/TAsyncChannel.cpp',
        'lib/src/thrift/async/TConcurrentClientSyncInfo.cpp',
        'lib/src/thrift/concurrency/ThreadManager.cpp',
        'lib/src/thrift/concurrency/TimerManager.cpp',
        'lib/src/thrift/concurrency/Util.cpp',
        'lib/src/thrift/processor/PeekProcessor.cpp',
        'lib/src/thrift/protocol/TBase64Utils.cpp',
        'lib/src/thrift/protocol/TDebugProtocol.cpp',
        'lib/src/thrift/protocol/TJSONProtocol.cpp',
        'lib/src/thrift/protocol/TMultiplexedProtocol.cpp',
        'lib/src/thrift/protocol/TProtocol.cpp',
        'lib/src/thrift/transport/TTransportException.cpp',
        'lib/src/thrift/transport/TFDTransport.cpp',
        'lib/src/thrift/transport/TSimpleFileTransport.cpp',
        'lib/src/thrift/transport/THttpTransport.cpp',
        'lib/src/thrift/transport/THttpClient.cpp',
        'lib/src/thrift/transport/THttpServer.cpp',
        'lib/src/thrift/transport/TSocket.cpp',
        'lib/src/thrift/transport/TSocketPool.cpp',
        'lib/src/thrift/transport/TServerSocket.cpp',
        'lib/src/thrift/transport/TTransportUtils.cpp',
        'lib/src/thrift/transport/TBufferTransports.cpp',
        'lib/src/thrift/transport/TPipe.cpp',
        'lib/src/thrift/transport/TPipeServer.cpp',
        'lib/src/thrift/transport/TFileTransport.cpp',
        'lib/src/thrift/server/TConnectedClient.cpp',
        'lib/src/thrift/server/TServerFramework.cpp',
        'lib/src/thrift/server/TSimpleServer.cpp',
        'lib/src/thrift/server/TThreadPoolServer.cpp',
        'lib/src/thrift/server/TThreadedServer.cpp',
        'lib/src/thrift/server/TServer.cpp',
        'lib/src/thrift/VirtualProfiling.cpp',
        'lib/src/thrift/transport/TSSLSocket.cpp',
        'lib/src/thrift/transport/TSSLServerSocket.cpp',
        'lib/src/thrift/concurrency/PosixThreadFactory.cpp',
        'lib/src/thrift/concurrency/Mutex.cpp',
        'lib/src/thrift/concurrency/Monitor.cpp',
    ],
    warning = 'No',
    incs = ['lib/src'],
    defs = def_list,
    deps = ['#ssl', '#crypto', '#pthread']
)

cc_library(
    name = "thriftnb",
    srcs = [
        'lib/src/thrift/server/TNonblockingServer.cpp',
        'lib/src/thrift/transport/TNonblockingServerSocket.cpp',
        'lib/src/thrift/transport/TNonblockingSSLServerSocket.cpp',
        'lib/src/thrift/async/TAsyncProtocolProcessor.cpp',
        'lib/src/thrift/async/TEvhttpServer.cpp',
        'lib/src/thrift/async/TEvhttpClientChannel.cpp',
    ],
    warning = 'No',
    incs = ['lib/src'],
    defs = def_list,
    deps = ["#event", ":thrift"]
)

cc_library(
    name = "thriftz",
    srcs = [
        'lib/src/thrift/transport/TZlibTransport.cpp',
        'lib/src/thrift/transport/THeaderTransport.cpp',
        'lib/src/thrift/protocol/THeaderProtocol.cpp',
    ],
    warning = 'No',
    incs = ['lib/src'],
    defs = def_list,
    deps = ["#z", ":thrift"]
)

################################################################################
# Thrift Buffers Compiler
################################################################################

lex_yacc_library(
    name = 'parse',
    srcs = [
        'compiler/src/thrift/thriftl.ll',
        'compiler/src/thrift/thrifty.yy',
    ],
    allow_undefined = True,
    incs = ['compiler/src'],
)

cc_binary(
    name = 'thriftc',
    srcs = [
        'compiler/src/thrift/audit/t_audit.cpp',
        'compiler/src/thrift/generate/t_cpp_generator.cc',
        'compiler/src/thrift/common.cc',
        'compiler/src/thrift/generate/t_generator.cc',
        'compiler/src/thrift/parse/t_typedef.cc',
        'compiler/src/thrift/parse/parse.cc',
        'compiler/src/thrift/main.cc',
    ],
    incs = ['compiler/src'],
    deps = [':parse'],
)
