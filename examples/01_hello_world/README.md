# Example 01: Hello World

Command:

```
bazel build //examples/01_hello_world:a
```

Output:

```
yolo_library(
  name = 'a',
  toolchain = {
    'targetting_cpu': 'host',
    'targetting_os': 'host',
    'executing_on_cpu': 'host',
    'executing_on_os': 'host',
  },
)
```

Here Bazel selects the first toolchain that matches the default value of the
`--platform` option, which is `@local_config_platform//:host`. Our toolchain
`//yolo:host_toolchain` has exactly the same constraints, so Bazel selected it.
