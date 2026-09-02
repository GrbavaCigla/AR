#include "common.h"
#include "led.h"

void _start(void) {
    while (1) {
        LED_DWORD = 0;
        BUSY_WAIT(25000);
        LED_DWORD = 1;
        BUSY_WAIT(25000);
    }
}