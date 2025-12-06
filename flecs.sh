#!/usr/bin/env bash
set -euo pipefail

./lib.sh ../flecs -DFLECS_STATIC=OFF -DFLECS_SHARED=ON
./lib.sh ../flecs -DFLECS_STATIC=ON -DFLECS_SHARED=OFF --release
./lib.sh ../flecs -DFLECS_STATIC=ON -DFLECS_SHARED=OFF --release --ems
./lib.sh ../flecs -DFLECS_STATIC=ON -DFLECS_SHARED=OFF --release --android
./lib.sh ../flecs -DFLECS_STATIC=ON -DFLECS_SHARED=OFF --release --android arm