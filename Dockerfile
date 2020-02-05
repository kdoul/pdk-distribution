FROM alpine:3.11 AS base

ADD target/pkg/linux64.zip /
ADD static/docker /linux64

RUN apk --no-cache add unzip \
 && unzip linux64.zip -d /linux64 \
 && mkdir -p /linux64/src



FROM openjdk:8u212-jdk-alpine3.9

COPY --from=base /linux64 /

RUN apk --no-cache add git zip unzip curl nano bash bash-completion

WORKDIR /src

CMD bash -l
