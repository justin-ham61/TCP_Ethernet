#include <8051.h>
#include "spi.h"

void delay(int i){
    int j, k;
	for (j = i; j > 0; j--)
		for (k = 125; k > 0; k--);
}

//SCLK P2_7
//SCS  P2_6
//MOSI P2_5
//MISO P2_4

//3 phases
    //Address phase 
        //16 bit address for w5500 register or TX/RX memory
    //Control phase
        //The block to which offset block
        //R or W
        //Operation mode
            //Variable and Fixed length data
    //Data phase
        //Specifies data
        //Can be random length or 1byte, 2 byte and 4 bytes.
    //Sequential data write
    //Writing to multiple data will offset by 1 to the next offset address

//Control phase block
    //[7:3] = 5 bits of data
        //common, tx or rx buffer 
    //[2]
        //0 = Read, 1 = Write
    //[1,0]
        //Mode
            //00 = variable
            //01 = 1 byte
            //02 = 2 bytes
            //03 = 4 bytes


void begin(void){
    P2_6 = 0;
}

void end(void){
    P2_6 = 1;
}

void asm_shift_in_2(unsigned char data){
    ACC = data;
    __asm
    mov r7, A

    mov c, A.7
    mov _P2_5, c
    setb _P2_7
    clr _P2_7
    clr _P2_5
    rlc A

    mov c, A.7
    mov _P2_5, c
    setb _P2_7
    clr _P2_7
    clr _P2_5
    rlc A

    mov c, A.7
    mov _P2_5, c
    setb _P2_7
    clr _P2_7
    clr _P2_5
    rlc A

    mov c, A.7
    mov _P2_5, c
    setb _P2_7
    clr _P2_7
    clr _P2_5
    rlc A

    mov c, A.7
    mov _P2_5, c
    setb _P2_7
    clr _P2_7
    clr _P2_5
    rlc A

    mov c, A.7
    mov _P2_5, c
    setb _P2_7
    clr _P2_7
    clr _P2_5
    rlc A

    mov c, A.7
    mov _P2_5, c
    setb _P2_7
    clr _P2_7
    clr _P2_5
    rlc A

    mov c, A.7
    mov _P2_5, c
    setb _P2_7
    clr _P2_7
    clr _P2_5
    rlc A

    ret
    __endasm;
}

void asm_shift_in(void){
    __asm
	mov	r7, dpl
	mov	ar6,r7
	anl	ar6,#0x80
	mov	a,r6
	add	a,#0xff
	mov	_P2_5,c
	setb	_P2_7
	clr	_P2_7
	clr	_P2_5
	mov	a,r7
	add	a,r7
	mov	r7,a
	anl	a,#0x80
	add	a,#0xff
	mov	_P2_5,c
	setb	_P2_7
	clr	_P2_7
	clr	_P2_5
	mov	a,r7
	add	a,r7
	mov	r7,a
	anl	a,#0x80
	add	a,#0xff
	mov	_P2_5,c
	setb	_P2_7
	clr	_P2_7
	clr	_P2_5
	mov	a,r7
	add	a,r7
	mov	r7,a
	anl	a,#0x80
	add	a,#0xff
	mov	_P2_5,c
	setb	_P2_7
	clr	_P2_7
	clr	_P2_5
	mov	a,r7
	add	a,r7
	mov	r7,a
	anl	a,#0x80
	add	a,#0xff
	mov	_P2_5,c
	setb	_P2_7
	clr	_P2_7
	clr	_P2_5
	mov	a,r7
	add	a,r7
	mov	r7,a
	anl	a,#0x80
	add	a,#0xff
	mov	_P2_5,c
	setb	_P2_7
	clr	_P2_7
	clr	_P2_5
	mov	a,r7
	add	a,r7
	mov	r7,a
	anl	a,#0x80
	add	a,#0xff
	mov	_P2_5,c
	setb	_P2_7
	clr	_P2_7
	clr	_P2_5
	mov	a,r7
	add	a,r7
	anl	a,#0x80
	add	a,#0xff
	mov	_P2_5,c
	setb	_P2_7
	clr	_P2_7
	clr	_P2_5
	ret
    __endasm;
}

unsigned char asm_shift_out_2(void){
    __asm
    mov A, #0

    rlc A
    setb _P2_7
    mov c, _P2_4
    mov A.0, c
    clr _P2_7

    rlc A
    setb _P2_7
    mov c, _P2_4
    mov A.0, c
    clr _P2_7

    rlc A
    setb _P2_7
    mov c, _P2_4
    mov A.0, c
    clr _P2_7

    rlc A
    setb _P2_7
    mov c, _P2_4
    mov A.0, c
    clr _P2_7

    rlc A
    setb _P2_7
    mov c, _P2_4
    mov A.0, c
    clr _P2_7

    rlc A
    setb _P2_7
    mov c, _P2_4
    mov A.0, c
    clr _P2_7

    rlc A
    setb _P2_7
    mov c, _P2_4
    mov A.0, c
    clr _P2_7

    rlc A
    setb _P2_7
    mov c, _P2_4
    mov A.0, c
    clr _P2_7

    mov r7, A
    __endasm;

    return ACC;
}
void asm_shift_out(void){
    __asm
	setb	_P2_7
	mov	c,_P2_4
	clr	a
	rlc	a
	mov	r7,a
	clr	_P2_7
	mov	a,r7
	add	a,r7
	mov	r7,a
	setb	_P2_7
	mov	c,_P2_4
	clr	a
	rlc	a
	mov	r6,a
	mov	a,r7
	orl	ar6,a
	clr	_P2_7
	mov	a,r6
	add	a,r6
	mov	r6,a
	setb	_P2_7
	mov	c,_P2_4
	clr	a
	rlc	a
	mov	r7,a
	mov	a,r6
	orl	ar7,a
	clr	_P2_7
	mov	a,r7
	add	a,r7
	mov	r7,a
	setb	_P2_7
	mov	c,_P2_4
	clr	a
	rlc	a
	mov	r6,a
	mov	a,r7
	orl	ar6,a
	clr	_P2_7
	mov	a,r6
	add	a,r6
	mov	r6,a
	setb	_P2_7
	mov	c,_P2_4
	clr	a
	rlc	a
	orl	ar6,a
	clr	_P2_7
	mov	a,r6
	add	a,r6
	mov	r6,a
	setb	_P2_7
	mov	c,_P2_4
	clr	a
	rlc	a
	mov	r7,a
	mov	a,r6
	orl	ar7,a
	clr	_P2_7
	mov	a,r7
	add	a,r7
	mov	r7,a
	setb	_P2_7
	mov	c,_P2_4
	clr	a
	rlc	a
	mov	r6,a
	mov	a,r7
	orl	ar6,a
	clr	_P2_7
	mov	a,r6
	add	a,r6
	mov	r6,a
	setb	_P2_7
	mov	c,_P2_4
	clr	a
	rlc	a
	orl	a,r6
	mov	dpl,a
	clr	_P2_7
	ret
    __endasm;
}

void shift_in(unsigned char data){
    P2_5 = (data & 0x80) ? 1 : 0;
    P2_7 = 1;        
    P2_7 = 0;
    P2_5 = 0;
    data <<= 1;
    P2_5 = (data & 0x80) ? 1 : 0;
    P2_7 = 1;        
    P2_7 = 0;
    P2_5 = 0;
    data <<= 1;
    P2_5 = (data & 0x80) ? 1 : 0;
    P2_7 = 1;        
    P2_7 = 0;
    P2_5 = 0;
    data <<= 1;
    P2_5 = (data & 0x80) ? 1 : 0;
    P2_7 = 1;        
    P2_7 = 0;
    P2_5 = 0;
    data <<= 1;
    P2_5 = (data & 0x80) ? 1 : 0;
    P2_7 = 1;        
    P2_7 = 0;
    P2_5 = 0;
    data <<= 1;
    P2_5 = (data & 0x80) ? 1 : 0;
    P2_7 = 1;        
    P2_7 = 0;
    P2_5 = 0;
    data <<= 1;
    P2_5 = (data & 0x80) ? 1 : 0;
    P2_7 = 1;        
    P2_7 = 0;
    P2_5 = 0;
    data <<= 1;
    P2_5 = (data & 0x80) ? 1 : 0;
    P2_7 = 1;        
    P2_7 = 0;
    P2_5 = 0;
    data <<= 1;
}

unsigned char shift_out(void){
    unsigned char data = 0;
    data <<= 1;
    P2_7 = 1;
    data |= P2_4;
    P2_7 = 0;
    data <<= 1;
    P2_7 = 1;
    data |= P2_4;
    P2_7 = 0;
    data <<= 1;
    P2_7 = 1;
    data |= P2_4;
    P2_7 = 0;
    data <<= 1;
    P2_7 = 1;
    data |= P2_4;
    P2_7 = 0;
    data <<= 1;
    P2_7 = 1;
    data |= P2_4;
    P2_7 = 0;
    data <<= 1;
    P2_7 = 1;
    data |= P2_4;
    P2_7 = 0;
    data <<= 1;
    P2_7 = 1;
    data |= P2_4;
    P2_7 = 0;
    data <<= 1;
    P2_7 = 1;
    data |= P2_4;
    P2_7 = 0;
    return data;
}