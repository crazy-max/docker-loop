# syntax=docker/dockerfile:1

ARG RUST_VERSION=1.69
ARG ALPINE_VERSION=3.17
ARG XX_VERSION=1.2.1
ARG LOOP_VERSION=209927c4bd02cc801c336353d8fcea32dfad1fd6

FROM --platform=$BUILDPLATFORM alpine:${ALPINE_VERSION} AS src
RUN apk add --no-cache git
WORKDIR /src/loop
RUN git init . && git remote add origin "https://github.com/Miserlou/Loop.git"
ARG LOOP_VERSION
RUN git fetch origin "${LOOP_VERSION}" && git checkout -q FETCH_HEAD

FROM --platform=$BUILDPLATFORM tonistiigi/xx:${XX_VERSION} AS xx
FROM --platform=$BUILDPLATFORM rust:${RUST_VERSION}-alpine as base
RUN apk add clang lld musl-dev gcc git file
COPY --from=xx / /
WORKDIR /work

FROM base AS cargo
RUN --mount=from=src,source=/src/loop/Cargo.toml,target=/work/Cargo.toml,rw \
    --mount=from=src,source=/src/loop/Cargo.lock,target=/work/Cargo.lock,rw \
    --mount=type=cache,target=/usr/local/cargo/git/db \
    --mount=type=cache,target=/usr/local/cargo/registry/cache \
    --mount=type=cache,target=/usr/local/cargo/registry/index \
    cargo fetch

FROM cargo AS build
ARG TARGETPLATFORM
RUN xx-apk add musl-dev gcc
RUN --mount=from=src,source=/src/loop,target=.,rw \
    --mount=type=cache,target=/usr/local/cargo/git/db \
    --mount=type=cache,target=/usr/local/cargo/registry/cache \
    --mount=type=cache,target=/usr/local/cargo/registry/index \
    --mount=type=cache,target=/build/app,id=$TARGETPLATFORM <<EOT
  set -ex
  mkdir -p /out
  xx-cargo build --release --target-dir /build/loop
  cp /build/loop/$(xx-cargo --print-target-triple)/release/loop /out/
  xx-verify --static /out/loop
EOT

FROM alpine:${ALPINE_VERSION}
COPY --from=build /out/loop /usr/local/bin/loop
RUN apk --update --no-cache add tzdata && loop --version

ENV TZ="UTC" \
  LOG_FILE="/tmp/loop.log" \
  DURATION="60s"

CMD [ "/bin/sh", "-c", "loop --for-duration ${DURATION} --every 1s -- echo -e '$(date) - $(hostname)' | tee -a ${LOG_FILE}" ]
