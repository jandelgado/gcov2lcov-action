# gcov2lcov-action

[![Build Status](https://github.com/jandelgado/gcov2lcov-action/workflows/test/badge.svg)](https://github.com/jandelgado/gcov2lcov-action/actions?workflow=test)

Convert golang coverage files to lcov format. Works nicely with the [coveralls
github action](https://github.com/marketplace/actions/coveralls-github-action) and
uses [gcov2lcov](https://github.com/jandelgado/gcov2lcov) under the hood.

## Inputs

### `infile`

**Optional** Name of the go coverage file. Default `coverage.out`.

### `outfile`

**Optional** Name of the lcov file to write. Default `coverage.lcov`.

### `version`

**Optional** Name of the specific gcov2lcov program version. Default `latest`.

### `working-directory`

**Optional** Name of the change to specific working-directory.

## Outputs

No outputs.

## Example usage

```yaml
uses: jandelgado/gcov2lcov-action@v1.0.5
with:
  infile: coverage.out        # optional, default filename is `coverage.out`
  outfile: coverage.lcov      # optional, default filename is `coverage.lcov`
  version: v1.0.4             # optional, use specific `gcov2lcov` release version
  working-directory: testdata # optional, change working directory
```

### Full example

```yaml
coverage:
  runs-on: ubuntu-latest
  steps:
    - name: Install Go
      if: success()
      uses: actions/setup-go@v2-beta
    - name: Checkout code
      uses: actions/checkout@v2
    - name: Calc coverage
      run: |
        export PATH=$PATH:$(go env GOPATH)/bin
        go test -v -covermode=count -coverprofile=coverage.out
    - name: Convert coverage to lcov
      uses: jandelgado/gcov2lcov-action@v1.0.5
      with:
        infile: coverage.out
        outfile: coverage.lcov
    - name: Coveralls
      uses: coverallsapp/github-action@v1.0.4
      with:
        github-token: ${{ secrets.github_token }}
        path-to-lcov: coverage.lcov
```

See also [example repository](https://github.com/jandelgado/golang-ci-template-github-actions).

## Author

Copyright &copy; 2019 - 2020 Jan Delgado

## License

[MIT](LICENSE)
