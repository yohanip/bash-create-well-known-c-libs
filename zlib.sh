#!/usr/bin/env bash
set -euo pipefail

THE_FOLDER='zlib'
COMMON_FLAGS=(
    '-DZLIB_BUILD_TESTING=OFF'
    # most platform already have libz?
    '-DZLIB_INSTALL=OFF'
)

./lib.sh "../$THE_FOLDER" -DBUILD_SHARED_LIBS=ON "${COMMON_FLAGS[@]}" -DZLIB_BUILD_STATIC=OFF
./lib.sh "../$THE_FOLDER" --release "${COMMON_FLAGS[@]}" -DZLIB_BUILD_SHARED=OFF
./lib.sh "../$THE_FOLDER" --release --ems "${COMMON_FLAGS[@]}" -DZLIB_BUILD_SHARED=OFF
./lib.sh "../$THE_FOLDER" --release --android "${COMMON_FLAGS[@]}" -DZLIB_BUILD_SHARED=OFF
./lib.sh "../$THE_FOLDER" --release --android arm "${COMMON_FLAGS[@]}" -DZLIB_BUILD_SHARED=OFF