#!/usr/bin/env bash
set -euo pipefail

./lib.sh ../flecs -DFLECS_STATIC=OFF -DFLECS_SHARED=ON
./lib.sh ../flecs -DFLECS_STATIC=ON -DFLECS_SHARED=OFF --release
# ./lib.sh ../flecs -DFLECS_STATIC=ON -DFLECS_SHARED=OFF --release --ems -DCMAKE_C_FLAGS='-DFLECS_CUSTOM_BUILD -DFLECS_CPP -DFLECS_SYSTEM -DFLECS_LOG -DFLECS_PIPELINE -DFLECS_META'
./lib.sh ../flecs -DFLECS_STATIC=ON -DFLECS_SHARED=OFF --release --ems
./lib.sh ../flecs -DFLECS_STATIC=ON -DFLECS_SHARED=OFF --release --android
./lib.sh ../flecs -DFLECS_STATIC=ON -DFLECS_SHARED=OFF --release --android arm