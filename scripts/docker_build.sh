#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME="tmb-planetiler-openmaptiles"
VERSION="3.15.1-SNAPSHOT"

# build
docker build -t ${IMAGE_NAME}:${VERSION} .
