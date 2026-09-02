#pragma once
#include "common.h"

#define VGA_DWORD MMIO_REG(VGA_DWORD_ADDRESS)

// Flags
#define VGA_SET_BIT_BIT ((dword_t)1 << 31)
#define VGA_SWAP_BIT ((dword_t)1 << 30)

// Helpers
#define VGA_X(x) ((dword_t)(x) & 0x3FFu)
#define VGA_Y(y) (((dword_t)(y) & 0x3FFu) << 10)

#define VGA_SWAP() (VGA_DWORD = VGA_SWAP_BIT)
#define VGA_WRITE_PIXEL(x, y, set) \
    (VGA_DWORD = ((set) ? VGA_SET_BIT_BIT : 0) | VGA_X(x) | VGA_Y(y))
