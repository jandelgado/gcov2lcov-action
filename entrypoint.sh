#!/bin/sh
set -eu

unset GOPATH

cd $GITHUB_WORKSPACE
/app/gcov2lcov-linux-amd64 -infile "$INPUT_INFILE" -outfile "$INPUT_OUTFILE"
