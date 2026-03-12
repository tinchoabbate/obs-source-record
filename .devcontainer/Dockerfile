FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=${USER_UID}

RUN apt-get update && apt-get install -y --no-install-recommends \
    bear \
    build-essential \
    ca-certificates \
    ccache \
    clang \
    clangd \
    clang-format \
    clang-tidy \
    cmake \
    curl \
    dbus-x11 \
    gdb \
    git \
    jq \
    libobs-dev \
    lldb \
    ninja-build \
    obs-studio \
    obs-websocket \
    pkg-config \
    python3 \
    ripgrep \
    rsync \
    sudo \
    valgrind \
    xauth \
    xvfb \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd --gid ${USER_GID} ${USERNAME} \
    && useradd --uid ${USER_UID} --gid ${USER_GID} -m -s /bin/bash ${USERNAME} \
    && echo "${USERNAME} ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/${USERNAME} \
    && chmod 0440 /etc/sudoers.d/${USERNAME} \
    && mkdir -p /workspaces/obs-source-record/.ccache \
    && chown -R ${USERNAME}:${USERNAME} /workspaces/obs-source-record
