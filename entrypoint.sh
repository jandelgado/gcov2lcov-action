#!/bin/sh
set -eu

unset GOROOT
unset GOPATH

cd $GITHUB_WORKSPACE
/go/bin/gcov2lcov -infile "$INPUT_INFILE" -outfile "$INPUT_OUTFILE"
