OUTPUT_FORMAT("elf32-littlearm", "elf32-littlearm", "elf32-littlearm")
OUTPUT_ARCH(arm)
ENTRY(_start)
SECTIONS
{
 . = 0x00000000;
 . = ALIGN(4);
 .text :
 {
   start.o (.text)
   nand_boot.o (.text)
   *(.text)
 }
 . = ALIGN(4);
 .rodata : { *(SORT_BY_ALIGNMENT(SORT_BY_NAME(.rodata*))) }
 . = ALIGN(4);
 .data : { *(.data) }
 . = ALIGN(4);
 .got : { *(.got) }
 __u_boot_cmd_start = .;
 .u_boot_cmd : { *(.u_boot_cmd) }
 __u_boot_cmd_end = .;
 . = ALIGN(4);
 .rel.dyn : {
 __rel_dyn_start = .;
 *(.rel*)
 __rel_dyn_end = .;
 }
 .dynsym : {
 __dynsym_start = .;
 *(.dynsym)
 }
 _end = .;
 .bss __rel_dyn_start (OVERLAY) : {
 __bss_start = .;
 *(.bss)
 . = ALIGN(4);
 __bss_end__ = .;
 }
}
