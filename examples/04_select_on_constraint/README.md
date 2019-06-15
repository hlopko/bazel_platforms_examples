# Example 04: Select on constraint

Command:

```
bazel build //examples/04_select_on_constraint:a --platforms=//:linux_platform
bazel build //examples/04_select_on_constraint:a --platforms=//:windows_platform
bazel build //examples/04_select_on_constraint:a --platforms=//:android_platform
```

Output:

```
# 1)
yolo_library(
  name = 'a_linux',
  toolchain = {
    'targetting_cpu': '-',
    'targetting_os': 'linux',
    'executing_on_cpu': '-',
    'executing_on_os': 'linux',
  },
)

# 2)
yolo_library(
  name = 'a_windows',
  toolchain = {
    'targetting_cpu': '-',
    'targetting_os': 'windows',
    'executing_on_cpu': '-',
    'executing_on_os': 'linux',
  },
)

# 3)
.../examples/04_select_on_constraint/BUILD:6:14:
  Configurable attribute "actual" doesn't match this configuration (would a default condition help?).
Conditions checked:
 //examples/04_select_on_constraint:is_windows
 //examples/04_select_on_constraint:is_linux
```

In this example we wanted select a specialized target depending on the operating
system. We again used
[`alias`](https://docs.bazel.build/versions/master/be/general.html#alias) and
[`select`](https://docs.bazel.build/versions/master/be/functions.html#select).
