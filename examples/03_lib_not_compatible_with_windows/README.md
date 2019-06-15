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
	File ".../examples/03_lib_not_compatible_with_windows/BUILD", line 17
		fail_with_msg(name = 'fail')
	File ".../yolo/defs.bzl", line 42, in _fail_with_msg
		fail((((ctx.attr.msg + " Selected too..."))
Library 'a' is not compatible with windows.
Selected toolchain: struct(executing_on_cpu = "-", executing_on_os = "linux", targetting_cpu = "-", targetting_os = "windows").
```

In this example we wanted to make sure that nobody will build our library on
Windows. We used a combination of
[`alias`](https://docs.bazel.build/versions/master/be/general.html#alias) rule
and
[`select`](https://docs.bazel.build/versions/master/be/functions.html#select).
We used
[`config_setting.constraint_values`](https://docs.bazel.build/versions/master/be/general.html#config_setting.constraint_values)
attribute to select on constraint values of the currently used platform. When
the corresponding branch of the select was taken, we fail the build using a
simple `fail_with_msg` rule that we added into `//yolo:defs.bzl`. And we made
our original library private, and only made the alias public.
