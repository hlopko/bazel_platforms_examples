# Example 02: Targetting Linux or Windows

Command:

```
bazel build //examples/02_linux_or_windows:a --platforms=//:linux_platform
bazel build //examples/02_linux_or_windows:a --platforms=//:windows_platform
```

Output:

```
# 1)
yolo_library(
  name = 'a',
  toolchain = {
    'targetting_cpu': '-',
    'targetting_os': 'linux',
    'executing_on_cpu': '-',
    'executing_on_os': 'linux',
  },
)

# 2)
yolo_library(
  name = 'a',
  toolchain = {
    'targetting_cpu': '-',
    'targetting_os': 'windows',
    'executing_on_cpu': '-',
    'executing_on_os': 'linux',
  },
)
```

Here we tell Bazel that we want to build `//examples/02_linux_or_windows:a`
first for linux, then second for windows. Both of these times we want to execute
on linux (note the call to `register_execution_platforms` in the `WORKSPACE`
file).

We see that toolchains used to build the library changed between Bazel
invocations.
