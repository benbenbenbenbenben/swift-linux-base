#!/bin/bash

docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t benbabik/swift-linux-base:latest \
  --push \
  --target base \
  --file Containerfile \
  .

docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t benbabik/swift-linux-base:nodejs \
  --push \
  --target nodejs \
  --file Containerfile \
  .