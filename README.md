# Source Record (OBS Plugin)

Source Record is an OBS filter plugin that adds per-source recording, replay buffer, and streaming control directly to individual sources.

## Purpose

- Record or stream a specific source independently of global OBS outputs.
- Support source-scoped controls (pause, split, chapter, replay save).
- Expose automation endpoints through `obs-websocket` vendor requests.

## Key Components

- `source-record.c`: Main plugin implementation (lifecycle, outputs, encoders, websocket handlers, hotkeys, UI properties).
- `data/locale/*`: Localized UI strings.
- `CMakeLists.txt`: In-tree and out-of-tree build configuration.

## Architecture

- The plugin registers a filter source type (`source_record_filter`).
- Each filter instance owns a context with:
  - output objects (`file`, `stream`, `replay`)
  - encoder/audio state
  - view/background management
  - hotkeys and frontend event hooks
- Output operations are asynchronous and coordinated through OBS task queues.
- Bulk websocket requests enumerate source parents and apply actions per filter instance.

## Build

### Option 1: Devcontainer (recommended for this repo)

```bash
cmake -S . -B build/debug -G Ninja -DBUILD_OUT_OF_TREE=On -DCMAKE_BUILD_TYPE=Debug
cmake --build build/debug -j4
```

Artifact:
- `build/debug/rundir/Debug/obs-plugins/64bit/source-record.so`

### Option 2: Out-of-tree (Linux)

Requires OBS development packages (`libobs`, frontend API headers/libs).

```bash
cmake -S . -B build -DBUILD_OUT_OF_TREE=On
cmake --build build -j4
```

### Option 3: In-tree (OBS Studio source tree)

1. Add this repository under `plugins/source-record`.
2. Add `add_subdirectory(source-record)` to OBS `plugins/CMakeLists.txt`.
3. Reconfigure and rebuild OBS.

## Download

https://obsproject.com/forum/resources/source-record.1285/
