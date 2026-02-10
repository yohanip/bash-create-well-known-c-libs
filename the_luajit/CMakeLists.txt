cmake_minimum_required(VERSION 3.28)

project(the_lua_jit C)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_BUILD_RPATH_USE_ORIGIN ON)
set(CMAKE_INSTALL_RPATH "$ORIGIN/../lib")

add_library(luajit
    # core
    source/src/lib_base.c
    source/src/lib_math.c
    source/src/lib_bit.c
    source/src/lib_string.c
    source/src/lib_table.c
	source/src/lib_io.c
    source/src/lib_os.c
    source/src/lib_package.c
    source/src/lib_debug.c
    source/src/lib_jit.c
    source/src/lib_ffi.c
	source/src/lib_buffer.c
    # lj_core
    source/src/lj_assert.c
    source/src/lj_gc.c
    source/src/lj_err.c
    source/src/lj_char.c
    source/src/lj_bc.c
    source/src/lj_obj.c
    source/src/lj_buf.c
    source/src/lj_str.c
    source/src/lj_tab.c
    source/src/lj_func.c
    source/src/lj_udata.c
    source/src/lj_meta.c
    source/src/lj_debug.c
    source/src/lj_prng.c
    source/src/lj_state.c
    source/src/lj_dispatch.c
    source/src/lj_vmevent.c
    source/src/lj_vmmath.c
    source/src/lj_strscan.c
    source/src/lj_strfmt.c
    source/src/lj_strfmt_num.c
    source/src/lj_serialize.c
    source/src/lj_api.c
    source/src/lj_profile.c
    source/src/lj_lex.c
    source/src/lj_parse.c
    source/src/lj_bcread.c
    source/src/lj_bcwrite.c
    source/src/lj_load.c
    source/src/lj_ir.c
    source/src/lj_opt_mem.c
    source/src/lj_opt_fold.c
    source/src/lj_opt_narrow.c
    source/src/lj_opt_dce.c
    source/src/lj_opt_loop.c
    source/src/lj_opt_split.c
    source/src/lj_opt_sink.c
    source/src/lj_mcode.c
    source/src/lj_snap.c
    source/src/lj_record.c
    source/src/lj_crecord.c
    source/src/lj_ffrecord.c
    source/src/lj_asm.c
    source/src/lj_trace.c
    source/src/lj_gdbjit.c
    source/src/lj_ctype.c
    source/src/lj_cdata.c
    source/src/lj_cconv.c
    source/src/lj_ccall.c
    source/src/lj_ccallback.c
    source/src/lj_carith.c
    source/src/lj_clib.c
    source/src/lj_cparse.c
    source/src/lj_lib.c
    source/src/lj_alloc.c
    source/src/lib_aux.c
    source/src/lib_init.c
)

install(TARGETS luajit)

target_include_directories(luajit PUBLIC source/src)

if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    target_compile_definitions(luajit PUBLIC LUA_BUILD_AS_DLL)
endif()

target_compile_definitions(luajit PUBLIC LUAJIT_ENABLE_LUA52COMPAT)

if(ANDROID OR EMSCRIPTEN)
    target_compile_definitions(luajit PUBLIC
        LUAJIT_DISABLE_FFI
    )
endif()

if(WIN32 OR LINUX)
    set(the_libs
        luajit
        m
    )

    if(NOT LINUX)
        list(REMOVE_ITEM the_libs m)
    endif()
    
    add_executable(minilua
        source/src/host/minilua.c
    )

    target_link_libraries(minilua ${the_libs})
    target_include_directories(minilua PUBLIC source/src)
    
    add_executable(buildvm
        source/src/host/buildvm.c
        source/src/host/buildvm_asm.c
        source/src/host/buildvm_peobj.c
	    source/src/host/buildvm_lib.c
        source/src/host/buildvm_fold.c
    )

    target_link_libraries(buildvm ${the_libs})
    target_include_directories(buildvm PUBLIC source/src)

    install(TARGETS minilua buildvm)
endif()



