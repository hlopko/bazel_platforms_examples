#!/bin/bash

set -euo pipefail

_BAZEL_BINARY="${BAZEL_BINARY:-"bazel"}"

function b() {
  $_BAZEL_BINARY build $@
}

b //examples/01_hello_world:a
b //examples/02_using_different_platforms:a --platforms=//:linux_platform
b //examples/02_using_different_platforms:a --platforms=//:windows_platform
b //examples/03_target_not_compatible_with_constraint:a --platforms=//:linux_platform
b //examples/03_target_not_compatible_with_constraint:b --platforms=//:linux_platform && (exit 15) || true
