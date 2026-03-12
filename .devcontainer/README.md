# Devcontainer Notes

This container is intended for patching and validating the Source Record OBS plugin.

Included tooling:

- official `ubuntu:22.04` base image
- `libobs-dev`, `obs-studio`, `obs-websocket`
- `clang`, `clangd`, `clang-tidy`, `clang-format`
- `cmake`, `ninja`, `bear`, `ccache`
- `gdb`, `lldb`, `valgrind`
- `xvfb` for running OBS in a virtual display

Typical workflow:

1. `scripts/build-debug.sh`
2. `scripts/install-local.sh`
3. `scripts/run-obs-xvfb.sh`

The default install prefix for plugin testing is `.obs-dev/plugins`.
