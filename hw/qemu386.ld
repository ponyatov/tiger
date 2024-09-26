ENTRY(_start);

PHDRS
{
    headers PT_PHDR FILEHDR PHDRS;
    code PT_LOAD FILEHDR;
}

SECTIONS /*top level command that declares a list of custom program sections, ld provides set of such instructions.*/
{
    . = 0x10000; /* set location counter to address 0x10000, base address for subsequent commands */
    .text : { *(.text*) } :code /* final .text section begins at address 0x1000, combines all .text sections from obj files into one final*/
    . = 0x8000000;
    .rodata : { *(.rodata*) }
    .data : { *(.data*) } /*wildcard means all obj file .data sections*/
    .bss : { *(.bss*) }
}
