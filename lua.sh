#!/usr/bin/env bash
set -euo pipefail
unix_based=false
case "$(uname)" in
  Linux*)   unix_based=true ;;
  Darwin*)  unix_based=true ;;
  MINGW*|MSYS*|CYGWIN*) unix_based=false ;;
  *)        echo "Unknown OS" ;;
esac

if [[ "$unix_based" == true ]]; then
    ./lib.sh the_lua -DBUILD_SHARED_LIBS=ON 
else
    ./lib.sh the_lua
fi
./lib.sh the_lua --release 
./lib.sh the_lua --release --ems
./lib.sh the_lua --release --android
./lib.sh the_lua --release --android arm