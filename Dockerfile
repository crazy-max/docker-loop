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
  org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.name="loop" \
  org.label-schema.description="Simple loop for dummy services" \
  org.label-schema.version=$VERSION \
  org.label-schema.url="https://github.com/crazy-max/docker-loop" \
  org.label-schema.vcs-ref=$VCS_REF \
  org.label-schema.vcs-url="https://github.com/crazy-max/docker-loop" \
  org.label-schema.vendor="CrazyMax" \
  org.label-schema.schema-version="1.0"

COPY --from=builder /usr/src/loop/target/x86_64-unknown-linux-musl/release/loop /usr/local/bin/loop

RUN loop --version \
  && apk --update --no-cache add \
    tzdata \
  && rm -rf /var/cache/apk/* /tmp/*

ENV TZ="UTC" \
  LOG_FILE="/tmp/loop.log" \
  DURATION="60s"

CMD [ "/bin/sh", "-c", "loop --for-duration ${DURATION} --every 1s -- echo -e '$(date) - $(hostname)' | tee -a ${LOG_FILE}" ]
