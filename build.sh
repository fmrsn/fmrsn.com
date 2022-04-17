#!/bin/sh
set -eu

CDPATH='' cd -- "$(dirname "$0")"

: "${SITE:=$(basename "$PWD")}"
export SITE

rm -fr public
cp -r static public
for file in index.html sitemap.xml robots.txt; do
	source="templates/$file.sh"
	target="public/$file"
	sh -eu "$source" >"$target"
done
if command -v minify >/dev/null; then
	minify -ro . public
fi
