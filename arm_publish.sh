#!/bin/sh
docker login --username=burkhardm
docker push burkhardm/mosquitto-passwd:arm-latest
docker push burkhardm/mosquitto-passwd:arm-0.2
docker logout
