#!/bin/sh
set -eu

unset GOPATH
export GOROOT=/usr/local/go

cd $GITHUB_WORKSPACE
exec /app/gcov2lcov-linux-amd64 -infile "$INPUT_INFILE" -outfile "$INPUT_OUTFILE"
