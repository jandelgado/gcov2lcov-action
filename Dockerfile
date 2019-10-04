# note: gcov2lcov also needs a running go executable in the container, so we
# keep this as the base 
FROM golang:1.13-alpine 
LABEL MAINTAINER="Jan Delgado <jdelagdo@gmx.net>"

WORKDIR /go/src/app
ADD . /go/src/app

RUN GO111MODULE=on go get -u github.com/jandelgado/gcov2lcov

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
