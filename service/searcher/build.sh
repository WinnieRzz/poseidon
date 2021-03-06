#!/bin/bash
if [ ! -f build.sh ]; then
    echo 'build.sh must be run within its container folder' 1>&2
    exit 1
fi

ROOT_DIR=`pwd`
APP="searcher"
VER="0.1"

mkdir -p bin logs

go build -o bin/$APP

mkdir searcher
cp -r bin/ searcher/
cp -r conf/ searcher/
cp serverctl searcher/
cp -r logs searcher/

tar -zcvf $ROOT_DIR/../../dist/$APP-$VER.tar.gz searcher/

rm -rf ./searcher
