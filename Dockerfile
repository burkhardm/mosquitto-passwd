FROM alpine:latest
LABEL maintainer="martin.bukhard@gmail.com"

ARG BUILD_DATE=""
ARG VCS_REF=""
ARG BUILD_VERSION="0.1"

LABEL org.label-schema.schema-version="1.0.0-rc1" \
  org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.name="burkhardm/mosquitto-passwd" \
  org.label-schema.description="OpenSSL and Mosquitto password generator based on Alpine Linux." \
  org.label-schema.url="https://www.sourcedome.de" \
  org.label-schema.vcs-url="https://github.com/burkhardm/mosquitto-passwd" \
  org.label-schema.vcs-ref=$VCS_REF \
  org.label-schema.vendor="Martin Burkhard" \
  org.label-schema.version=$BUILD_VERSION \
  org.label-schema.docker.cmd="docker run burkhardm/mosquitto-passwd"

RUN apk add --no-cache mosquitto openssl && rm -rf /var/cache/apk/*
COPY ./passwd.sh /passwd.sh
RUN chmod +x /passwd.sh
ENTRYPOINT ["/passwd.sh"]
CMD []
