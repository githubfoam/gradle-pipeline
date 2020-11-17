#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script


echo "=============================platform============================================================="

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

echo "=============================setup============================================================="

LUA_HOME_DIR=$TRAVIS_BUILD_DIR/install/lua

LR_HOME_DIR=$TRAVIS_BUILD_DIR/install/luarocks

mkdir $HOME/.lua

LUAJIT="no"

if [ "$PLATFORM" == "macosx" ]; then
  if [ "$LUA" == "luajit" ]; then
    LUAJIT="yes";
  fi
  if [ "$LUA" == "luajit2.0" ]; then
    LUAJIT="yes";
  fi
  if [ "$LUA" == "luajit2.1" ]; then
    LUAJIT="yes";
  fi;
elif [ "$(expr substr $LUA 1 6)" == "luajit" ]; then
  LUAJIT="yes";
fi

mkdir -p "$LUA_HOME_DIR"

if [ "$LUAJIT" == "yes" ]; then

  if [ "$LUA" == "luajit" ]; then
    curl http://luajit.org/download/$LUAJIT_BASE.tar.gz | tar xz;
  else
    git clone http://luajit.org/git/luajit-2.0.git $LUAJIT_BASE;
  fi

  cd $LUAJIT_BASE

  if [ "$LUA" == "luajit2.1" ]; then
    git checkout v2.1;
  fi

  make && make install PREFIX="$LUA_HOME_DIR"

    if [ "$LUA" == "luajit2.1" ]; then
    ln -s $LUA_HOME_DIR/bin/luajit-2.1.0-alpha $HOME/.lua/luajit
    ln -s $LUA_HOME_DIR/bin/luajit-2.1.0-alpha $HOME/.lua/lua;
  else
    ln -s $LUA_HOME_DIR/bin/luajit $HOME/.lua/luajit
    ln -s $LUA_HOME_DIR/bin/luajit $HOME/.lua/lua;
  fi;

else

  if [ "$LUA" == "lua5.1" ]; then
    curl http://www.lua.org/ftp/lua-5.1.5.tar.gz | tar xz
    cd lua-5.1.5;
  elif [ "$LUA" == "lua5.2" ]; then
    curl http://www.lua.org/ftp/lua-5.2.4.tar.gz | tar xz
    cd lua-5.2.4;
  elif [ "$LUA" == "lua5.3" ]; then
    curl http://www.lua.org/ftp/lua-5.3.1.tar.gz | tar xz
    cd lua-5.3.1;
  fi

    # Build Lua without backwards compatibility for testing
  perl -i -pe 's/-DLUA_COMPAT_(ALL|5_2)//' src/Makefile
  make $PLATFORM
  make INSTALL_TOP="$LUA_HOME_DIR" install;

  ln -s $LUA_HOME_DIR/bin/lua $HOME/.lua/lua
  ln -s $LUA_HOME_DIR/bin/luac $HOME/.lua/luac;

fi
echo "=============================deploy lua app============================================================="
