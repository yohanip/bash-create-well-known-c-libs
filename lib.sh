#!/usr/bin/env bash
set -euo pipefail

# usage: ./lib.sh <dir_of_cmakelists.txt> [--name:the_name] [-DCMAKE=SOMETHING] [--ems --android [arm x86 x64] --release[:small]]

# Change into the script's directory (where CMakeLists.txt lives)
MY_DIR="$(pwd)"
THE_CMAKE_DIR=""

# --- Parse first command ---
if [[ $# -gt 0 ]]; then
    THE_CMAKE_DIR="$1"
    shift  # remove the command from arguments
else
    echo "No path to CMakeLists.txt provided"
    exit 1
fi

# Default settings
BUILD_TYPE="Debug"
TARGET_OS="linux"
EMSCRIPTEN=0
ANDROID=0
ANDROID_ABI="arm64-v8a"
CMAKE_ARGS=()
CMAKE_CONFIG_COMMAND="cmake"
NAMED_PROJECT=""

# Parse arguments 
for arg in "$@"; do
  case "$arg" in
    -D*)
      CMAKE_ARGS+=("$arg")
      ;;
    --name:*)
      NAMED_PROJECT="${arg#--name:}"
      ;;
    --ems)
      EMSCRIPTEN=1
      TARGET_OS="emscripten"
      CMAKE_CONFIG_COMMAND="emcmake cmake"
      ;;
    --android)
      ANDROID=1
      TARGET_OS="android"
      ;;
    arm)
      ANDROID_ABI="armeabi-v7a"
      ;;
    x86)
      ANDROID_ABI="x86"
      ;;
    x64)
      ANDROID_ABI="x86_64"
      ;;
    --release)
      BUILD_TYPE="Release"
      ;;
    --release:small)
      BUILD_TYPE="MinSizeRel"
      ;;
    *)
      echo "Unknown option: $arg"
      exit 1
      ;;
  esac
done

if [ "$ANDROID" -eq 1 ]; then
    CMAKE_ARGS+=("-DANDROID_PLATFORM=21")
    CMAKE_ARGS+=("-DANDROID_NDK=$ANDROID_NDK")
    CMAKE_ARGS+=("-DANDROID_ABI=$ANDROID_ABI")
    CMAKE_ARGS+=("-DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake")
fi

if [[ "$NAMED_PROJECT" == "" ]]; then
    canon="$(basename "$THE_CMAKE_DIR")"
else
    canon="$NAMED_PROJECT"
fi

if [ "$ANDROID" -eq 1 ]; then
    BUILD_DIR="$MY_DIR/build/$canon/$TARGET_OS/$BUILD_TYPE/$ANDROID_ABI"
    INSTALL_DIR="$MY_DIR/install/$TARGET_OS/$BUILD_TYPE/$ANDROID_ABI"
else    
    BUILD_DIR="$MY_DIR/build/$canon/$TARGET_OS/$BUILD_TYPE"
    INSTALL_DIR="$MY_DIR/install/$TARGET_OS/$BUILD_TYPE"
fi

echo "building     : $canon"
echo "build dir    : $BUILD_DIR"
echo "install dir  : $INSTALL_DIR"
echo "cmake source : $THE_CMAKE_DIR"

# Run CMake
$CMAKE_CONFIG_COMMAND -S "$THE_CMAKE_DIR" -B "$BUILD_DIR" -G Ninja -DCMAKE_BUILD_TYPE="$BUILD_TYPE" "${CMAKE_ARGS[@]}" -DCMAKE_INSTALL_PREFIX="$INSTALL_DIR"
cmake --build "$BUILD_DIR"
cmake --install "$BUILD_DIR"
