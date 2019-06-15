# Example 06: Matching multiple constraints

Command:

```
bazel build //examples/06_integer_constraint:a --platforms=//:linux_platform 
bazel build //examples/06_integer_constraint:a --platforms=//:linux_yolo_3_platform --host_platform=//:linux_yolo_3_platform
```

Output:

```
# 1)
.../examples/06_integer_constraint/BUILD:7:14:
  Configurable attribute "actual" doesn't match this configuration (would a default condition help?).
Conditions checked:
 //examples/06_integer_constraint:yolo_lang_3

# 2)
yolo_library(
  name = 'a_needs_greater_or_equal_than_2',
  toolchain = {
    'targetting_cpu': '-',
    'targetting_os': 'linux_with_yolo_lang_3',
    'executing_on_cpu': '-',
    'executing_on_os': 'linux_with_yolo_lang_3',
  },
)
```

In this example we show how to emulate greater-than and less-than using selects.
We make use of [skylib](https://github.com/bazelbuild/bazel-skylib)'s
[selects](https://github.com/bazelbuild/bazel-skylib/blob/master/lib/selects.bzl)
module. 

Similar mechanism can be used to express hierarchical constraints. We can
have a select that encodes that 'haswell' CPU implies 'SSE':

```
selects.config_setting_group(
    name = "has_sse",
    match_any = ["//cpu_extensions:sse3", "//cpu:haswell", ...],
)
```

Or a select that encodes that ubuntu is a linux:

```
selects.config_setting_group(
    name = "has_sse",
    match_any = ["//distributions:ubuntu", "@platforms//os:linux", ...],
)
```
