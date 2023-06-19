cmake_minimum_required(VERSION 3.13)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

include(./lib/pico-sdk/pico_sdk_init.cmake)

project(BaseProject C CXX ASM)

pico_sdk_init()

add_executable(BaseProject
    src/main.c
)

target_link_libraries(BaseProject
    pico_stdlib
)

# add_subdirectory(lib)
# add_subdirectory(src)

pico_add_extra_outputs(BaseProject)