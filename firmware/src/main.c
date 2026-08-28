#include "common.h"
#include "lidar.h"
#include "vga.h"

#define POINTS_MAX_LENGTH 670

void _start(void) {
    register bool_t previous_half = 0;

    dword_t points[2][POINTS_MAX_LENGTH];

    register bool_t current_buffer = 0;
    register word_t index = 0;
    register word_t point_count_0 = 0;
    register word_t point_count_1 = 0;

    while (1) {
        register dword_t raw;

        do {
            raw = LIDAR_DWORD;
        } while (!LIDAR_IS_READY(raw));

        register word_t x = LIDAR_GET_X(raw);
        register word_t y = LIDAR_GET_Y(raw);
        register bool_t current_half = (y >= 240);

        if (previous_half && !current_half) {
            register word_t new_point_count = index;
            register word_t old_point_count = current_buffer ? point_count_1 : point_count_0;

            while (index < old_point_count) {
                register dword_t old_point = points[current_buffer][index];
                VGA_WRITE_PIXEL(LIDAR_GET_X(old_point), LIDAR_GET_Y(old_point), 0);
                index++;
            }

            if (current_buffer)
                point_count_1 = new_point_count;
            else
                point_count_0 = new_point_count;
            index = 0;
            current_buffer = !current_buffer;
            VGA_SWAP();
        }

        if (index < POINTS_MAX_LENGTH) {
            register word_t old_point_count = current_buffer ? point_count_1 : point_count_0;

            if (index < old_point_count) {
                register dword_t old_point = points[current_buffer][index];
                VGA_WRITE_PIXEL(LIDAR_GET_X(old_point), LIDAR_GET_Y(old_point), 0);
            }

            points[current_buffer][index] = raw;
            VGA_WRITE_PIXEL(x, y, 1);
            index++;
        }

        previous_half = current_half;
    }
}
