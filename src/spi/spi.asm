;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (MINGW32)
;--------------------------------------------------------
	.module spi
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _F1
	.globl _P
	.globl _PS
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _RD
	.globl _WR
	.globl _T1
	.globl _T0
	.globl _INT1
	.globl _INT0
	.globl _TXD
	.globl _RXD
	.globl _P3_7
	.globl _P3_6
	.globl _P3_5
	.globl _P3_4
	.globl _P3_3
	.globl _P3_2
	.globl _P3_1
	.globl _P3_0
	.globl _EA
	.globl _ES
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _P2_7
	.globl _P2_6
	.globl _P2_5
	.globl _P2_4
	.globl _P2_3
	.globl _P2_2
	.globl _P2_1
	.globl _P2_0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P1_4
	.globl _P1_3
	.globl _P1_2
	.globl _P1_1
	.globl _P1_0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _P0_7
	.globl _P0_6
	.globl _P0_5
	.globl _P0_4
	.globl _P0_3
	.globl _P0_2
	.globl _P0_1
	.globl _P0_0
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _IP
	.globl _P3
	.globl _IE
	.globl _P2
	.globl _SBUF
	.globl _SCON
	.globl _P1
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
	.globl _delay
	.globl _begin
	.globl _end
	.globl _asm_shift_in_2
	.globl _asm_shift_in
	.globl _asm_shift_out_2
	.globl _asm_shift_out
	.globl _shift_in
	.globl _shift_out
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_P1	=	0x0090
_SCON	=	0x0098
_SBUF	=	0x0099
_P2	=	0x00a0
_IE	=	0x00a8
_P3	=	0x00b0
_IP	=	0x00b8
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0_0	=	0x0080
_P0_1	=	0x0081
_P0_2	=	0x0082
_P0_3	=	0x0083
_P0_4	=	0x0084
_P0_5	=	0x0085
_P0_6	=	0x0086
_P0_7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_P1_0	=	0x0090
_P1_1	=	0x0091
_P1_2	=	0x0092
_P1_3	=	0x0093
_P1_4	=	0x0094
_P1_5	=	0x0095
_P1_6	=	0x0096
_P1_7	=	0x0097
_RI	=	0x0098
_TI	=	0x0099
_RB8	=	0x009a
_TB8	=	0x009b
_REN	=	0x009c
_SM2	=	0x009d
_SM1	=	0x009e
_SM0	=	0x009f
_P2_0	=	0x00a0
_P2_1	=	0x00a1
_P2_2	=	0x00a2
_P2_3	=	0x00a3
_P2_4	=	0x00a4
_P2_5	=	0x00a5
_P2_6	=	0x00a6
_P2_7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES	=	0x00ac
_EA	=	0x00af
_P3_0	=	0x00b0
_P3_1	=	0x00b1
_P3_2	=	0x00b2
_P3_3	=	0x00b3
_P3_4	=	0x00b4
_P3_5	=	0x00b5
_P3_6	=	0x00b6
_P3_7	=	0x00b7
_RXD	=	0x00b0
_TXD	=	0x00b1
_INT0	=	0x00b2
_INT1	=	0x00b3
_T0	=	0x00b4
_T1	=	0x00b5
_WR	=	0x00b6
_RD	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS	=	0x00bc
_P	=	0x00d0
_F1	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; uninitialized external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; initialized external ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'delay'
;------------------------------------------------------------
;i                         Allocated to registers 
;j                         Allocated to registers r6 r7 
;k                         Allocated to registers r4 r5 
;------------------------------------------------------------
;	.\spi.c:4: void delay(int i){
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	mov	r6, dpl
	mov	r7, dph
;	.\spi.c:6: for (j = i; j > 0; j--)
00106$:
	clr	c
	clr	a
	subb	a,r6
	mov	a,#(0x00 ^ 0x80)
	mov	b,r7
	xrl	b,#0x80
	subb	a,b
	jnc	00108$
;	.\spi.c:7: for (k = 125; k > 0; k--);
	mov	r4,#0x7d
	mov	r5,#0x00
00104$:
	dec	r4
	cjne	r4,#0xff,00137$
	dec	r5
00137$:
	clr	c
	clr	a
	subb	a,r4
	mov	a,#(0x00 ^ 0x80)
	mov	b,r5
	xrl	b,#0x80
	subb	a,b
	jc	00104$
;	.\spi.c:6: for (j = i; j > 0; j--)
	dec	r6
	cjne	r6,#0xff,00139$
	dec	r7
00139$:
	sjmp	00106$
00108$:
;	.\spi.c:8: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'begin'
;------------------------------------------------------------
;	.\spi.c:42: void begin(void){
;	-----------------------------------------
;	 function begin
;	-----------------------------------------
_begin:
;	.\spi.c:43: P2_6 = 0;
;	assignBit
	clr	_P2_6
;	.\spi.c:44: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'end'
;------------------------------------------------------------
;	.\spi.c:46: void end(void){
;	-----------------------------------------
;	 function end
;	-----------------------------------------
_end:
;	.\spi.c:47: P2_6 = 1;
;	assignBit
	setb	_P2_6
;	.\spi.c:48: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'asm_shift_in_2'
;------------------------------------------------------------
;data                      Allocated to registers 
;------------------------------------------------------------
;	.\spi.c:50: void asm_shift_in_2(unsigned char data){
;	-----------------------------------------
;	 function asm_shift_in_2
;	-----------------------------------------
_asm_shift_in_2:
	mov	_ACC,dpl
;	.\spi.c:112: __endasm;
	mov	r7, A
	mov	c, A.7
	mov	_P2_5, c
	setb	_P2_7
	clr	_P2_7
	clr	_P2_5
	rlc	A
	mov	c, A.7
	mov	_P2_5, c
	setb	_P2_7
	clr	_P2_7
	clr	_P2_5
	rlc	A
	mov	c, A.7
	mov	_P2_5, c
	setb	_P2_7
	clr	_P2_7
	clr	_P2_5
	rlc	A
	mov	c, A.7
	mov	_P2_5, c
	setb	_P2_7
	clr	_P2_7
	clr	_P2_5
	rlc	A
	mov	c, A.7
	mov	_P2_5, c
	setb	_P2_7
	clr	_P2_7
	clr	_P2_5
	rlc	A
	mov	c, A.7
	mov	_P2_5, c
	setb	_P2_7
	clr	_P2_7
	clr	_P2_5
	rlc	A
	mov	c, A.7
	mov	_P2_5, c
	setb	_P2_7
	clr	_P2_7
	clr	_P2_5
	rlc	A
	mov	c, A.7
	mov	_P2_5, c
	setb	_P2_7
	clr	_P2_7
	clr	_P2_5
	rlc	A
	ret
;	.\spi.c:113: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'asm_shift_in'
;------------------------------------------------------------
;	.\spi.c:115: void asm_shift_in(void){
;	-----------------------------------------
;	 function asm_shift_in
;	-----------------------------------------
_asm_shift_in:
;	.\spi.c:189: __endasm;
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
;	.\spi.c:190: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'asm_shift_out_2'
;------------------------------------------------------------
;	.\spi.c:192: unsigned char asm_shift_out_2(void){
;	-----------------------------------------
;	 function asm_shift_out_2
;	-----------------------------------------
_asm_shift_out_2:
;	.\spi.c:245: __endasm;
	mov	A, #0
	rlc	A
	setb	_P2_7
	mov	c, _P2_4
	mov	A.0, c
	clr	_P2_7
	rlc	A
	setb	_P2_7
	mov	c, _P2_4
	mov	A.0, c
	clr	_P2_7
	rlc	A
	setb	_P2_7
	mov	c, _P2_4
	mov	A.0, c
	clr	_P2_7
	rlc	A
	setb	_P2_7
	mov	c, _P2_4
	mov	A.0, c
	clr	_P2_7
	rlc	A
	setb	_P2_7
	mov	c, _P2_4
	mov	A.0, c
	clr	_P2_7
	rlc	A
	setb	_P2_7
	mov	c, _P2_4
	mov	A.0, c
	clr	_P2_7
	rlc	A
	setb	_P2_7
	mov	c, _P2_4
	mov	A.0, c
	clr	_P2_7
	rlc	A
	setb	_P2_7
	mov	c, _P2_4
	mov	A.0, c
	clr	_P2_7
	mov	r7, A
;	.\spi.c:247: return ACC;
	mov	dpl, _ACC
;	.\spi.c:248: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'asm_shift_out'
;------------------------------------------------------------
;	.\spi.c:249: void asm_shift_out(void){
;	-----------------------------------------
;	 function asm_shift_out
;	-----------------------------------------
_asm_shift_out:
;	.\spi.c:332: __endasm;
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
;	.\spi.c:333: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'shift_in'
;------------------------------------------------------------
;data                      Allocated to registers r7 
;------------------------------------------------------------
;	.\spi.c:335: void shift_in(unsigned char data){
;	-----------------------------------------
;	 function shift_in
;	-----------------------------------------
_shift_in:
	mov	r7, dpl
;	.\spi.c:336: P2_5 = (data & 0x80) ? 1 : 0;
	mov	ar6,r7
	anl	ar6,#0x80
;	assignBit
	mov	a,r6
	add	a,#0xff
	mov	_P2_5,c
;	.\spi.c:337: P2_7 = 1;        
;	assignBit
	setb	_P2_7
;	.\spi.c:338: P2_7 = 0;
;	assignBit
	clr	_P2_7
;	.\spi.c:339: P2_5 = 0;
;	assignBit
	clr	_P2_5
;	.\spi.c:340: data <<= 1;
	mov	a,r7
	add	a,r7
;	.\spi.c:341: P2_5 = (data & 0x80) ? 1 : 0;
	mov	r7,a
;	assignBit
	anl	a,#0x80
	add	a,#0xff
	mov	_P2_5,c
;	.\spi.c:342: P2_7 = 1;        
;	assignBit
	setb	_P2_7
;	.\spi.c:343: P2_7 = 0;
;	assignBit
	clr	_P2_7
;	.\spi.c:344: P2_5 = 0;
;	assignBit
	clr	_P2_5
;	.\spi.c:345: data <<= 1;
	mov	a,r7
	add	a,r7
;	.\spi.c:346: P2_5 = (data & 0x80) ? 1 : 0;
	mov	r7,a
;	assignBit
	anl	a,#0x80
	add	a,#0xff
	mov	_P2_5,c
;	.\spi.c:347: P2_7 = 1;        
;	assignBit
	setb	_P2_7
;	.\spi.c:348: P2_7 = 0;
;	assignBit
	clr	_P2_7
;	.\spi.c:349: P2_5 = 0;
;	assignBit
	clr	_P2_5
;	.\spi.c:350: data <<= 1;
	mov	a,r7
	add	a,r7
;	.\spi.c:351: P2_5 = (data & 0x80) ? 1 : 0;
	mov	r7,a
;	assignBit
	anl	a,#0x80
	add	a,#0xff
	mov	_P2_5,c
;	.\spi.c:352: P2_7 = 1;        
;	assignBit
	setb	_P2_7
;	.\spi.c:353: P2_7 = 0;
;	assignBit
	clr	_P2_7
;	.\spi.c:354: P2_5 = 0;
;	assignBit
	clr	_P2_5
;	.\spi.c:355: data <<= 1;
	mov	a,r7
	add	a,r7
;	.\spi.c:356: P2_5 = (data & 0x80) ? 1 : 0;
	mov	r7,a
;	assignBit
	anl	a,#0x80
	add	a,#0xff
	mov	_P2_5,c
;	.\spi.c:357: P2_7 = 1;        
;	assignBit
	setb	_P2_7
;	.\spi.c:358: P2_7 = 0;
;	assignBit
	clr	_P2_7
;	.\spi.c:359: P2_5 = 0;
;	assignBit
	clr	_P2_5
;	.\spi.c:360: data <<= 1;
	mov	a,r7
	add	a,r7
;	.\spi.c:361: P2_5 = (data & 0x80) ? 1 : 0;
	mov	r7,a
;	assignBit
	anl	a,#0x80
	add	a,#0xff
	mov	_P2_5,c
;	.\spi.c:362: P2_7 = 1;        
;	assignBit
	setb	_P2_7
;	.\spi.c:363: P2_7 = 0;
;	assignBit
	clr	_P2_7
;	.\spi.c:364: P2_5 = 0;
;	assignBit
	clr	_P2_5
;	.\spi.c:365: data <<= 1;
	mov	a,r7
	add	a,r7
;	.\spi.c:366: P2_5 = (data & 0x80) ? 1 : 0;
	mov	r7,a
;	assignBit
	anl	a,#0x80
	add	a,#0xff
	mov	_P2_5,c
;	.\spi.c:367: P2_7 = 1;        
;	assignBit
	setb	_P2_7
;	.\spi.c:368: P2_7 = 0;
;	assignBit
	clr	_P2_7
;	.\spi.c:369: P2_5 = 0;
;	assignBit
	clr	_P2_5
;	.\spi.c:370: data <<= 1;
	mov	a,r7
	add	a,r7
;	.\spi.c:371: P2_5 = (data & 0x80) ? 1 : 0;
;	assignBit
	anl	a,#0x80
	add	a,#0xff
	mov	_P2_5,c
;	.\spi.c:372: P2_7 = 1;        
;	assignBit
	setb	_P2_7
;	.\spi.c:373: P2_7 = 0;
;	assignBit
	clr	_P2_7
;	.\spi.c:374: P2_5 = 0;
;	assignBit
	clr	_P2_5
;	.\spi.c:375: data <<= 1;
;	.\spi.c:376: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'shift_out'
;------------------------------------------------------------
;data                      Allocated to registers r6 
;------------------------------------------------------------
;	.\spi.c:378: unsigned char shift_out(void){
;	-----------------------------------------
;	 function shift_out
;	-----------------------------------------
_shift_out:
;	.\spi.c:381: P2_7 = 1;
;	assignBit
	setb	_P2_7
;	.\spi.c:382: data |= P2_4;
	mov	c,_P2_4
	clr	a
	rlc	a
	mov	r7,a
;	.\spi.c:383: P2_7 = 0;
;	assignBit
	clr	_P2_7
;	.\spi.c:384: data <<= 1;
	mov	a,r7
	add	a,r7
	mov	r7,a
;	.\spi.c:385: P2_7 = 1;
;	assignBit
	setb	_P2_7
;	.\spi.c:386: data |= P2_4;
	mov	c,_P2_4
	clr	a
	rlc	a
	mov	r6,a
	mov	a,r7
	orl	ar6,a
;	.\spi.c:387: P2_7 = 0;
;	assignBit
	clr	_P2_7
;	.\spi.c:388: data <<= 1;
	mov	a,r6
	add	a,r6
	mov	r6,a
;	.\spi.c:389: P2_7 = 1;
;	assignBit
	setb	_P2_7
;	.\spi.c:390: data |= P2_4;
	mov	c,_P2_4
	clr	a
	rlc	a
	mov	r7,a
	mov	a,r6
	orl	ar7,a
;	.\spi.c:391: P2_7 = 0;
;	assignBit
	clr	_P2_7
;	.\spi.c:392: data <<= 1;
	mov	a,r7
	add	a,r7
	mov	r7,a
;	.\spi.c:393: P2_7 = 1;
;	assignBit
	setb	_P2_7
;	.\spi.c:394: data |= P2_4;
	mov	c,_P2_4
	clr	a
	rlc	a
	mov	r6,a
	mov	a,r7
	orl	ar6,a
;	.\spi.c:395: P2_7 = 0;
;	assignBit
	clr	_P2_7
;	.\spi.c:396: data <<= 1;
	mov	a,r6
	add	a,r6
	mov	r6,a
;	.\spi.c:397: P2_7 = 1;
;	assignBit
	setb	_P2_7
;	.\spi.c:398: data |= P2_4;
	mov	c,_P2_4
	clr	a
	rlc	a
	orl	ar6,a
;	.\spi.c:399: P2_7 = 0;
;	assignBit
	clr	_P2_7
;	.\spi.c:400: data <<= 1;
	mov	a,r6
	add	a,r6
	mov	r6,a
;	.\spi.c:401: P2_7 = 1;
;	assignBit
	setb	_P2_7
;	.\spi.c:402: data |= P2_4;
	mov	c,_P2_4
	clr	a
	rlc	a
	mov	r7,a
	mov	a,r6
	orl	ar7,a
;	.\spi.c:403: P2_7 = 0;
;	assignBit
	clr	_P2_7
;	.\spi.c:404: data <<= 1;
	mov	a,r7
	add	a,r7
	mov	r7,a
;	.\spi.c:405: P2_7 = 1;
;	assignBit
	setb	_P2_7
;	.\spi.c:406: data |= P2_4;
	mov	c,_P2_4
	clr	a
	rlc	a
	mov	r6,a
	mov	a,r7
	orl	ar6,a
;	.\spi.c:407: P2_7 = 0;
;	assignBit
	clr	_P2_7
;	.\spi.c:408: data <<= 1;
	mov	a,r6
	add	a,r6
	mov	r6,a
;	.\spi.c:409: P2_7 = 1;
;	assignBit
	setb	_P2_7
;	.\spi.c:410: data |= P2_4;
	mov	c,_P2_4
	clr	a
	rlc	a
	orl	a,r6
	mov	dpl,a
;	.\spi.c:411: P2_7 = 0;
;	assignBit
	clr	_P2_7
;	.\spi.c:412: return data;
;	.\spi.c:413: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
