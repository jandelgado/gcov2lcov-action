#!/bin/bash
set -euo pipefail
TMP_BIN=$(mktemp -d -t ci-XXXXXXXXXX)
export PATH="$TMP_BIN:$PATH"

set -x
cd "$TMP_BIN" || exit 2
wget "https://github.com/jandelgado/gcov2lcov/releases/download/${VERSION}/gcov2lcov-linux-amd64.tar.gz" -q -O - | tar xvzf - --strip 1
chmod +x gcov2lcov-linux-amd64

cd "$GITHUB_WORKSPACE/$WORKSPACE" || exit 1

exec gcov2lcov-linux-amd64 -infile "${INFILE}" -outfile "${OUTFILE}"
