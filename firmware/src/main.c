#include "common.h"
#include "vga.h"

void main(void)
{
    register dword_t lidar, i, bit;

    volatile dword_t ram;
    ram = ((dword_t)1 << 31);
    BUSY_WAIT(0x00FFFFFF);
    lidar = ram;

    for (register byte_t i = 0; i < 16; i++) {
        VGA_WRITE_PIXEL(i * 2 + 100, 100, 1);
    }
    for (register byte_t i = 0; i < 16; i++) {
        VGA_WRITE_PIXEL(i * 2 + 101, 101, 1);
    }

    for (i = 0; i < 32; i++) {
        bit = (lidar >> (31 - i)) & 1;
        VGA_WRITE_PIXEL(100 + i, 103, bit);
    }

    VGA_SWAP();
}
