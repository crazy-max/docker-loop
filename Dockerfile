FROM rust:latest as builder

WORKDIR /usr/src
RUN git clone https://github.com/Miserlou/Loop.git loop \
  && cd loop \
  && rustup target install x86_64-unknown-linux-musl \
  && cargo build --release --target=x86_64-unknown-linux-musl

FROM alpine:latest

LABEL maintainer="CrazyMax"

COPY --from=builder /usr/src/loop/target/x86_64-unknown-linux-musl/release/loop /usr/local/bin/loop

RUN loop --version \
  && apk --update --no-cache add \
    tzdata \
  && rm -rf /var/cache/apk/* /tmp/*

ENV TZ="UTC" \
  LOG_FILE="/tmp/loop.log" \
  DURATION="60s"

CMD [ "/bin/sh", "-c", "loop --for-duration ${DURATION} --every 1s -- echo -e '$(date) - $(hostname)' | tee -a ${LOG_FILE}" ]
