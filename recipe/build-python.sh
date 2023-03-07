#!/bin/bash

set -ex

cd ${SRC_DIR}/BayesWaveUtils

# install
${PYTHON} -m pip install . -vv
