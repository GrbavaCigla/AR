cmake_minimum_required(VERSION 3.31.6)

project(lidarko LANGUAGES C)

set(SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src")
set(TOOLS_DIR "${CMAKE_CURRENT_SOURCE_DIR}/tools")
set(LINKER_FILE "${CMAKE_CURRENT_SOURCE_DIR}/linker.ld")
set(BIN_OUT "${CMAKE_CURRENT_BINARY_DIR}/firmware.bin")
set(MIF_OUT "${CMAKE_CURRENT_BINARY_DIR}/instructions.mif")
set(MEMORY_DEPTH 1024 CACHE STRING "MIF memory depth")

file(GLOB_RECURSE C_SOURCES CONFIGURE_DEPENDS "${SOURCE_DIR}/*.c")

add_executable(firmware ${C_SOURCES})

target_include_directories(firmware PRIVATE
    "${SOURCE_DIR}"
)

target_compile_options(firmware PRIVATE
    -O2
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
    OUTPUT "${BIN_OUT}"
    COMMAND "${CMAKE_OBJCOPY}"
            -O binary
            "$<TARGET_FILE:firmware>"
            "${BIN_OUT}"
    DEPENDS firmware
    VERBATIM
)

add_custom_target(firmware_bin
    DEPENDS "${BIN_OUT}"
)

include(ExternalProject)

ExternalProject_Add(bin2mif_project
    SOURCE_DIR "${TOOLS_DIR}"
    BINARY_DIR "${CMAKE_CURRENT_BINARY_DIR}/bin2mif"
    INSTALL_COMMAND ""
)

set(BIN2MIF
    "${CMAKE_CURRENT_BINARY_DIR}/bin2mif/bin2mif${CMAKE_EXECUTABLE_SUFFIX}"
)

add_custom_command(
    OUTPUT "${MIF_OUT}"
    COMMAND "${BIN2MIF}"
            "${BIN_OUT}"
            "${MIF_OUT}"
            "${MEMORY_DEPTH}"
    DEPENDS
        "${BIN_OUT}"
        bin2mif_project
    VERBATIM
)

add_custom_target(mif ALL
    DEPENDS "${MIF_OUT}"
)

add_custom_command(
    TARGET mif POST_BUILD
    COMMAND "${CMAKE_COMMAND}" -E copy_if_different
            "${MIF_OUT}"
            "${CMAKE_CURRENT_SOURCE_DIR}/../riscv32i processor/InstructionMemory/InicializationData.mif"
    VERBATIM
)
