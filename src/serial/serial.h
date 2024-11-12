#ifndef SERIAL_H
#define SERIAL_H

extern void receive_data(unsigned char*);
extern void transmit_data(unsigned char*);
extern void transmit_int(unsigned char);
extern void transmit_string(char*);
#endif