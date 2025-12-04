#!/usr/bin/env bash
set -euo pipefail

./lib.sh ../cimgui
./lib.sh ../cimgui --release -DIMGUI_STATIC=ON
./lib.sh ../cimgui --release --ems -DIMGUI_STATIC=ON
./lib.sh ../cimgui --release --android -DIMGUI_STATIC=ON
./lib.sh ../cimgui --release --android arm -DIMGUI_STATIC=ON
./lib.sh ../cimgui --release --android x64 -DIMGUI_STATIC=ON