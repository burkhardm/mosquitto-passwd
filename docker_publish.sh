#!/bin/sh
docker login --username=burkhardm
docker push burkhardm/mosquitto-passwd:latest
docker push burkhardm/mosquitto-passwd:0.1
docker logout
