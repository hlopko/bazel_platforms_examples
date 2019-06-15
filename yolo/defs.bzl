def _yolo_toolchain_to_string(yolo_toolchain):
    return "YoloInfo(targetting_cpu: '{}', targetting_os: '{}', executing_on_cpu: '{}', executing_on_os: '{}')".format(
        yolo_toolchain.targetting_cpu,
        yolo_toolchain.targetting_os,
        yolo_toolchain.executing_on_cpu,
        yolo_toolchain.executing_on_os,
    )

def _yolo_library_impl(ctx):
    yolo_toolchain = ctx.toolchains["//yolo:toolchain_type"]
    print("YOLO_LIBRARY(name = '{}', toolchain = '{}')".format(ctx.attr.name, _yolo_toolchain_to_string(yolo_toolchain)))
    return []

yolo_library = rule(
    implementation = _yolo_library_impl,
    toolchains = ["//yolo:toolchain_type"],
)

def _yolo_toolchain_impl(ctx):
    toolchain_info = platform_common.ToolchainInfo(
        targetting_cpu = ctx.attr.targetting_cpu,
        targetting_os = ctx.attr.targetting_os,
        executing_on_cpu = ctx.attr.executing_on_cpu,
        executing_on_os = ctx.attr.executing_on_os,
    )
    return [toolchain_info]

yolo_toolchain = rule(
    implementation = _yolo_toolchain_impl,
    attrs = {
        "targetting_cpu": attr.string(),
        "targetting_os": attr.string(),
        "executing_on_cpu": attr.string(),
        "executing_on_os": attr.string(),
    },
)
