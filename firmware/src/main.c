#include "common.h"
#include "lidar.h"
#include "vga.h"

#define BUFFERING 1

void vga_clear()
{
    for (register dword_t x = 0; x < 800; x++) {
        for (register dword_t y = 0; y < 600; y++) {
            VGA_WRITE_PIXEL(x, y, 0);
        }
    }
}

void main(void)
{
    vga_clear();
    VGA_SWAP();
    vga_clear();

    register dword_t counter = 0, last_n = 0xFFFF;
    register dword_t x, y, n;
    while (1) {
        register dword_t word = LIDAR_DWORD;

        if (!LIDAR_IS_READY(word))
            continue;

        n = LIDAR_GET_N(word);
        if (last_n == n)
            continue;

        last_n = n;

        counter++;
        x = LIDAR_GET_X(word);
        y = LIDAR_GET_Y(word);
        VGA_WRITE_PIXEL(x, y, 1);

#if BUFFERING == 1
        if (counter >= 2000) {
            VGA_SWAP();
            vga_clear();
#elif BUFFERING == 0
        if (counter >= 4000) {
            VGA_SWAP();
#endif
            counter = 0;
        }
    }
}