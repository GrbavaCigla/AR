#pragma once
#include "common.h"

#define LIDAR_DWORD MMIO_REG(LIDAR_DWORD_ADDRESS)

// Flags
#define LIDAR_READY_BIT ((dword_t)1 << 31)

// Helpers
#define LIDAR_IS_READY(word) ((bool_t)(((word) & LIDAR_READY_BIT) != 0))
#define LIDAR_GET_X(word) ((word_t)((word) & 0x3FFu))
#define LIDAR_GET_Y(word) ((word_t)(((word) >> 10) & 0x3FFu))