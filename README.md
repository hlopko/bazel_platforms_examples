# Bazel Platforms Examples

This repo contains a collection of examples demonstrating how to use various
Bazel concepts related to
[platforms](https://docs.bazel.build/versions/master/platforms.html),
[toolchains](https://docs.bazel.build/versions/master/toolchains.html),
[configurations](https://docs.bazel.build/versions/master/skylark/config.html),
and [configurable
attributes](https://docs.bazel.build/versions/master/configurable-attributes.html).

It also tries to give guidance when each of these concepts is used and should
accompany documentation on [bazel.build](https://bazel.build).

## Structure

```
\
  WORKSPACE   
  examples\   # Examples using Yolo-lang rules
  yolo\       # Yolo-lang rules definition
```

`Yolo-lang` here is obviously not a real programming language, it's just a
simple implementation of Bazel Starlark rules that is meant to demonstrate
examples without confusing us with technical details.
