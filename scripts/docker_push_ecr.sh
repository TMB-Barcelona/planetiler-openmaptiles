#!/usr/bin/env bash
set -euo pipefail

DOCKER_REGISTRY=${AWS_ECR_PRIVATE}

IMAGE_NAME="tmb-planetiler-openmaptiles"
VERSION="3.15.1-SNAPSHOT-080f3e4c"

# Login to AWS Registry (using AWS environment variables)
aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin ${DOCKER_REGISTRY}

# Create REPO if it doesn't exist
aws ecr describe-repositories --repository-names ${IMAGE_NAME} 2>/dev/null || aws ecr create-repository --repository-name ${IMAGE_NAME}

# Tag the image
docker tag ${IMAGE_NAME}:${VERSION} ${DOCKER_REGISTRY}/${IMAGE_NAME}:${VERSION}

# Push image to registry
docker push ${DOCKER_REGISTRY}/${IMAGE_NAME}:${VERSION}
