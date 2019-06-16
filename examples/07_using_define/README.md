# Example 07: Using --define

Command:

```
bazel build //examples/07_using_define:everything
bazel build //examples/07_using_define:everything --define is_foo_defined=true
```

Output:

```
# 1)
yolo_library(
  name = 'a',
  toolchain = {
    'targetting_cpu': 'host',
    'targetting_os': 'host',
    'executing_on_cpu': 'host',
    'executing_on_os': 'host',
  },
)

# 2)
yolo_library(
  name = 'only_with_foo',
  toolchain = {
    'targetting_cpu': 'host',
    'targetting_os': 'host',
    'executing_on_cpu': 'host',
    'executing_on_os': 'host',
  },
)
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

Here we have a simple example how to use
[`--define`](https://docs.bazel.build/versions/master/command-line-reference.html#flag--define).
`--define` is one of the simplest configurability mechanism in Bazel, it's also
one of the oldest and least expressive.

`--define` is typically used when more sophistication is not needed. It should
not be used for toolchain selection, and for configuring the build with that
logically belongs platforms and constraints.


