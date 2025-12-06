#!/usr/bin/env bash
set -euo pipefail

./lib.sh ../raylib -DBUILD_SHARED_LIBS=ON -DBUILD_EXAMPLES=OFF
./lib.sh ../raylib --release -DBUILD_EXAMPLES=OFF
./lib.sh ../raylib --release --ems -DPLATFORM=Web -DBUILD_EXAMPLES=OFF
./lib.sh ../raylib --release --android -DPLATFORM=Android -DBUILD_EXAMPLES=OFF
./lib.sh ../raylib --release --android arm -DPLATFORM=Android -DBUILD_EXAMPLES=OFF