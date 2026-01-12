#!/usr/bin/env bash
set -euo pipefail
unix_based=false
case "$(uname)" in
  Linux*)   unix_based=true ;;
  Darwin*)  unix_based=true ;;
  MINGW*|MSYS*|CYGWIN*) unix_based=false ;;
  *)        echo "Unknown OS" ;;
esac

WHERE=the_rlimgui

if [[ "$unix_based" == true ]]; then
    ./lib.sh $WHERE -DBUILD_SHARED_LIBS=ON -DCMAKE_CXX_FLAGS="-DBUILD_LIBTYPE_SHARED"
else
    ./lib.sh $WHERE
fi
./lib.sh $WHERE --release 
./lib.sh $WHERE --release --ems
./lib.sh $WHERE --release --android
./lib.sh $WHERE --release --android arm