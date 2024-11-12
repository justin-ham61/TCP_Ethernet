#include <8051.h>
#include "w5500/w5500.h"
#include "spi/spi.h"
#include "serial/serial.h"
#include "IR/IR.h"
#include "write/write.h"
#include "read/read.h"
#include "global/global.h"
#include "config_menu/config_menu.h"

static unsigned char flag = 0;
unsigned char status;
unsigned char udp_status;
static unsigned char int_flag = 0;

static void UART_Init(void);
static void SPI_Init(void);
static void Timer_Init(void);
static void device_net_init(void);
static void UDP_socket_init(void);
static void TCP_socket_init(void);
static void socket_status_poll(unsigned char *status, unsigned char socket);

void UART_Init(void){
    TMOD = 0x21;
    TH1 = 0xFD;
    TL1 = 0xFD;
    //Mode 1, Receive Enable
    SCON = 0x50;
    TR1 = 1;
}

void SPI_Init(void){
    P2_5 = 0;
    P2_4 = 1;
    P2_7 = 0;
    P2_6 = 1;
}

void Timer_Init(void){
    TH0 = 0x00;
    TL0 = 0x00;
    TR0 = 1;
    ET1 = 1;
    ET0 = 1;
    EA = 1;

    //Enable EX0 Interrupt which is P3_2
    EX0 = 1;
    IT0 = 0;
}

void Timer1_ISR(void) __interrupt (3) {
	TF0 = 0;
    TH0 = 0x00;
    TL0 = 0x00;
	TR0 = 1;
}

void WOL_ISR(void) __interrupt (0){
    int_flag = 1; 
}

void main(void){
    UART_Init();
    SPI_Init();
    Timer_Init();
    //Enable socket interrupt on all sockets
    send_1(0x0018, 0x04, 0x03);
    
    //Enable WOL
    send_1(0x0000, 0x04, 0b00010000);
    //Enable interrupt mask
    send_1(0x0016, 0x04, 0x10);

    device_net_init();
    UDP_socket_init();
    TCP_socket_init();
    transmit_string("Setup Complete \r\n");
    while(1){
        switch(mode){
            case DUAL_POLLING_MODE:
                
                receive_data(&flag);
                
                if(int_flag){
                    socket_status_poll(&status, 1);
                    socket_status_poll(&udp_status, 0);
                    if(status == 0x00){
                        //Open socket
                        send_1(0x0001, 0x2C, 0x01);
                        //Listen mode
                        send_1(0x0001, 0x2C, 0x02);
                    }
                    SIR_poll();
                    if(inactivity_counter > 15 && status != 0x00){
                        transmit_string("Going back to sleep\r\n");
                        int_flag = 0;
                    }
                }
                switch (flag){
                    case 63:
                        flag = 0;
                        transmit_string("\r\n"); 
                        get_config();
                        transmit_string("\r\n"); 
                        transmit_string("Set/Change RTU Address (0-9) using: RTU=#\r\nSet/Change IP address using: IP=###.###.###.###\r\nSet/Change Subnet Mask using: SUB=###.###.###.###\r\n");
                        transmit_string("Set/Change Gateway using: GATE=###.###.###.###\r\nSet/Change MAC Address using: MAC=############\r\nChange Mode using: MODE=\r\n");
                        last_polling_mode = DUAL_POLLING_MODE;
                        mode = CONFIG_CHANGE_MODE;
                        break;
                    default:
                        break;
                }
                break;
            //Start accepting input for config update and update
            case CONFIG_CHANGE_MODE:
                //Insert input into buffer until input is an enter
                if(RI){
                    char c = SBUF;
                    RI = 0;
                    if(c == '\r' || c == '\n' || buffer_idx >= buffer_size - 2){
                        buffer[buffer_idx]= '.';
                        buffer[buffer_idx + 1]= '\0';
                        transmit_string("\r\n");
                        transmit_string(buffer);
                        transmit_string("\r\n");
                        buffer_idx = 0;
                        process_cmd();
                        clear_buffer();
                        transmit_string("\r\n");
                        buffer_idx = 0;
                    } else if (c == 8 && buffer_idx > 0){
                        //Backspace
                        buffer[buffer_idx] = 0;
                        buffer_idx--;
                        transmit_string("\b \b");
                    } else {
                        buffer[buffer_idx] = c;
                        transmit_data(&buffer[buffer_idx]);
                        buffer_idx++;
                    }
                }
                break;
            default:
                break;
        }
    }
}

void device_net_init(void){
    //IP Address
    send_4(0x000F, 0x04, 192, 168, 0, 102);
    //Subnet Mask
    send_4(0x0005, 0x04, 255, 255, 255, 0);
    //Gateway
    send_4(0x0001, 0x04, 192, 168, 0, 1);
    //MAC Address
    set_mac_adr(0x4e,0x12,0xC4,0xba,0x1c,0x3e);
}

void UDP_socket_init(void){
    //set socket src port
    send_2(0x0004, 0x0C, 0xE7, 0x9D);
    //set socket mode to udp
    send_1(0x0000, 0x0C, 0x02);
    //open socket
    send_1(0x0001, 0x0C, 0x01);
    //set destination adr
    send_4(0x000C, 0x0C, 192, 168, 0, 101);
    //set source destination port
    send_2(0x0010, 0x0C, 0xE7, 0x9D);
}

void TCP_socket_init(void){
    //set socket mode to tcp
    send_1(0x0000, 0x2C, 0x01);
    //set socket src port
    send_2(0x0004, 0x2C, 0xE7, 0x9E);
    //Open socket
    send_1(0x0001, 0x2C, 0x01);
    //Listen mode
    send_1(0x0001, 0x2C, 0x02);
}

void socket_status_poll(unsigned char* status, unsigned char socket){
    switch (socket)
    {
    case 0:
        *status = get_2(0x0003, 0x08) >> 8;
        break;
    case 1: 
        *status = get_2(0x0003, 0x28) >> 8;
        break;
    default:
        break;
    }
}

                 /* case 'u':
                        if(debounce_counter < 50){
                            break;
                        }
                        debounce_counter = 0;
                        flag = 0;
                        transmit_string("\r\nSending UDP Packet\r\n");
                        write_to_buffer(0, "Test Loop UDP");
                        send_1(0x0001, 0x0C, 0x20);
                        clear_buffer();
                        break;
                    case 't':
                        if(debounce_counter < 50){
                            break;
                        }
                        debounce_counter = 0;
                        flag = 0;
                        //Open socket
                        send_1(0x0001, 0x2C, 0x01);

                        //Set destination address
                        send_4(0x000C, 0x2C, 192, 168, 0, 101);
                        
                        //Set destination port
                        send_2(0x0010, 0x2C, 0xE7, 0x9F);

                        //Send connect
                        send_1(0x0001, 0x2C, 0x04);
                        while(status != 0x17){
                            socket_status_poll(&status, 1);
                        }
                        if(status == 0x17){
                            transmit_string("\r\nSending TCP Packet\r\n");
                            write_to_buffer(1, "Test Loop TCP");
                            send_1(0x0001, 0x2C, 0x20);
                            transmit_string("Sent TCP Packet\r\n");
                        } else {
                            transmit_string("Connection was unsuccessful, please try again... Closing socket\r\n");
                            //Close socket
                            send_1(0x0001, 0x2C, 0x10);
                        }
                        clear_buffer();

                        //close socket after sending
                        send_1(0x0001, 0x2C, 0x10);
                        break; */