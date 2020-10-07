# note: gcov2lcov also needs a running go executable in the container, so we
# keep this as the base 
FROM golang:1.15-alpine

ARG VERSION=v1.0.4

LABEL MAINTAINER="Jan Delgado <jdelagdo@gmx.net>"
LABEL "com.github.actions.description"="convert golang coverager to lcov format"
LABEL "com.github.actions.name"="gcov2lcov-action"
LABEL "com.github.actions.color"="blue"

WORKDIR /app
ADD . /app

ENV GOROOT=/usr/local/go
RUN wget https://github.com/jandelgado/gcov2lcov/releases/download/${VERSION}/gcov2lcov-linux-amd64.tar.gz -q -O - |\
      tar xvzf - --strip 1\
   && chmod 755 gcov2lcov-linux-amd64 

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
