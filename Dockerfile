# syntax=docker/dockerfile:experimental
FROM --platform=${TARGETPLATFORM:-linux/amd64} rust:latest as builder

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN printf "I am running on ${BUILDPLATFORM:-linux/amd64}, building for ${TARGETPLATFORM:-linux/amd64}\n$(uname -a)\n"

WORKDIR /usr/src
RUN git clone https://github.com/Miserlou/Loop.git loop \
  && cd loop \
  && rm Cargo.lock \
  && cargo build --release

FROM --platform=${TARGETPLATFORM:-linux/amd64} alpine:latest

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

RUN apk --update --no-cache add \
    tzdata \
  && rm -rf /var/cache/apk/* /tmp/*

COPY --from=builder /usr/src/loop/target/release/loop /usr/local/bin/loop
COPY entrypoint.sh /entrypoint.sh
COPY assets /

RUN chmod a+x /entrypoint.sh /usr/local/bin/*

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "/usr/local/bin/run_loop" ]
