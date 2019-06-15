# This package contains rule definitions for Yolo-lang.

load("//yolo:defs.bzl", "yolo_toolchain", "yolo_library")
# @local_config_platform is autodetecting host platform and generating relevant
# constraints.
load("@local_config_platform//:constraints.bzl", "HOST_CONSTRAINTS")

# Toolchain type is used to distinguish toolchains per languages.
#
# By convention, toolchain_type targets are named "toolchain_type" and
# distinguished by their package path. So the full path for this would be
# //yolo:toolchain_type.
toolchain_type(name = "toolchain_type")

# Toolchain that targets Linux, and executes on Linux.
toolchain(
    name = "linux_toolchain",
    exec_compatible_with = ["@platforms//os:linux"],
    target_compatible_with = ["@platforms//os:linux"],
    toolchain = ":linux_yolo_toolchain",
    toolchain_type = ":toolchain_type",
)

yolo_toolchain(
    name = "linux_yolo_toolchain",
    targetting_cpu = "-",
    targetting_os = "linux",
    executing_on_cpu = "-",
    executing_on_os = "linux",
)

# Toolchain that targets Windows, and executes on Linux.
toolchain(
    name = "windows_toolchain",
    exec_compatible_with = ["@platforms//os:linux"],
    target_compatible_with = ["@platforms//os:windows"],
    toolchain = ":windows_yolo_toolchain",
    toolchain_type = ":toolchain_type",
)

yolo_toolchain(
    name = "windows_yolo_toolchain",
    targetting_cpu = "-",
    targetting_os = "windows",
    executing_on_cpu = "-",
    executing_on_os = "linux",
)

# Naive toolchain that targets and executes on the current host platforms as
# autodetected by Bazel.
toolchain(
    name = "host_toolchain",
    exec_compatible_with = HOST_CONSTRAINTS,
    target_compatible_with = HOST_CONSTRAINTS,
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

