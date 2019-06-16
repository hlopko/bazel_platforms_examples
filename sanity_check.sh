#!/bin/bash

set -euo pipefail

_BAZEL_BINARY="${BAZEL_BINARY:-"bazel"}"

function b() {
  $_BAZEL_BINARY build $@
}

b //examples/01_hello_world:a
