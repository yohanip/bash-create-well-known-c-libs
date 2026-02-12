#!/usr/bin/env bash
set -euo pipefail
unix_based=false
case "$(uname)" in
  Linux*)   unix_based=true ;;
  Darwin*)  unix_based=true ;;
  MINGW*|MSYS*|CYGWIN*) unix_based=false ;;
  *)        echo "Unknown OS" ;;
esac

THE_DIR=the_raylib_nuklear

if [[ "$unix_based" == true ]]; then
    ./lib.sh $THE_DIR -DBUILD_SHARED_LIBS=ON 
else
    ./lib.sh $THE_DIR
fi
./lib.sh $THE_DIR --release 
./lib.sh $THE_DIR --release --ems
./lib.sh $THE_DIR --release --android
./lib.sh $THE_DIR --release --android arm