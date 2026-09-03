.section .text._start
.global _start

_start:
    lui  sp, 0x2000
    jal  ra, main

1:
    jal  x0, 1b
