#!/usr/bin/env bash
set -euo pipefail

./lib.sh the_lua -DBUILD_SHARED_LIBS=ON 
./lib.sh the_lua --release 
./lib.sh the_lua --release --ems
./lib.sh the_lua --release --android
./lib.sh the_lua --release --android arm