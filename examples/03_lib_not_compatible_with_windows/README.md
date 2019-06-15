# Example 03: Library not compatible with Windows

Command:

```
bazel build //examples/03_lib_not_compatible_with_windows:a --platforms=//:linux_platform
bazel build //examples/03_lib_not_compatible_with_windows:a --platforms=//:windows_platform
```

Output:

```
# 1)
yolo_library(
  name = 'a_unsafe',
  toolchain = {
    'targetting_cpu': '-',
    'targetting_os': 'linux',
    'executing_on_cpu': '-',
    'executing_on_os': 'linux',
  },
)

# 2)
Traceback (most recent call last):
	File "/home/mhlopko/projects/bazel_platforms_examples/examples/03_lib_not_compatible_with_windows/BUILD", line 17
		fail_with_msg(name = 'fail')
	File "/home/mhlopko/projects/bazel_platforms_examples/yolo/defs.bzl", line 42, in _fail_with_msg
		fail((((ctx.attr.msg + " Selected too..."))
Library 'a' is not compatible with windows. Selected toolchain: struct(executing_on_cpu = "-", executing_on_os = "linux", targetting_cpu = "-", targetting_os = "windows").
```

Here we tell Bazel that we want to build `//examples/02_linux_or_windows:a`
first for linux, then second for windows. Both of these times we want to execute
on linux (note the call to `register_execution_platforms` in the `WORKSPACE`
file).

We see that toolchains used to build the library changed between Bazel
invocations.
