#!/bin/bash

docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t benbabik/swift-linux-base:latest \
  --push \
  --file Containerfile \
  .