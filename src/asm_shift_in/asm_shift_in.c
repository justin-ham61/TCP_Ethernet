#include <8051.h>

void asm_shift_in(unsigned char c){
    __asm
    mov r1, c
    anl r1, 0x80


    __endasm;
}