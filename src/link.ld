ENTRY(_start) /* Загрузка начнется с метки _start, которую мы создали в src/boot.s */


SECTIONS {
    . = 0x00200000; /* Ядро будет на 2 мегабайта выше в ОЗУ */
    KERNEL_BEGIN = .;

    .text BLOCK(128K) : ALIGN(4K) {
        *(.multiboot)
        *(.text)
    }
    .rodata BLOCK(16K) : ALIGN(4K) {
        *(.rodata)
    }
    .data BLOCK(16K) : ALIGN(4K) {
        *(.data)
    }
    .bss BLOCK(16K) : ALIGN(4K) {
        *(COMMON)
        *(.bss)
    }
    KERNEL_END = .;
    KERNEL_SIZE = KERNEL_END - KERNEL_BEGIN;

    /DISCARD/ : {
        *(.eh_frame)
        *(.note .note.*)
    }
}
