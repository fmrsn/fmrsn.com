#!/bin/sh
set -eu

CDPATH='' cd -- "$(dirname "$0")"

: "${SITE:=$(basename "$PWD")}"
export SITE

rm -fr public
cp -r static public
sh -eu templates/index.html.sh >public/index.html
sh -eu templates/sitemap.xml.sh >public/sitemap.xml
sh -eu templates/robots.txt.sh >public/robots.txt
minify -ro . public || true
