#!/usr/bin/env bash
# Idempotent repository bootstrap for OpenTelemetry C++ Cloud Agents.
set -euo pipefail

ROOT="$(git rev-parse --show-toplevel)"
cd "$ROOT"

SUBMODULES=(
  third_party/googletest
  third_party/benchmark
  third_party/nlohmann-json
  third_party/ms-gsl
)

git submodule update --init --depth 1 "${SUBMODULES[@]}"

echo "OpenTelemetry C++ dependencies ready."
