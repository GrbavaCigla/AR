ENTRY(_start)

MEMORY
{
    ROM   (rx)  : ORIGIN = 0x00000000, LENGTH = 4K
    SDRAM (rwx) : ORIGIN = 0x00000000, LENGTH = 16M
}

_stack_top = 0x02000000;

SECTIONS
{
    .text : {
        *(.text._start)
        *(.text*)
        *(.rodata*)
    } > ROM
    .data : {
        *(.data*)
    } > SDRAM
    .bss : {
        *(.bss*)
        *(.sbss*)
        *(COMMON)
    } > SDRAM
    /DISCARD/ : {
        *(.comment)
        *(.note*)
        *(.eh_frame)
    }
}
