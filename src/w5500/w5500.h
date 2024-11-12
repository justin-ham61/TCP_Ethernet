#ifndef W5500_H
#define W5500_H

extern void send_1(int, int, int);
extern void send_2(int, int, int, int);
extern void send_4(int, int, int, int, int, int);
extern int get_2(int, int);
extern void set_mac_adr(int, int, int, int, int, int);

#endif