ARG ARCH=
FROM ${ARCH}ubuntu:24.04 AS base

# Install required system dependencies
RUN apt-get update && apt-get install -y \
    libsodium-dev \
    libssl-dev \
    wget \
    curl \
    gpg \
    binutils \
    git \
    unzip \
    gnupg2 \
    libc6-dev \
    libcurl4-openssl-dev \
    libedit2 \
    libgcc-13-dev \
    libpython3-dev \
    libstdc++-13-dev \
    libxml2-dev \
    libncurses-dev \
    libz3-dev \
    pkg-config \
    # tzdata \ # swift says it wants this, but I'm not sure it needs it...
    zlib1g-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://download.swift.org/swift-6.1.2-release/ubuntu2404/swift-6.1.2-RELEASE/swift-6.1.2-RELEASE-ubuntu24.04.tar.gz && \
    tar -xzf swift-6.1.2-RELEASE-ubuntu24.04.tar.gz -C /usr/local/ && \
    rm swift-6.1.2-RELEASE-ubuntu24.04.tar.gz

# Set environment variables for Swift
ENV SWIFT_HOME="/usr/local/swift"
ENV PATH="$PATH:$SWIFT_HOME/bin"

RUN echo 'if [ -f /etc/bash_completion ] && ! shopt -oq posix; then\n    . /etc/bash_completion\nfi' >> /root/.bashrc

FROM base AS node23

RUN curl -sL https://deb.nodesource.com/setup_23.x | bash
RUN apt-get update && apt-get install -y nodejs && rm -rf /var/lib/apt/lists/*
