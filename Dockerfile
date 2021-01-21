ARG HUGO_VERSION=0.80.0

FROM klakegg/hugo:${HUGO_VERSION}-ubuntu

ARG GO_VERSION=1.15.7

LABEL maintainer="twb<1174865138@qq.com><github.com/twbworld>"
LABEL description="构建hugo-go-git镜像"

WORKDIR /src

RUN set -xe \
        && apt-get update \
        && apt-get install -y --no-install-recommends \
          git \
          curl \
          tar \
        && curl -LO https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz \
        && tar -xzf ${PWD}/go${GO_VERSION}.linux-amd64.tar.gz -C /usr/local \
        && ln -s /usr/local/go/bin/go /usr/bin/go \
        && ln -s /usr/local/go/bin/gofmt /usr/bin/gofmt \
        && rm -f ${PWD}/go${GO_VERSION}.linux-amd64.tar.gz \
        && hugo version \
        && go version
