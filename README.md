# swift-linux-base
A Swift linux container that doesn't have (reported, heh) vulns.

Using ubuntu:24.04 and swift 6.2-RELEASE.

```bash -
docker pull benbabik/swift-linux-base
```

## Contributing

```bash - +ship
docker build --platform linux/amd64,linux/arm64 . -f Containerfile -t benbabik/swift-linux-base:latest --target base --push
docker build --platform linux/amd64,linux/arm64 . -f Containerfile -t benbabik/swift-linux-base:node23 --target node23 --push
```
