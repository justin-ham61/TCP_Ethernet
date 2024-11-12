#ifndef SPI_H
#define SPI_H

extern void shift_in(unsigned char);
extern unsigned char shift_out(void);
extern void asm_shift_in(void);
extern void asm_shift_out(void);
extern unsigned char asm_shift_out_2(void);
extern void asm_shift_in_2(unsigned char);
extern void delay(int);
extern void begin(void);
extern void end(void);
#endif