#!/bin/bash

set -ex

mkdir -p build
pushd build

# configure
cmake \
  ${CMAKE_ARGS} \
  ${SRC_DIR}

# build
cmake --build . --parallel ${CPU_COUNT} --verbose

# test
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ]]; then
  ctest --verbose --parallel ${CPU_COUNT}
fi

# install
cmake --build . --parallel ${CPU_COUNT} --verbose --target install
