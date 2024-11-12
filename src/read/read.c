#include <8051.h>
#include "../spi/spi.h"
#include "../serial/serial.h"
#include "../w5500/w5500.h"
#include "../global/global.h"
#include "read.h"

unsigned char read_RX_buffer(unsigned char *socket){
    unsigned char ret = 0;

    switch (*socket)
    {
    case 0:
        rw_ptr = get_2(0x0028, 0x08);
        rw_size = get_2(0x0026, 0x08);
        break;
    case 1:
        rw_ptr = get_2(0x0028, 0x28);
        rw_size = get_2(0x0026, 0x28);
        break;
    default:
        break;
    }

    begin();
    asm_shift_in_2(GET_HIGH_BITS(rw_ptr));
    asm_shift_in_2(GET_LOW_BITS(rw_ptr));

    switch (*socket)
    {
    case 0:
        //shift_in(0x18);
        asm_shift_in_2(0x18);
        break;
    case 1: 
        //shift_in(0x38);
        asm_shift_in_2(0x38);
        break;
    default:
        break;
    }

    switch (*socket){
        case 0:
            for(int i = 0; i < 6; i++){
                shift_out();
                //asm_shift_out_2();
            }
            //int p1 = shift_out();
            int p1 = asm_shift_out_2();
            p1 <<= 8;
            //p1 |= shift_out();
            p1 |= asm_shift_out_2();

            P2_1 = 0;
            for(int i = 0; i < p1; i++){
                //buffer[i] = shift_out();
                buffer[i] = asm_shift_out_2();
                if(i >= buffer_size){
                    break;
                }
            }
            P2_1 = 1;
            ret = p1;
            break;
        case 1:
            P2_1 = 0;
            for(int i = 0; i < rw_size; i++){
                //buffer[i] = shift_out();
                buffer[i] = asm_shift_out_2();
                if(i >= buffer_size){
                    break;
                }
            }
            P2_1 = 1;
            ret = rw_size;
            break;
        default:
            break;
    }
    end();

    rw_ptr += rw_size;
    //Set read pointer to new location
    switch (*socket)
    {
    case 0:
        send_2(0x0028, 0x0C, GET_HIGH_BITS(rw_ptr), GET_LOW_BITS(rw_ptr));
        send_1(0x0001, 0x0C, 0x40);
        break;
    case 1: 
        send_2(0x0028, 0x2C, GET_HIGH_BITS(rw_ptr), GET_LOW_BITS(rw_ptr));
        send_1(0x0001, 0x2C, 0x40);
        break;
    default:
        break;
    }
    //Send recv command
    return ret;
}