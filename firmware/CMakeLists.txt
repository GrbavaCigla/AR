cmake_minimum_required(VERSION 4.3.0)
project(lidarko LANGUAGES C)

set(CMAKE_SYSTEM_NAME Generic)

set(TOOLCHAIN_PREFIX "riscv64-linux-gnu-" CACHE STRING "Toolchain prefix")
set(SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src")
set(LINKER_FILE "${CMAKE_CURRENT_SOURCE_DIR}/linker.ld")
set(BIN_OUT "${CMAKE_CURRENT_BINARY_DIR}/firmware.bin")

set(CMAKE_C_COMPILER "${TOOLCHAIN_PREFIX}gcc")
set(CMAKE_OBJCOPY "${TOOLCHAIN_PREFIX}objcopy")

file(GLOB_RECURSE C_SOURCES "${SOURCE_DIR}/*.c")
file(GLOB_RECURSE C_HEADERS "${SOURCE_DIR}/*.h")

add_executable(firmware ${C_SOURCES} ${C_HEADERS})
target_include_directories(firmware PRIVATE ${SOURCE_DIR})
target_compile_options(firmware PRIVATE
    -march=rv32i
    -mabi=ilp32
    -nostdlib
    -ffreestanding
)

target_link_options(firmware PRIVATE
    -T "${LINKER_FILE}"
    -nostdlib
    -Wl,-m,elf32lriscv
)

add_custom_command(
    TARGET firmware POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O binary $<TARGET_FILE:firmware> ${BIN_OUT}
    COMMENT "Extracting flat binary to ${BIN_OUT} (starts at instruction 0x0)"
)
