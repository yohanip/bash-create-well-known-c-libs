cmake_minimum_required(VERSION 3.28)

project(the_wren C)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_BUILD_RPATH_USE_ORIGIN ON)
set(CMAKE_INSTALL_RPATH "$ORIGIN/../lib")

add_library(wren
    source/vm/wren_compiler.c
    source/vm/wren_core.c
    source/vm/wren_debug.c
    source/vm/wren_primitive.c
    source/vm/wren_utils.c
    source/vm/wren_value.c
    source/vm/wren_vm.c
    source/optional/wren_opt_meta.c
    source/optional/wren_opt_random.c
)

target_include_directories(wren PUBLIC 
    source/include
    source/optional
    source/vm
)

install(TARGETS wren)


