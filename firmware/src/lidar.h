#pragma once
#include "common.h"

#define LIDAR_DWORD MMIO_REG(LIDAR_DWORD_ADDRESS)

#define LIDAR_IS_READY(word) ((bool_t)((word) >> 31))
#define LIDAR_GET_X(word) ((word_t)(((word) >> 10) & 0x3FFu))
#define LIDAR_GET_Y(word) ((word_t)((word) & 0x3FFu))
#define LIDAR_GET_N(word) ((word_t)(((word) >> 20) & 0x3FFu))
