#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

plugin_prefix="${PLUGIN_PREFIX:-$PWD/.obs-dev/plugins}"
config_root="${OBS_DEV_CONFIG:-$PWD/.obs-dev/config}"
log_dir="${OBS_DEV_LOGS:-$PWD/.obs-dev/logs}"

mkdir -p "$plugin_prefix" "$config_root" "$log_dir"

timestamp="$(date +%Y%m%d-%H%M%S)"
log_file="$log_dir/obs-${timestamp}.log"

export HOME="$config_root/home"
export XDG_CONFIG_HOME="$config_root/xdg-config"
export XDG_DATA_HOME="$config_root/xdg-data"
export XDG_CACHE_HOME="$config_root/xdg-cache"
mkdir -p "$HOME" "$XDG_CONFIG_HOME" "$XDG_DATA_HOME" "$XDG_CACHE_HOME"

export OBS_PLUGINS_PATH="${plugin_prefix}/lib/obs-plugins"
export OBS_DATA_PATH="${plugin_prefix}/share/obs/obs-plugins"

exec xvfb-run -a obs --verbose "$@" 2>&1 | tee "$log_file"
