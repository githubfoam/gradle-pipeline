#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script


echo "=============================deploy lua app============================================================="

export PATH=${PATH}:$HOME/.lua:$HOME/.local/bin:${TRAVIS_BUILD_DIR}/install/luarocks/bin

LUAJIT_BASE="LuaJIT-2.0.4"

if [ -z "${PLATFORM:-}" ]; then
  PLATFORM=$TRAVIS_OS_NAME;
fi

echo $TRAVIS_OS_NAME

if [ "$PLATFORM" == "osx" ]; then
  PLATFORM="macosx";
fi

if [ -z "$PLATFORM" ]; then
  if [ "$(uname)" == "Linux" ]; then
    PLATFORM="linux";
  else
    PLATFORM="macosx";
  fi;
fi


echo "=============================deploy lua app============================================================="
