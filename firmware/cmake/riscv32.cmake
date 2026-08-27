set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR riscv32)

find_program(RISCV_ELF_GCC "riscv64-unknown-elf-gcc")

if(RISCV_ELF_GCC)
    set(TOOLCHAIN_PREFIX "riscv64-unknown-elf-" CACHE STRING "RISC-V toolchain prefix")
else()
    set(TOOLCHAIN_PREFIX "riscv64-linux-gnu-" CACHE STRING "RISC-V toolchain prefix")
endif()

set(CMAKE_C_COMPILER "${TOOLCHAIN_PREFIX}gcc")
set(CMAKE_OBJCOPY "${TOOLCHAIN_PREFIX}objcopy")

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)