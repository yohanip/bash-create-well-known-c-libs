#!/usr/bin/env bash
set -euo pipefail

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

# rm -rf "../$THE_FOLDER/bin" "../$THE_FOLDER/lib"
# ./lib.sh "../$THE_FOLDER" -DDAS_ENABLE_DLL=ON "${COMMON_FLAGS[@]}" -DDAS_TOOLS_DISABLED=ON
# cp -af "../$THE_FOLDER/lib/." "install/linux/Debug/lib/"

# rm -rf "../$THE_FOLDER/bin" "../$THE_FOLDER/lib"
# ./lib.sh "../$THE_FOLDER" --release "${COMMON_FLAGS[@]}"
# cp -af "../$THE_FOLDER/lib/." "install/linux/Release/lib/"
# cp -af "../$THE_FOLDER/bin/." "install/linux/Release/bin/"

# rm -rf "../$THE_FOLDER/bin" "../$THE_FOLDER/lib"
# ./lib.sh "../$THE_FOLDER" --release --android "${COMMON_FLAGS[@]}" -DDAS_TOOLS_DISABLED=ON
# cp -af "../$THE_FOLDER/lib/." "install/linux/Release/lib/"

# rm -rf "../$THE_FOLDER/bin" "../$THE_FOLDER/lib"
# ./lib.sh "../$THE_FOLDER" --release --android arm "${COMMON_FLAGS[@]}" -DDAS_TOOLS_DISABLED=ON

rm -rf "../$THE_FOLDER/bin" "../$THE_FOLDER/lib"
./lib.sh "../$THE_FOLDER/web" --release --ems
cp -af "../$THE_FOLDER/lib/." "install/emscripten/Release/lib/"

# clean up
rm -rf "../$THE_FOLDER/bin" "../$THE_FOLDER/lib"