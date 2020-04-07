FROM rust:latest as builder

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

WORKDIR /usr/src
RUN git clone https://github.com/Miserlou/Loop.git loop \
  && cd loop \
  && rustup target install x86_64-unknown-linux-musl \
  && cargo build --release --target=x86_64-unknown-linux-musl

FROM alpine:latest

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

LABEL maintainer="CrazyMax" \
  org.opencontainers.image.created=$BUILD_DATE \
  org.opencontainers.image.url="https://github.com/crazy-max/docker-loop" \
  org.opencontainers.image.source="https://github.com/crazy-max/docker-loop" \
  org.opencontainers.image.version=$VERSION \
  org.opencontainers.image.revision=$VCS_REF \
  org.opencontainers.image.vendor="CrazyMax" \
  org.opencontainers.image.title="loop" \
  org.opencontainers.image.description="Simple loop for dummy services" \
  org.opencontainers.image.licenses="MIT"

COPY --from=builder /usr/src/loop/target/x86_64-unknown-linux-musl/release/loop /usr/local/bin/loop

RUN loop --version \
  && apk --update --no-cache add \
    tzdata \
  && rm -rf /var/cache/apk/* /tmp/*

ENV TZ="UTC" \
  LOG_FILE="/tmp/loop.log" \
  DURATION="60s"

CMD [ "/bin/sh", "-c", "loop --for-duration ${DURATION} --every 1s -- echo -e '$(date) - $(hostname)' | tee -a ${LOG_FILE}" ]
