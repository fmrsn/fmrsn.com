#!/bin/sh
set -eu

: "${SITE:=$(CDPATH='' cd -- "$(dirname "$0")" && basename "$(pwd)")}"
export SITE

newerthan() {
	test -n "$(find -L "$1" -newer "$2" -exec echo newer \; 2>/dev/null || echo newer)"
}

for source in $(find static -type f); do
    target="$source"
    target="public/${target#*/}"
    mkdir -p "$(dirname "$target")"
    if newerthan "$source" "$target"; then
        cp "$source" "$target"
    fi
done
for source in $(find templates -type f -name '*.sh'); do
    target="${source%.sh}"
    target="public/${target#*/}"
    mkdir -p "$(dirname "$target")"
    if newerthan "$source" "$target"; then
        sh "$source" >"$target"
    fi
done
if command -v minify >/dev/null; then
    minify -ro . public
fi
