set -e

function setup() {
    base_dir=$(cd "$(dirname "$0")";pwd)
    export PATH=$PATH:$base_dir/include:$base_dir/bin
}

function build_protobuf() {
    blade build thirdparty/protobuf
    cp blade-bin/thirdparty/protobuf/protoc $base_dir/bin
    cd thirdparty/protobuf/src
    cp --parents google/protobuf/*.h $base_dir/include
    cp --parents google/protobuf/**/*.h $base_dir/include
    cd -
}

function prepare() {
    rm -fr $base_dir/include
    rm -fr $base_dir/bin
    mkdir $base_dir/include
    mkdir $base_dir/bin
    build_protobuf
}

function main() {
    sudo w
    setup
    prepare
}

main
