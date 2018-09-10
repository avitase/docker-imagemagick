#!/bin/bash

IMAGE=avitase/docker-imagemagick:latest
ARGS=$@

exec docker run --rm -i --user="$(id -u):$(id -g)" \
-v "$PWD":/workdir \
$IMAGE /bin/bash -c \
"/usr/bin/convert $ARGS"
