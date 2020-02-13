FROM alpine:3.11 AS base

ADD target/pkg/linux64.tar.gz /linux64

RUN mkdir -p /linux64/src

ADD static/docker /linux64


FROM debian:10.2-slim

COPY --from=base /linux64 /

RUN apt update \
 && apt install -y git zip unzip curl nano bash bash-completion \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /src

CMD bash -l
