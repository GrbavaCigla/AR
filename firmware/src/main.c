#include "common.h"
#include "lidar.h"
#include "vga.h"

void _start(void) {
    register bool_t previous_half = 0;

    while (1) {
        register dword_t raw;

        do {
            raw = LIDAR_DWORD;
        } while (!LIDAR_IS_READY(raw));

        register word_t x = LIDAR_GET_X(raw);
        register word_t y = LIDAR_GET_Y(raw);
        register bool_t current_half = (y >= 240);

        (previous_half && !current_half) && VGA_SWAP();
        previous_half = current_half;

        VGA_WRITE_PIXEL(x, y, 1);
    }
}