#!/bin/bash
set -xeuo pipefail
TMP_BIN=$(mktemp -d -t ci-XXXXXXXXXX)
NAME="gcov2lcov-linux-amd64"
wget "https://github.com/jandelgado/gcov2lcov/releases/download/${VERSION}/${NAME}.tar.gz" -q -O - | tar zxf - --strip 1 --directory "$TMP_BIN"
chmod +x "$TMP_BIN/$NAME"
exec "$TMP_BIN/gcov2lcov-linux-amd64" -infile "${INFILE}" -outfile "${OUTFILE}"
