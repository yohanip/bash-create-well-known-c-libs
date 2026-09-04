#!/usr/bin/env bash
set -euo pipefail

THE_ROOT=../secp256k1/

./lib.sh $THE_ROOT -DBUILD_SHARED_LIBS=ON
./lib.sh $THE_ROOT --release
./lib.sh $THE_ROOT --release --ems
./lib.sh $THE_ROOT --release --android
./lib.sh $THE_ROOT --release --android arm