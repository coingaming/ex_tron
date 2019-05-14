#! /usr/bin/env bash

# adpted from
# https://github.com/cjab/weddell/blob/master/bin/update-proto
# and https://github.com/tony612/google-protos/blob/master/generate_google_protos.sh

set -e

if [ "$MIX_HOME" = "" ] ; then
  export MIX_HOME=$HOME/.mix
fi

PLUGIN_PATH=$MIX_HOME/escripts/protoc-gen-elixir

if [ ! -f $PLUGIN_PATH ] ; then
  mix escript.install hex protobuf
fi

DIR="$( cd "$( dirname "$0" )/.." && pwd )"
OUT=$DIR/lib/tron/proto
GOOGLEAPIS_PATH=$DIR/protos_build/googleapis

cd $DIR

# if [ ! -d "$GOOGLEAPIS_PATH" ]; then
#   git clone https://github.com/googleapis/googleapis.git $GOOGLEAPIS_PATH
# fi
# cd $GOOGLEAPIS_PATH && git pull && cd $DIR

mkdir -p $OUT
rm -rf ./lib/tron/proto/*

rm -rf protos_build &&
cp -a protos protos_build
find ./protos_build -type f -print0 | xargs -0 sed -i '' -E 's/^(package\ )(protocol)/\1tron/g'

protoc -I $GOOGLEAPIS_PATH \
  --plugin=./protoc-gen-elixir=$PLUGIN_PATH \
  --elixir_out=plugins=grpc:$OUT \
  $GOOGLEAPIS_PATH/google/api/annotations.proto

find ./protos_build/tron-protocol -name '*.proto' -print0 | xargs -0 protoc -I ./protos_build/tron-protocol -I $GOOGLEAPIS_PATH --elixir_out=plugins=grpc:./lib/tron/proto

find ./lib/tron/proto -type f -print0 | xargs -0 sed -i '' -E 's/(name: ")tron\./\1protocol\./g'