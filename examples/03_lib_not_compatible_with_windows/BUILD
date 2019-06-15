load("//yolo:defs.bzl", "yolo_library", "fail_with_msg")
package(default_visibility = ["//visibility:private"])

alias(
    name = "a",
    actual = select({
        ":is_windows": ":fail",
        "//conditions:default": ":a_unsafe",
    }),
    visibility = ["//visibility:public"],
)

config_setting(
    name = "is_windows",
    constraint_values = ["@platforms//os:windows"],
)

fail_with_msg(
    name = "fail",
    msg = "Library 'a' is not compatible with windows.",
)

yolo_library(
    name = "a_unsafe",
)

