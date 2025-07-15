FROM ubuntu:24.04

# Install required system dependencies
RUN apt-get update && apt-get install -y \
    libsodium-dev \
    libssl-dev \
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
    && rm -rf /var/lib/apt/lists/*

RUN curl -O https://download.swift.org/swiftly/linux/swiftly-$(uname -m).tar.gz && \
    tar zxf swiftly-$(uname -m).tar.gz

RUN ./swiftly init --quiet-shell-followup --assume-yes

ENV HOME="/root"
ENV SWIFTLY_HOME_DIR="$HOME/.local/share/swiftly"
ENV PATH="$PATH:$SWIFTLY_HOME_DIR/bin"
