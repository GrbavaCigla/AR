ENTRY(_start)
SECTIONS
{
    . = 0x00000000;
    .text : {
        *(.text._start)
        *(.text*)
        *(.rodata*)
    }
    .data : {
        *(.data*)
    }
    /DISCARD/ : {
        *(.bss*)
        *(.sbss*)
        *(.comment)
        *(.note*)
        *(.eh_frame)
    }
}