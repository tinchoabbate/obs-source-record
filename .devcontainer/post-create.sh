#!/usr/bin/env bash
set -euo pipefail

cd /workspaces/obs-source-record

git config --global --add safe.directory /workspaces/obs-source-record

mkdir -p build/debug .obs-dev/plugins .obs-dev/config .obs-dev/logs

if command -v ccache >/dev/null 2>&1; then
  ccache --set-config=max_size=2G >/dev/null 2>&1 || true
fi

cmake -S . -B build/debug \
  -G Ninja \
  -DBUILD_OUT_OF_TREE=On \
  -DCMAKE_BUILD_TYPE=Debug \
  -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
  -DCMAKE_C_COMPILER=clang
