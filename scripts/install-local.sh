#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

prefix="${1:-$PWD/.obs-dev/plugins}"

cmake --install build/debug --prefix "$prefix"

printf 'Installed plugin artifacts under %s\n' "$prefix"
