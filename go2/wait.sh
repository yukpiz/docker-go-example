#!/bin/sh

# setup dockerize
DOCKERIZE_VERSION=v0.6.1
wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz
tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz
rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

# setup curl
apk --update add curl

# waiting process...
dockerize -wait http://go1:8080/ping
# send stop container request
curl -i http://go1:8080/stop > /dev/null 2>&1

exit 0
