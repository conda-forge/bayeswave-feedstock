#!/bin/bash

set -ex

cd ${SRC_DIR}/BayesWaveUtils

sed -i.orig "s|version=.*|version='${PKG_VERSION}',|g" ./setup.py

# install
${PYTHON} -m pip install . -vv

rm -rfv ${PREFIX}/bin/__pycache__
