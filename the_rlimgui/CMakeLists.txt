cmake_minimum_required(VERSION 3.28)

project(the_wren C CXX)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_BUILD_RPATH_USE_ORIGIN ON)
set(CMAKE_INSTALL_RPATH "$ORIGIN/../lib")

add_library(rlimgui
    rlImGui/rlImGui.cpp
    imgui/imgui_demo.cpp
    imgui/imgui_draw.cpp
    imgui/imgui_tables.cpp
    imgui/imgui_widgets.cpp
    imgui/imgui.cpp
)

if(NOT (CMAKE_BUILD_TYPE STREQUAL "Debug"))
    target_compile_definitions(rlimgui PUBLIC 
        IMGUI_DISABLE_DEMO_WINDOWS
        IMGUI_DISABLE_DEBUG_TOOLS
    )
endif()

target_include_directories(rlimgui PUBLIC 
    raylib/src
    imgui
    rlImGui
)

install(TARGETS rlimgui)


