#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME="tmb-planetiler-openmaptiles"
VERSION="0.9.1"

# build
docker build -t ${IMAGE_NAME}:${VERSION} .
