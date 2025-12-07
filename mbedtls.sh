#!/usr/bin/env bash
set -euo pipefail

THE_FOLDER='mbedtls'
COMMON_FLAGS=(
    '-DENABLE_TESTING=OFF'
    '-DCMAKE_POSITION_INDEPENDENT_CODE=ON'
)

./lib.sh "../$THE_FOLDER" -DUSE_SHARED_MBEDTLS_LIBRARY=ON "${COMMON_FLAGS[@]}"
./lib.sh "../$THE_FOLDER" --release "${COMMON_FLAGS[@]}"
# we dont build for emscripten
./lib.sh "../$THE_FOLDER" --release --android "${COMMON_FLAGS[@]}"
./lib.sh "../$THE_FOLDER" --release --android arm "${COMMON_FLAGS[@]}"