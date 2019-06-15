# This package contains rule definitions for Yolo-lang

# Toolchain type is used to distinguish toolchains per languages.
#
# By convention, toolchain_type targets are named "toolchain_type" and
# distinguished by their package path. So the full path for this would be
# //yolo:toolchain_type.
load("//yolo:defs.bzl", "yolo_toolchain", "yolo_library")

toolchain_type(name = "toolchain_type")

yolo_library(
    name = "a",
)

toolchain(
    name = "host_toolchain",
    exec_compatible_with = [],
    target_compatible_with = [],
    toolchain = ":host_yolo_toolchain",
    toolchain_type = ":toolchain_type",
)

yolo_toolchain(
    name = "host_yolo_toolchain",
    targetting_cpu = "host",
    targetting_os = "host",
    executing_on_cpu = "host",
    executing_on_os = "host",
)

