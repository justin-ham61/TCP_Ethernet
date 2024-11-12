#include <8051.h>
#include "config_menu.h"
#include "../global/global.h"
#include "../serial/serial.h"
#include "../spi/spi.h"
#include "../w5500/w5500.h"

static unsigned char factor[3] = {100, 10, 1};

static void process_byte(unsigned char cmd_val[]);
static void process_mac(unsigned char cmd_val[]);
static void process_temp(unsigned char *temp);
static void process_mode(unsigned char cmd_val[]);
static void print_byte(unsigned char *byte);
static void print_byte_hex(unsigned char *byte);

void get_config(void){
    unsigned char byte;
    transmit_string("\r\nCurrent Config\r\nRTU: ");
    transmit_int(rtu + '0');
    transmit_string("\r\nIP Address: ");
    begin();
    //getting and printing ip
    asm_shift_in_2(0x00);
    asm_shift_in_2(0x0F);
    asm_shift_in_2(0x00);
    byte = asm_shift_out_2();
    print_byte(&byte);
    transmit_int('.');
    byte = asm_shift_out_2();
    print_byte(&byte);
    transmit_int('.');
    byte = asm_shift_out_2();
    print_byte(&byte);
    transmit_int('.');
    byte = asm_shift_out_2();
    print_byte(&byte);
    end();

    transmit_string("\r\nSubnet Mask: ");

    begin();
    asm_shift_in_2(0x00);
    asm_shift_in_2(0x05);
    asm_shift_in_2(0x00);
    byte = asm_shift_out_2();
    print_byte(&byte);
    transmit_int('.');
    byte = asm_shift_out_2();
    print_byte(&byte);
    transmit_int('.');
    byte = asm_shift_out_2();
    print_byte(&byte);
    transmit_int('.');
    byte = asm_shift_out_2();
    print_byte(&byte);
    end();

    transmit_string("\r\nGateway: ");

    begin();
    asm_shift_in_2(0x00);
    asm_shift_in_2(0x01);
    asm_shift_in_2(0x00);
    byte = asm_shift_out_2();
    print_byte(&byte);
    transmit_int('.');
    byte = asm_shift_out_2();
    print_byte(&byte);
    transmit_int('.');
    byte = asm_shift_out_2();
    print_byte(&byte);
    transmit_int('.');
    byte = asm_shift_out_2();
    print_byte(&byte);
    end();

    transmit_string("\r\nMAC Address: ");

    begin();
    asm_shift_in_2(0x00);
    asm_shift_in_2(0x09);
    asm_shift_in_2(0x00);
    byte = asm_shift_out_2();
    print_byte_hex(&byte);
    byte = asm_shift_out_2();
    print_byte_hex(&byte);
    byte = asm_shift_out_2();
    print_byte_hex(&byte);
    byte = asm_shift_out_2();
    print_byte_hex(&byte);
    byte = asm_shift_out_2();
    print_byte_hex(&byte);
    byte = asm_shift_out_2();
    print_byte_hex(&byte);
    end(); 

    transmit_string("\r\n");
}

void print_byte(unsigned char *byte){
    unsigned char hundred_print = 0;
    if(*byte/100 != 0){
        transmit_int((*byte/100) + '0');
        hundred_print = 1;
    }

    *byte %= 100;
    
    if(*byte/10 == 0 && hundred_print == 1){
        transmit_int((*byte/10) + '0');
    } 
    if(*byte/10 != 0){
        transmit_int((*byte/10) + '0');
    }

    *byte %= 10;

    transmit_int((*byte/1) + '0');
}

void print_byte_hex(unsigned char *byte){
    if((*byte >> 4) >= 10){
        transmit_int((*byte >> 4) + 'A' - 10);
    } else {
        transmit_int((*byte >> 4) + '0');
    }

    if((*byte & 0x0F) >= 10){
        transmit_int((*byte & 0x0F) + 'A' - 10);
    } else {
        transmit_int((*byte & 0x0F) + '0');
    }
    transmit_int(' ');
}

void process_cmd(void){
    unsigned char cmd_val[6];
    int cmd_sum = 0;

    while(buffer[buffer_idx] != '=' && buffer[buffer_idx] != 0){
        cmd_sum += buffer[buffer_idx];
        buffer_idx++;
    }
    buffer_idx++;

    switch (cmd_sum){
        //RTU
        case 251:
            if((buffer[buffer_idx] < '0' || buffer[buffer_idx] > '9') || buffer[buffer_idx + 1] != '.'){
                invalid_cmd_flag = 1;
            } else {
                cmd_val[0] = buffer[buffer_idx] - '0';
            }
            break;
        //IP
        case 153:
            process_byte(cmd_val);
            break;
        //SUB
        case 234:
            process_byte(cmd_val);
            break;
        //GATE
        case 289:
            process_byte(cmd_val);
            break;
        //MAC
        case 209:
            process_mac(cmd_val);
            break;
        //MODE
        case 293:
            process_mode(cmd_val);
            break;
        default:
            //Print no command found
            invalid_cmd_flag = 1;
            break;
    }

    if(invalid_cmd_flag == 1){
        transmit_string("Invalid Command Format\r\n");
    } else {
        switch (cmd_sum){
            case 251:
                rtu = cmd_val[0];
                transmit_string("Successfully updated RTU\r\n");
                mode = last_polling_mode;
                break;
            case 153:
                send_4(0x000F, 0x04, cmd_val[0], cmd_val[1], cmd_val[2], cmd_val[3]);
                transmit_string("Successfully updated IP");
                mode = last_polling_mode;
                break;
            case 234:
                send_4(0x0005, 0x04, cmd_val[0], cmd_val[1], cmd_val[2], cmd_val[3]);
                transmit_string("Successfully updated Subnet Mask");
                mode = last_polling_mode;
                break;
            case 289:
                send_4(0x0001, 0x04, cmd_val[0], cmd_val[1], cmd_val[2], cmd_val[3]);
                transmit_string("Successfully updated Gateway");
                mode = last_polling_mode;
                break;
            case 209:
                set_mac_adr(cmd_val[0], cmd_val[1], cmd_val[2], cmd_val[3], cmd_val[4], cmd_val[5]);
                transmit_string("Successfully updated MAC Address");
                mode = last_polling_mode;
                break;
            case 293:
                //close previous socket
                send_1(0x0001, 0x0C, 0x10);
                switch (cmd_val[0])
                {
                case 233:
                    //UDP
                    send_1(0x0000, 0x0C, 0x02);
                    //Open
                    send_1(0x0001, 0x0C, 0x01);
                    mode = DUAL_POLLING_MODE;
                    /* code */
                    break;
                case 231:
                    //TCP
                    send_1(0x0000, 0x0C, 0x01);
                    //Open
                    send_1(0x0001, 0x0C, 0x01);
                    //Listen
                    send_1(0x0001, 0x0C, 0x02);
                    mode = TCP_POLLING_MODE;
                    break;
                default:
                    mode = last_polling_mode;
                    break;
                }
                transmit_string("Changed mode");
                break;
            default:
                break;
        }
    }
    mode = last_polling_mode;
    for(int i = 0; i < 6; i++){
        cmd_val[i] = 0;
    }
    invalid_cmd_flag = 0;
}

void process_byte(unsigned char cmd_val[]){
    unsigned char added = 0;
    unsigned char counter = 0;
    int value = 0;

    while(buffer_idx < buffer_size && buffer[buffer_idx] != 0){
        if((buffer[buffer_idx] >= '0' && buffer[buffer_idx] <= '9') && counter <= 2){
            value += ((buffer[buffer_idx] - '0') * factor[counter]);
            counter++;
            buffer_idx++;
        } else if (buffer[buffer_idx] == '.' && counter > 0){
            if(counter == 2){
                value = value/10;
            } else if (counter == 1){
                value = value/100;
            }
            if(value > 255){
                invalid_cmd_flag = 1; 
                transmit_string("1");
                break;
            }
            cmd_val[added] = value;
            value = 0;
            added++;
            counter = 0;
            buffer_idx++;
        } else {
            transmit_string("2");
            invalid_cmd_flag = 1;
            break;
        }
    }

    if(added != 4){
        transmit_string("3");
        invalid_cmd_flag = 1;
        return;
    }
}

void process_mac(unsigned char cmd_val[]){
    unsigned char added = 0;
    unsigned char value;
    unsigned char temp;
    while(buffer[buffer_idx] != 0 && buffer[buffer_idx] != '.'){
        temp = buffer[buffer_idx];
        process_temp(&temp);
        value = temp << 4;
        buffer_idx++;

        temp = buffer[buffer_idx];
        process_temp(&temp);
        value |= temp;
        buffer_idx++;

        cmd_val[added] = value;
        added++;
    }
    if(added != 6){
        transmit_string("Not enough values");
        invalid_cmd_flag = 1;
    }
}

void process_temp(unsigned char *temp){
    //value is an integer
    
    if(*temp >= '0' && *temp <= '9'){
        *temp -= 48;
    //value is a letter a-f
    } else if (*temp >= 'a' && *temp <= 'f'){
        *temp -= 87;
    //value is a letter A-F
    } else if (*temp >= 'A' && *temp <= 'F'){
        *temp -= 55;
    } else {
        transmit_string("Temp is: ");
        transmit_data(temp);
        transmit_string("\r\n");
        invalid_cmd_flag = 1;
    }
}

void process_mode(unsigned char cmd_val[]){
    int mode_sum = 0;
    for(int i = 0; i < 3; i++){
        mode_sum += buffer[buffer_idx];
        buffer_idx++;
    }
    if(mode_sum == 233 || mode_sum == 231){
        cmd_val[0] = mode_sum;
    } else {
        invalid_cmd_flag = 1;
        transmit_string("Invalid mode format\r\n");
    }
}


