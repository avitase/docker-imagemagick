FROM ubuntu:latest

ARG USERNAME=imagemagick

ENV DEBIAN_FRONTEND noninteractive
ENV TERM linux

RUN apt-get update -yqq && \
apt-get install -yqq \
apt-utils ca-certificates

RUN apt-get install -yqq locales && locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

RUN apt-get install -yqq imagemagick

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /workdir && \
chmod -R a+rwX /workdir

RUN useradd -ms /bin/bash ${USERNAME}
USER ${USERNAME}
WORKDIR /workdir

VOLUME ["/workdir"]
