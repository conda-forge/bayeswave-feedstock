#!/bin/bash

mkdir -p build
pushd build

# configure
cmake ${CMAKE_ARGS} ${SRC_DIR} \
  -DCMAKE_INSTALL_PREFIX=${PREFIX} \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_LIBDIR="lib"

# build
cmake --build . -- -j ${CPU_COUNT}

# test
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ]]; then
ctest -VV
fi

# install
cmake --build . --target install
