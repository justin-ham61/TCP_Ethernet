#include <8051.h>
#include "serial.h"
#include "../write/write.h"

void transmit_data(unsigned char *tx_data){
    SBUF = *tx_data;
    //TI is set to 1 when transmission from SBUF is finished
    while(TI == 0);
    TI = 0;
}

void transmit_int(unsigned char num){
    SBUF = num;
    while(TI == 0);
    TI = 0;
}

void receive_data(unsigned char *flag){
    if(RI){
        P1 = 0x00;
        *flag = SBUF;
        RI = 0;
        SBUF = 0;
        //transmit_data(flag);
    } else {
        P1 = 0xFF;
    }
}

void transmit_string(char *str){
    unsigned char i = 0;
    while(str[i] != '\0'){
        transmit_data(&str[i]);
        i++;
    }
}