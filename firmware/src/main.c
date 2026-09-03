#include "common.h"
#include "vga.h"
#include "lidar.h"

void main(void)
{
    register dword_t i = 0, lidar;
    while (1) {
        lidar = LIDAR_DWORD;

        VGA_WRITE_PIXEL(LIDAR_GET_X(lidar), LIDAR_GET_Y(lidar), 1);

        i++;
        if (i > 24) {
            i = 0;
            VGA_SWAP();
        }
    }
}