FROM alpine:3.11 AS base

ADD target/pkg/linux64.zip /
ADD static/docker /linux64

RUN apk --no-cache add unzip \
 && unzip -q linux64.zip -d /linux64 \
 && mkdir -p /linux64/src 
# && rm -rf /linux64/lib/corretto



#FROM openjdk:8u212-jre-alpine3.9
#FROM alpine:3.11
#FROM frolvlad/alpine-glibc:alpine-3.11_glibc-2.30
FROM debian:10.2-slim

#ENV JAVA_HOME=/lib/corretto

COPY --from=base /linux64 /

#RUN apk --no-cache add git zip unzip curl nano bash bash-completion

RUN apt update \
 && apt install -y git zip unzip curl nano bash bash-completion \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /src

CMD bash -l
