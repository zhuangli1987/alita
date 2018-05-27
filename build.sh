set -e

function setup() {
    base_dir=$(cd "$(dirname "$0")";pwd)
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

function prepare() {
    rm -fr $base_dir/include
    rm -fr $base_dir/bin
    mkdir $base_dir/include
    mkdir $base_dir/bin
    build_protobuf
    build_thrift
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
