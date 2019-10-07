# note: gcov2lcov also needs a running go executable in the container, so we
# keep this as the base 
FROM golang:1.13-alpine 

LABEL MAINTAINER="Jan Delgado <jdelagdo@gmx.net>"
LABEL "com.github.actions.description"="convert golang coverager to lcov format"
LABEL "com.github.actions.name"="gcov2lcov-action"
LABEL "com.github.actions.color"="blue"

WORKDIR /go/src/app
ADD . /go/src/app

RUN GO111MODULE=on go get -u github.com/jandelgado/gcov2lcov

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
