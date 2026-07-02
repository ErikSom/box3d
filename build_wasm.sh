#!/usr/bin/env bash
# Build the samples for the web. Serve with: emrun build-web/bin/samples.html
set -euo pipefail

if ! command -v emcc >/dev/null 2>&1; then
    if [ -f "${EMSDK:-$HOME/emsdk}/emsdk_env.sh" ]; then
        # shellcheck disable=SC1091
        source "${EMSDK:-$HOME/emsdk}/emsdk_env.sh" >/dev/null
    else
        echo "error: emcc not found. Install the Emscripten SDK:" >&2
        echo "  git clone https://github.com/emscripten-core/emsdk.git ~/emsdk" >&2
        echo "  ~/emsdk/emsdk install latest && ~/emsdk/emsdk activate latest" >&2
        exit 1
    fi
fi

cmake --preset web
cmake --build --preset web --target samples

echo
echo "Serve with: emrun build-web/bin/samples.html"
