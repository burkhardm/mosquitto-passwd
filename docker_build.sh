#!/bin/sh
docker build --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ')  --build-arg VCS_REF=$(git rev-parse --short HEAD) --build-arg BUILD_VERSION="0.2" -t burkhardm/mosquitto-passwd:0.2 -t burkhardm/mosquitto-passwd:latest .
