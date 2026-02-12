cmake_minimum_required(VERSION 3.28)

project(the_lua_jit C)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)

add_subdirectory(external/raylib-nuklear)

add_library(raylib_nuke
    main.c
)

target_link_libraries(raylib_nuke raylib_nuklear)
target_include_directories(raylib_nuke PUBLIC external/raylib/src)

install(TARGETS raylib_nuke)


