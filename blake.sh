#!/usr/bin/env bash
set -euo pipefail

./lib.sh ../BLAKE3/c --name:blake3 -DBUILD_SHARED_LIBS=ON
./lib.sh ../BLAKE3/c --name:blake3 --release
./lib.sh ../BLAKE3/c --name:blake3 --release --ems -DBLAKE3_CFLAGS_SSE2="" -DBLAKE3_SIMD_TYPE="none"
./lib.sh ../BLAKE3/c --name:blake3 --release --android
./lib.sh ../BLAKE3/c --name:blake3 --release --android arm
./lib.sh ../BLAKE3/c --name:blake3 --release --android x64