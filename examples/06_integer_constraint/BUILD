load("//yolo:defs.bzl", "yolo_library", "fail_with_msg")
load("@bazel_skylib//lib:selects.bzl", "selects")
package(default_visibility = ["//visibility:private"])

alias(
    name = "a",
    actual = select({
        ":yolo_lang_greater_or_equal_than_2": ":a_needs_greater_or_equal_than_2",
    }),
    visibility = ["//visibility:public"],
)

selects.config_setting_group(
    name = "yolo_lang_greater_or_equal_than_2",
    match_any = [":yolo_lang_2", ":yolo_lang_3"],
)

config_setting(
    name = "yolo_lang_1",
    constraint_values = ["//yolo:yolo_lang_1"],
)

config_setting(
    name = "yolo_lang_2",
    constraint_values = ["//yolo:yolo_lang_2"],
)

config_setting(
    name = "yolo_lang_3",
    constraint_values = ["//yolo:yolo_lang_3"],
)

yolo_library(
    name = "a_needs_greater_or_equal_than_2",
)

