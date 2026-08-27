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
#define MMIO_REG(addr) (*((volatile dword_t *)(addr)))

// LiDAR
#define LIDAR_START_ADDRESS ((dword_t)0x00000000)
#define LIDAR_DWORD_ADDRESS LIDAR_START_ADDRESS + ((dword_t)0x00000000)

// VGA
#define VGA_START_ADDRESS ((dword_t)0x00000000)
