# OpenTelemetry C++ Cloud Agent base image
FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ninja-build \
        build-essential \
        g++ \
        g++-14 \
        libstdc++-13-dev \
        libstdc++-14-dev \
        cmake \
        curl \
        wget \
        git \
        pkg-config \
        libcurl4-openssl-dev \
        zlib1g-dev \
        libssl-dev \
        ca-certificates \
        libgtest-dev \
        libbenchmark-dev \
        nlohmann-json-dev \
        sudo \
    && rm -rf /var/lib/apt/lists/*

ARG BAZELISK_VERSION=v1.28.1
RUN wget -qO /usr/local/bin/bazel \
        "https://github.com/bazelbuild/bazelisk/releases/download/${BAZELISK_VERSION}/bazelisk-linux-amd64" \
    && chmod +x /usr/local/bin/bazel

RUN if ! id ubuntu >/dev/null 2>&1; then \
        useradd -m -u 1000 -G sudo ubuntu \
        && echo 'ubuntu ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers; \
    fi

USER ubuntu
WORKDIR /home/ubuntu
