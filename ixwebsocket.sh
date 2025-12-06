#!/usr/bin/env bash
set -euo pipefail

THE_FOLDER='IXWebSocket'
COMMON_FLAGS=(
    '-DUSE_TLS=ON'
    '-DUSE_MBED_TLS=ON'
)
MBED_TLS_DEFS=(
    '-DMBEDTLS_LIBRARY=mbedtls'
    '-DMBEDX509_LIBRARY=mbedx509'
    '-DMBEDCRYPTO_LIBRARY=mbedcrypto'
    '-DMBEDTLS_VERSION_GREATER_THAN_3=ON'
)

# we are not using tls for debug build
./lib.sh "../$THE_FOLDER" -DBUILD_SHARED_LIBS=ON "${COMMON_FLAGS[@]}" -DCMAKE_BUILD_RPATH=. -DCMAKE_INSTALL_RPATH='$ORIGIN' -DCMAKE_BUILD_RPATH_USE_ORIGIN=TRUE
./lib.sh "../$THE_FOLDER" --release "${COMMON_FLAGS[@]}"
# we dont build for emscripten, will use emscripten websocket library
./lib.sh "../$THE_FOLDER" --release --android "${COMMON_FLAGS[@]}" "${MBED_TLS_DEFS[@]}" -DMBEDTLS_INCLUDE_DIRS=install/android/Release/arm64-v8a/include
./lib.sh "../$THE_FOLDER" --release --android arm "${COMMON_FLAGS[@]}" "${MBED_TLS_DEFS[@]}" -DMBEDTLS_INCLUDE_DIRS=install/android/Release/armeabi-v7a/include
