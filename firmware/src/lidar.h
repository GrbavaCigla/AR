#pragma once
#include "common.h"

#define LIDAR_DWORD MMIO_REG(LIDAR_DWORD_ADDRESS)

#define LIDAR_IS_READY(word) ((bool_t)(((word) >> 31) & 0x1))
#define LIDAR_GET_X(word) ((word_t)((word) & 0x3FF))
#define LIDAR_GET_Y(word) ((word_t)(((word) >> 10) & 0x3FF))