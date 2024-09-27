ENTRY(_start);
OUTPUT_FORMAT(elf32-i386);

MEMORY
{
    X86 (rx)  : ORIGIN = 0 , LENGTH = 1M
    RAM (rwx) : ORIGIN = 1M, LENGTH = 1M
}

PHDRS
{
    /* header PT_NULL FILEHDR;
    text PT_NULL PHDRS;
    data PT_NULL FILEHDR; */
}

SECTIONS /*top level command that declares a list of custom program sections, ld provides set of such instructions.*/
{
    /* . = 1M; */
    .text : ALIGN(0x1000) {
        /* link the multiboot struct here */
        /* . = ALIGN(8); */
        KEEP(*(.multiboot*))
        *(.text*)
    } >RAM
    /* :code */
    .rodata ALIGN (0x1000) : {
        *(.rodata*)
    } >RAM
    .data ALIGN (0x1000) : {
        *(.data*)
    } >RAM
    .bss ALIGN (0x1000) : {
        *(COMMON*)
        *(.bss*)
    } >RAM
    /DISCARD/ : {
        *(.interp)
        *(.dynsym)
        *(.dynstr)
        *(.hash)
        *(.gnu.hash)
        *(.header)
        /*  */
        *(.note*)
        *(.comment*)
        *(.debug*)
        *(.dynamic*)
        *(.rel*)
        /* *(.got*) */
    } : phdr
}
