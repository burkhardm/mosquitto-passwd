FROM alpine:latest
LABEL maintainer="m.r.hartmann@protonmail.com"

LABEL org.label-schema.schema-version="1.0.0-rc1" \
  org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.name="burkhardm/mosquitto-passwd" \
  org.label-schema.description="OpenSSL and Mosquitto password generator based on Alpine Linux." \
  org.label-schema.url="https://www.sourcedome.de" \
  org.label-schema.vcs-url="https://github.com/burkhardm/mosquitto-passwd" \
  org.label-schema.vcs-ref=$VCS_REF \
  org.label-schema.vendor="Martin Hartmann" \
  org.label-schema.version=$BUILD_VERSION \
  org.label-schema.docker.cmd="docker run -v ${pwd}/passwd:/passwd burkhardm/mosquitto-passwd user0 user1 user2"

ARG BUILD_DATE=""
ARG VCS_REF=""
ARG BUILD_VERSION="0.2"

VOLUME /passwd

RUN apk add --no-cache bash mosquitto openssl && rm -rf /var/cache/apk/*
COPY ./passwd.sh /passwd.sh
RUN chmod +x /passwd.sh
ENTRYPOINT ["/passwd.sh"]
CMD []
