#!/usr/bin/env bash
set -euo pipefail

hmmm not working yet

THE_FOLDER='daScript'
COMMON_FLAGS=(
    '-DDAS_FLEX_BISON_DISABLED=ON'
    '-DDAS_GLFW_DISABLED=ON'
    '-DDAS_STDDLG_DISABLED=ON'
    '-DDAS_STBIMAGE_DISABLED=ON'
    '-DDAS_STBTRUETYPE_DISABLED=ON'
    '-DDAS_AOT_EXAMPLES_DISABLED=ON'
    '-DDAS_PROFILE_DISABLED=ON'
    '-DDAS_TUTORIAL_DISABLED=ON'
    '-DDAS_TESTS_DISABLED=ON'
)

DIR_FLAGS_LINUX_DEBUG=(
    '-DDAS_INSTALL_BINDIR=dascript/tmp/linux/Debug/bin'
    '-DDAS_INSTALL_LIBDIR=dascript/tmp/linux/Debug/lib'
    '-DDAS_INSTALL_DOCDIR=dascript/tmp/linux/Debug/lib'
    '-DDAS_INSTALL_DASLIBDIR=dascript/tmp/linux/Debug/daslib'
    '-DDAS_INSTALL_EXAMPLESDIR=dascript/tmp/linux/Debug/examples'
    '-DDAS_INSTALL_MODULESDIR=dascript/tmp/linux/Debug/modules'
)
DIR_FLAGS_LINUX_RELEASE=(
    '-DDAS_INSTALL_BINDIR=dascript/tmp/linux/Release/bin'
    '-DDAS_INSTALL_LIBDIR=dascript/tmp/linux/Release/lib'
    '-DDAS_INSTALL_DOCDIR=dascript/tmp/linux/Release/lib'
    '-DDAS_INSTALL_DASLIBDIR=dascript/tmp/linux/Release/daslib'
    '-DDAS_INSTALL_EXAMPLESDIR=dascript/tmp/linux/Release/examples'
    '-DDAS_INSTALL_MODULESDIR=dascript/tmp/linux/Release/modules'
)
DIR_FLAGS_EMSCRIPTEN=(
    '-DDAS_INSTALL_BINDIR=dascript/tmp/emscripten/Release/bin'
    '-DDAS_INSTALL_LIBDIR=dascript/tmp/emscripten/Release/lib'
    '-DDAS_INSTALL_DOCDIR=dascript/tmp/emscripten/Release/lib'
    '-DDAS_INSTALL_DASLIBDIR=dascript/tmp/emscripten/Release/daslib'
    '-DDAS_INSTALL_EXAMPLESDIR=dascript/tmp/emscripten/Release/examples'
    '-DDAS_INSTALL_MODULESDIR=dascript/tmp/emscripten/Release/modules'
)
DIR_FLAGS_ANDROID_V8=(
    '-DDAS_INSTALL_BINDIR=dascript/tmp/android/Release/v8/bin'
    '-DDAS_INSTALL_LIBDIR=dascript/tmp/android/Release/v8/lib'
    '-DDAS_INSTALL_DOCDIR=dascript/tmp/android/Release/v8/lib'
    '-DDAS_INSTALL_DASLIBDIR=dascript/tmp/android/Release/v8/daslib'
    '-DDAS_INSTALL_EXAMPLESDIR=dascript/tmp/android/Release/v8/examples'
    '-DDAS_INSTALL_MODULESDIR=dascript/tmp/android/Release/v8/modules'
)
DIR_FLAGS_ANDROID_V7=(
    '-DDAS_INSTALL_BINDIR=dascript/tmp/android/Release/v7/bin'
    '-DDAS_INSTALL_LIBDIR=dascript/tmp/android/Release/v7/lib'
    '-DDAS_INSTALL_DOCDIR=dascript/tmp/android/Release/v7/lib'
    '-DDAS_INSTALL_DASLIBDIR=dascript/tmp/android/Release/v7/daslib'
    '-DDAS_INSTALL_EXAMPLESDIR=dascript/tmp/android/Release/v7/examples'
    '-DDAS_INSTALL_MODULESDIR=dascript/tmp/android/Release/v7/modules'
)

./lib.sh "../$THE_FOLDER" -DDAS_ENABLE_DLL=ON "${COMMON_FLAGS[@]}" -DDAS_TOOLS_DISABLED=ON "${DIR_FLAGS_LINUX_DEBUG[@]}"
./lib.sh "../$THE_FOLDER" --release "${COMMON_FLAGS[@]}" "${DIR_FLAGS_LINUX_RELEASE[@]}"
./lib.sh "../$THE_FOLDER" --release --ems "${COMMON_FLAGS[@]}" -DDAS_TOOLS_DISABLED=ON "${DIR_FLAGS_EMSCRIPTEN[@]}"
./lib.sh "../$THE_FOLDER" --release --android "${COMMON_FLAGS[@]}" -DDAS_TOOLS_DISABLED=ON "${DIR_FLAGS_ANDROID_V8[@]}"
./lib.sh "../$THE_FOLDER" --release --android arm "${COMMON_FLAGS[@]}" -DDAS_TOOLS_DISABLED=ON "${DIR_FLAGS_ANDROID_V7[@]}"