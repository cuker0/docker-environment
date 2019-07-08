#!/bin/bash

set -ex

REGISTRY="echteler"
IMAGE_NAME="influxdb"
TAG="x86_64"

docker rmi ${REGISTRY}/${IMAGE_NAME}:${TAG}
docker build -t ${REGISTRY}/${IMAGE_NAME}:${TAG} --rm .
docker push ${REGISTRY}/${IMAGE_NAME}:${TAG}