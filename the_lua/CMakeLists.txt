cmake_minimum_required(VERSION 3.28)

project(the_lua C)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_BUILD_RPATH_USE_ORIGIN ON)
set(CMAKE_INSTALL_RPATH "$ORIGIN/../lib")

add_library(lua
    # core
    source/lapi.c 
    source/lcode.c 
    source/lctype.c 
    source/ldebug.c 
    source/ldo.c 
    source/ldump.c 
    source/lfunc.c 
    source/lgc.c 
    source/llex.c
	source/lmem.c 
    source/lobject.c 
    source/lopcodes.c 
    source/lparser.c 
    source/lstate.c 
    source/lstring.c 
    source/ltable.c
	source/ltm.c 
    source/lundump.c 
    source/lvm.c 
    source/lzio.c 
    # source/ltests.c
    # aux
    source/lauxlib.c
    # lib
    source/lbaselib.c
    source/ldblib.c
    source/liolib.c
    source/lmathlib.c
    source/loslib.c
    source/ltablib.c
    source/lstrlib.c
	source/lutf8lib.c
    source/loadlib.c
    source/lcorolib.c
    source/linit.c
)

if(LINUX OR WIN32)
    set(the_libs
        lua
        m
    )

    if(LINUX)
        add_compile_definitions(
            LUA_USE_LINUX
        )
    else()
        add_compile_definitions(
            LUA_USE_WINDOWS
        )
        list(REMOVE_ITEM the_libs m)
    endif()

    # message(FATAL_ERROR ${the_libs})

    # instal lua-repl and lib
    add_executable(lua_exe source/lua.c)
    target_link_libraries(lua_exe PRIVATE ${the_libs})
    target_include_directories(lua_exe PRIVATE source)
    set_target_properties(lua_exe PROPERTIES OUTPUT_NAME lua)

    install(TARGETS lua lua_exe)
else()
    # install only the lib
    install(TARGETS lua)
endif()


