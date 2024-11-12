#include <8051.h>
#include "IR.h"
#include "../spi/spi.h"
#include "../read/read.h"
#include "../serial/serial.h"
#include "../w5500/w5500.h"
#include "../global/global.h"
#include "../write/write.h"

#define SN_IR_SEND_OK 0x10
#define SN_IR_TIMEOUT 0x08
#define SN_IR_RECV    0x04
#define SN_IR_DISCON  0x02
#define SN_IR_CON     0x01

void get_SIR(unsigned char *socket);

void SIR_poll(void){
    unsigned char ir = 0;
    unsigned char socket = 0;
    unsigned char cntl_byte = 0;
    get_SIR(&socket);
    get_Sn_IR(socket, &ir);

    //Reset inactivity counter if socket register was active
    if(ir != 0){
        inactivity_counter = 0;
    } else {
        inactivity_counter++;
    }

    if(P3_2 == 0){
        //Get which socket is in interrupt
        switch (socket)
        {
        case 0:
            cntl_byte = 0x0C;
            break;
        case 1: 
            cntl_byte = 0x2C;
            break;
        default:
            break;
        }

        //Increment inactivity counter if the socket register is cleared

        if(ir & SN_IR_SEND_OK){
            send_1(0x0002, cntl_byte, (ir & SN_IR_SEND_OK));
        }
        
        if(ir & SN_IR_TIMEOUT){
            send_1(0x0000, cntl_byte, 0x01);
            //Open
            send_1(0x0001, cntl_byte, 0x01);
            //Listen
            send_1(0x0001, cntl_byte, 0x02);
            send_1(0x0002, cntl_byte, (ir & SN_IR_TIMEOUT));
        }

        if(ir & SN_IR_RECV){
            P2_2 = 0;
            unsigned char length = read_RX_buffer(&socket);
            unsigned char x;
            x = process_buff(0);
            switch (x){
                case 0:
                    transmit_string(buffer);
                    buffer[2] = rtu + '0';
                    break;
                case 1:
                    transmit_string("No : Found");
                    write_to_buffer(socket, "Incorrect format: \":\"");
                    break;
                case 2: 
                    transmit_string("No < found");
                    write_to_buffer(socket, "Incorrect format: \"<\"");
                    break;
                case 3: 
                    transmit_string("No RTU Number found");
                    write_to_buffer(socket, "Wrong RTU number");
                    break;
                case 4:
                    transmit_string("Error in message format");
                    write_to_buffer(socket, "Error in message format");
                    break;
                case 5: 
                    transmit_string("No > found");
                    write_to_buffer(socket, "Incorrect format: \">\"");
                    break;
                default:
                    break;
            }

            write_to_buffer(socket, &buffer[0]);
            send_1(0x0001, cntl_byte, 0x20);
            P2_2 = 1;
            transmit_string("\r\n");
            clear_buffer();
            send_1(0x0002, cntl_byte, (ir & SN_IR_RECV));
        }

        if(ir & SN_IR_DISCON){
            send_1(0x0001, cntl_byte, 0x08);
            send_1(0x0002, cntl_byte, (ir & SN_IR_DISCON));
        }

        if(ir & SN_IR_CON){
            send_1(0x0002, cntl_byte, (ir & SN_IR_CON));
        }

        P1 = 0x00;
    }
    P1 = 0xFF;
}

void get_Sn_IR(int socket, unsigned char *ir){
    begin();
    shift_in(0x00);
    shift_in(0x02);
    switch (socket)
    {
    case 0:
        shift_in(0x08);
        break;
    case 1:
        shift_in(0x28);
    default:
        break;
    }
    *ir = shift_out();
    end();
}

void get_SIR(unsigned char *socket){
    unsigned char sir_byte;
    begin();
    shift_in(0x00);
    shift_in(0x17);
    shift_in(0x00);
    sir_byte = shift_out();

    for(int i = 0; i < 8; i++){
        if(sir_byte & (1 << i)){
            *socket = i;
        }
    }
    //sets socket to -1 if no other interrupts exist
    end();
}

unsigned char process_buff(unsigned char start_idx){
    if(buffer[start_idx + 0] != ':'){
        return 1;
    }
    if(buffer[start_idx + 1] != '<'){
        return 2;
    } else {
        buffer[start_idx + 1] = '[';
    }
    if(buffer[start_idx + 2] < '0' || buffer[start_idx + 2] > '9'){
        return 3;
    } 

    buffer_idx = start_idx + 3;
    while(buffer[buffer_idx] != '>' && buffer_idx < buffer_size){
        //If lower case
        if(buffer[buffer_idx] >= 'a' && buffer[buffer_idx] <= 'z'){
            buffer[buffer_idx] -= 32;
        } else {
            return 4;
        }
        buffer_idx++;
    }
    if(buffer_idx < buffer_size){
        buffer[buffer_idx] = ']';
    } else {
        return 5;
    }

    return 0;
}