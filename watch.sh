#!/bin/sh
set -eu
python3 -m http.server --directory public &
python3=$!
trap "kill $python3" EXIT INT TERM
find static templates build.sh | entr -d -- ./build.sh
