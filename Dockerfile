FROM debian:10.9-slim AS base

ADD src/bin/arch /tmp/arch
ADD target/pkg /tmp/pkg

RUN sh /tmp/arch
RUN mkdir -p /linux64 && tar -zxf /tmp/pkg/linux-$(sh /tmp/arch).tar.gz -C /linux64



FROM debian:10.9-slim
ARG TARGETARCH

ENV PDK_PATH=/usr/lib/peppol/pdk \
    JAVA_HOME=/usr/lib/peppol/pdk/lib/adoptopenjdk

RUN apt update \
 && DEBIAN_FRONTEND=noninteractive apt install -y git zip unzip curl bash bash-completion make \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir -p /src \
 && ln -s $PDK_PATH/bin/pdk /usr/bin/pdk \
 && ln -s $PDK_PATH/lib/jruby/bin/jruby /usr/bin/jruby \
 && ln -s $PDK_PATH/lib/hugo/hugo /usr/bin/hugo

ADD package/docker /

COPY --from=base /linux64 /usr/lib/peppol/pdk

WORKDIR /src

CMD bash -l
