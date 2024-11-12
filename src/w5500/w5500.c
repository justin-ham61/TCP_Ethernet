#include <8051.h>
#include "w5500.h"
#include "../spi/spi.h"

#define HIGHBIT_SHIFT 8
#define LOWBIT_MASK 0x00FF

void send_1(int adr, int cntl, int w){
    begin();
    asm_shift_in_2(adr >> 8);
    asm_shift_in_2(adr & 0x00FF);
    asm_shift_in_2(cntl);
    asm_shift_in_2(w);

/*     shift_in(adr >> 8);
    shift_in(adr & 0x00FF);
    shift_in(cntl);
    shift_in(w); */

    end();
}

void send_2(int adr, int cntl, int w, int x){
    begin();
    asm_shift_in_2(adr >> 8);
    asm_shift_in_2(adr & 0x00FF);
    asm_shift_in_2(cntl);
    asm_shift_in_2(w);
    asm_shift_in_2(x);
/*     
    shift_in(adr >> 8);
    shift_in(adr & 0x00FF);
    shift_in(cntl);
    shift_in(w);
    shift_in(x); */
    end();
}

void send_4(int adr, int cntl, int w, int x, int y, int z){
    begin();
    asm_shift_in_2(adr >> 8);
    asm_shift_in_2(adr & 0x00FF);
    asm_shift_in_2(cntl);
    asm_shift_in_2(w);
    asm_shift_in_2(x);
    asm_shift_in_2(y);
    asm_shift_in_2(z);

/*     shift_in(adr >> 8);
    shift_in(adr & 0x00FF);
    shift_in(cntl);
    shift_in(w);
    shift_in(x);
    shift_in(y);
    shift_in(z); */
    end();
}

int get_2(int adr, int cntl){
    int ret;
    begin();
    asm_shift_in_2(adr>>8);
    asm_shift_in_2(adr&0x00FF);
    asm_shift_in_2(cntl);
    ret = asm_shift_out_2();
    ret<<=8;
    ret |= asm_shift_out_2();
    end();
    return ret;
}

void set_mac_adr(int mac1, int mac2, int mac3, int mac4, int mac5, int mac6){
    begin();
    shift_in(0x00);
    shift_in(0x09);
    shift_in(0x04);
    shift_in(mac1);
    shift_in(mac2);
    shift_in(mac3);
    shift_in(mac4);
    shift_in(mac5);
    shift_in(mac6);

    end();
}
  