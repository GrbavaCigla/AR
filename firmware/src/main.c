#include "common.h"
#include "vga.h"
#include "lidar.h"

void _start(void) {
    while (1) {
        dword_t raw;

        do {
            raw = LIDAR_DWORD;
        } while (!LIDAR_IS_READY(raw));

        register word_t x = LIDAR_GET_X(raw);
        register word_t y = LIDAR_GET_Y(raw);
        
        // TODO: Send to VGA
    }
}