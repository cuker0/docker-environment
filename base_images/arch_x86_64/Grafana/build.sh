#!/bin/bash

set -ex

REGISTRY="echteler"
IMAGE_NAME="grafana"
TAG="x86_64"

docker rmi ${REGISTRY}/${IMAGE_NAME}:${TAG}
docker build -t ${REGISTRY}/${IMAGE_NAME}:${TAG} --rm --build-arg "GF_INSTALL_PLUGINS=grafana-clock-panel,grafana-simple-json-datasource,grafana-worldmap-panel,snuids-radar-panel,btplc-status-dot-panel,natel-discrete-panel,natel-influx-admin-panel,natel-plotly-panel" .
docker push ${REGISTRY}/${IMAGE_NAME}:${TAG}