#include <8051.h>
#include "write.h"
#include "../spi/spi.h"
#include "../serial/serial.h"
#include "../w5500/w5500.h"
#include "../global/global.h"

void write_to_buffer(unsigned char socket, char* str){
    unsigned char i = 0;
    switch (socket)
    {
    case 0:
        rw_ptr = get_2(0x0024, 0x08);
        break;
    case 1: 
        rw_ptr = get_2(0x0024, 0x28);
        break;
    default:
        rw_ptr = 0;
        break;
    }
    begin();
    asm_shift_in_2(GET_HIGH_BITS(rw_ptr));
    //shift_in(GET_HIGH_BITS(rw_ptr));
    asm_shift_in_2(GET_LOW_BITS(rw_ptr));
    //shift_in(GET_LOW_BITS(rw_ptr));
    switch (socket)
    {
    case 0:
        shift_in(0x14);
        break;
    case 1: 
        shift_in(0x34);
    default:
        break;
    }

    P2_0 = 0;
    while(str[i] != '\0'){
        asm_shift_in_2(str[i]);
        //shift_in(str[i]);
        i++;
    }
    P2_0 = 1;

    rw_ptr += i;
    end();

    //Set TX Write pointer
    switch (socket)
    {
    case 0:
        send_2(0x0024, 0x0C, GET_HIGH_BITS(rw_ptr), GET_LOW_BITS(rw_ptr));
        break;
    case 1:
        send_2(0x0024, 0x2C, GET_HIGH_BITS(rw_ptr), GET_LOW_BITS(rw_ptr));
        break;
    default:
        break;
    }
    
}