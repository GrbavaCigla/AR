#pragma once

// Types
typedef unsigned char byte_t;
typedef unsigned short word_t;
typedef unsigned int dword_t;
typedef signed char sbyte_t;
typedef signed short sword_t;
typedef signed int sdword_t;
typedef byte_t bool_t;

// General
#define MMIO_REG(addr) (*((volatile dword_t*)(addr)))

#define BUSY_WAIT(count)                            \
    do {                                            \
        volatile register dword_t i asm("a0") = (count); \
        while (i--)                                 \
            ;                                       \
    } while (0)

// LiDAR
#define LIDAR_DWORD_ADDRESS ((dword_t)0x10000000)

// VGA
#define VGA_DWORD_ADDRESS ((dword_t)0x20000000)
