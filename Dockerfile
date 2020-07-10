FROM scratch AS base

ADD target/pkg/linux-amd64.tar.gz /linux64


FROM debian:10.2-slim

RUN apt update \
 && apt install -y git zip unzip curl bash bash-completion \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir -p /src \
 && ln -s /usr/lib/peppol/pdk/bin/pdk /usr/bin/pdk

ADD package/docker /

COPY --from=base /linux64 /usr/lib/peppol/pdk

WORKDIR /src

CMD bash -l
