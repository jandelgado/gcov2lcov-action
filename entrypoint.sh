#!/bin/bash
set -xeuo pipefail
NAME="gcov2lcov-linux-amd64"
if [ ! -f "/tmp/$NAME" ]; then
    wget "https://github.com/jandelgado/gcov2lcov/releases/${VERSION}/download/${NAME}.tar.gz" -q -O - | tar zxf - --strip 1 --directory "/tmp"
    chmod +x "/tmp/$NAME"
fi
exec "/tmp/$NAME" -infile "${INFILE}" -outfile "${OUTFILE}"
