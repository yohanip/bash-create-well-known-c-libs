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
    ./lib.sh the_wren -DBUILD_SHARED_LIBS=ON 
else
    ./lib.sh the_wren
fi
./lib.sh the_wren --release 
./lib.sh the_wren --release --ems
./lib.sh the_wren --release --android
./lib.sh the_wren --release --android arm