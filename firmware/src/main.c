#include "common.h"
#include "lidar.h"
#include "vga.h"

#define MODE_FRAME 0
#define MODE_NONE 1
#define MODE_COUNT 2

#define MODE MODE_FRAME

#define WIDTH 800
#define HEIGHT 600

#define POINTS_PER_FRAME 2000
#define LENGTH 4000

#if MODE == MODE_COUNT
static dword_t buffer[LENGTH];
static dword_t pixel_count[HEIGHT][WIDTH];
#endif

void vga_clear(void)
{
    for (dword_t x = 0; x < WIDTH; x++) {
        for (dword_t y = 0; y < HEIGHT; y++) {
            VGA_WRITE_PIXEL(x, y, 0);
        }
    }
}

void main(void)
{
#if MODE == MODE_COUNT
    for (dword_t y = 0; y < HEIGHT; y++) {
        for (dword_t x = 0; x < WIDTH; x++) {
            pixel_count[y][x] = 0;
        }
    }
#endif

    vga_clear();
    VGA_SWAP();
    vga_clear();

    dword_t last_n = 0xFFFFFFFF;

#if MODE == MODE_FRAME
    dword_t counter = 0;
#elif MODE == MODE_COUNT
    dword_t counter = 0;
    dword_t head = 0;
#endif

    while (1) {
        dword_t word = LIDAR_DWORD;

        if (!LIDAR_IS_READY(word))
            continue;

        dword_t n = LIDAR_GET_N(word);

        if (n == last_n)
            continue;

        last_n = n;

        dword_t x1 = LIDAR_GET_X(word);
        dword_t y1 = LIDAR_GET_Y(word);

        if (x1 >= WIDTH || y1 >= HEIGHT)
            continue;

#if MODE == MODE_FRAME

        VGA_WRITE_PIXEL(x1, y1, 1);

        counter++;
        if (counter == POINTS_PER_FRAME) {
            counter = 0;
            VGA_SWAP();     /* show the finished frame */
            vga_clear();    /* wipe the new back buffer */
        }

#elif MODE == MODE_NONE

        VGA_WRITE_PIXEL(x1, y1, 1);
        VGA_SWAP();
        VGA_WRITE_PIXEL(x1, y1, 1);

#elif MODE == MODE_COUNT

        dword_t x0 = 0;
        dword_t y0 = 0;
        dword_t had_old = (counter == LENGTH);

        dword_t draw_new = (pixel_count[y1][x1] == 0);

        if (had_old) {
            dword_t old = buffer[head];

            x0 = LIDAR_GET_X(old);
            y0 = LIDAR_GET_Y(old);

            pixel_count[y0][x0]--;
        } else {
            counter++;
        }

        buffer[head] = word;
        pixel_count[y1][x1]++;

        dword_t erase_old = (had_old && pixel_count[y0][x0] == 0);

        if (erase_old || draw_new) {
            if (erase_old)
                VGA_WRITE_PIXEL(x0, y0, 0);

            if (draw_new)
                VGA_WRITE_PIXEL(x1, y1, 1);

            VGA_SWAP();

            if (erase_old)
                VGA_WRITE_PIXEL(x0, y0, 0);

            if (draw_new)
                VGA_WRITE_PIXEL(x1, y1, 1);
        }

        head++;
        if (head == LENGTH)
            head = 0;

#endif
    }
}