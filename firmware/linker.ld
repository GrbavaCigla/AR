ENTRY(_start)
PHDRS
{
    text PT_LOAD FLAGS(5);
    data PT_LOAD FLAGS(6);
}
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