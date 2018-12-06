set -e

function setup() {
    base_dir=$(cd "$(dirname "$0")";pwd)
    sudo apt-get install -y bison flex libevent-dev
}

function build_protobuf() {
    blade build thirdparty/protobuf
    cp blade-bin/thirdparty/protobuf/protoc $base_dir/bin
    cd thirdparty/protobuf/src
    cp --parents google/protobuf/*.h $base_dir/include
    cp --parents google/protobuf/**/*.h $base_dir/include
    cd -
}

function build_thrift() {
    blade build thirdparty/thrift
    cp blade-bin/thirdparty/thrift/thriftc $base_dir/bin/thrift
    cd thirdparty/thrift/lib/src
    cp --parents thrift/*.h $base_dir/include
    cp --parents thrift/**/*.h $base_dir/include
    cp --parents thrift/**/*.tcc $base_dir/include
    cd -
}

function build_gflags() {
    blade build thirdparty/gflags
    cd thirdparty/gflags/include
    cp --parents -r gflags $base_dir/include
    cd -
}

function build_glog() {
    blade build thirdparty/glog
    cd thirdparty/glog/src
    cp --parents -r glog $base_dir/include
    cd -
}

function build_gtest() {
    blade build thirdparty/gtest
    cd thirdparty/gtest/include
    cp --parents -r gtest $base_dir/include
    cd -
}

function build_gmock() {
    blade build thirdparty/gmock
    cd thirdparty/gmock/include
    cp --parents -r gmock $base_dir/include
    cd -
}

function install_blade() {
    cd thirdparty/blade
    bash install
    source ~/.profile
    cd -
}

function prepare() {

    install_blade

    rm -fr $base_dir/include
    rm -fr $base_dir/bin
    mkdir $base_dir/include
    mkdir $base_dir/bin

    build_thrift
    build_protobuf
    build_gflags
    build_glog
    build_gtest
    build_gmock

    echo 'Prepared Succeed!'
}

function main() {
    sudo w
    setup
    if [ ! -f $base_dir'/BLADE_ROOT' ]; then
        echo 'Can not find BLADE_ROOT exit'
        exit -1
    fi
    prepare
}

main
