#!/usr/bin/env bash
set -euo pipefail

THE_FOLDER='IXWebSocket'
COMMON_FLAGS=(
    '-DUSE_TLS=ON'
    '-DUSE_MBED_TLS=ON'
)

./lib.sh "../$THE_FOLDER" -DBUILD_SHARED_LIBS=ON "${COMMON_FLAGS[@]}" -DCMAKE_PREFIX_PATH=/home/yohanip/Documents/c++/well-known/cmaker/install/linux/Release/lib
./lib.sh "../$THE_FOLDER" --release "${COMMON_FLAGS[@]}" -DCMAKE_PREFIX_PATH=/home/yohanip/Documents/c++/well-known/cmaker/install/linux/Release/lib
./lib.sh "../$THE_FOLDER" --release --android "${COMMON_FLAGS[@]}" -DCMAKE_FIND_ROOT_PATH=/home/yohanip/Documents/c++/well-known/cmaker/install/android/Release/arm64-v8a
./lib.sh "../$THE_FOLDER" --release --android arm "${COMMON_FLAGS[@]}" -DCMAKE_FIND_ROOT_PATH=/home/yohanip/Documents/c++/well-known/cmaker/install/android/Release/armeabi-v7a
