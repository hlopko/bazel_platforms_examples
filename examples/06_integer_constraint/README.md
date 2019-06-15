# Example 05: Select on platform

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

In this example we demonstrate that one can also select on bare `--platforms`
option. That's not recommended though:

1) In this example we select on the target platform. When the target that we
   select in is used during the build (= it will be built in the host
   configuration), the select will be incorrect.
2) While `constraint_setting`s and
   `constraint_value`s tend to be universal, like operating system or cpu
   architecture (existence of
   [https://github.com/bazelbuild/platforms](https://github.com/bazelbuild/platforms)
   shows that),
   [`platform`](https://docs.bazel.build/versions/master/be/platform.html#platform)s
   are very project/company specific (e.g. 'description of company servers', 'or
   specific mobile device', or 'development board for IoT development'). If
   there is any possibility that somebody else will use your project, select on
   constraints, not on platforms. By selecting on `--platforms` you'll force
   them to use your idea of platforms, or to fork your repo.
