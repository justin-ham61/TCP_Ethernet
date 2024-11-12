;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (MINGW32)
;--------------------------------------------------------
	.module read
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _get_2
	.globl _send_2
	.globl _send_1
	.globl _end
	.globl _begin
	.globl _asm_shift_in_2
	.globl _asm_shift_out_2
	.globl _shift_out
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
	.globl _read_RX_buffer
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
_read_RX_buffer_socket_10000_21:
	.ds 3
_read_RX_buffer_p1_20001_28:
	.ds 2
_read_RX_buffer_i_30001_29:
	.ds 2
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
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
;Allocation info for local variables in function 'read_RX_buffer'
;------------------------------------------------------------
;socket                    Allocated with name '_read_RX_buffer_socket_10000_21'
;ret                       Allocated to registers r4 
;i                         Allocated to registers r3 
;p1                        Allocated with name '_read_RX_buffer_p1_20001_28'
;i                         Allocated with name '_read_RX_buffer_i_30001_29'
;i                         Allocated to registers r6 r7 
;------------------------------------------------------------
;	.\read.c:8: unsigned char read_RX_buffer(unsigned char *socket){
;	-----------------------------------------
;	 function read_RX_buffer
;	-----------------------------------------
_read_RX_buffer:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	.\read.c:9: unsigned char ret = 0;
;	.\read.c:11: switch (*socket)
	mov	_read_RX_buffer_socket_10000_21,dpl
	mov	(_read_RX_buffer_socket_10000_21 + 1),dph
	mov	(_read_RX_buffer_socket_10000_21 + 2),b
	mov	r4,#0x00
	lcall	__gptrget
	mov	r3,a
	jz	00101$
;	.\read.c:13: case 0:
	cjne	r3,#0x01,00104$
	sjmp	00102$
00101$:
;	.\read.c:14: rw_ptr = get_2(0x0028, 0x08);
	mov	_get_2_PARM_2,#0x08
	mov	(_get_2_PARM_2 + 1),#0x00
	mov	dptr,#0x0028
	push	ar4
	lcall	_get_2
	mov	_rw_ptr,dpl
	mov	(_rw_ptr + 1),dph
;	.\read.c:15: rw_size = get_2(0x0026, 0x08);
	mov	_get_2_PARM_2,#0x08
	mov	(_get_2_PARM_2 + 1),#0x00
	mov	dptr,#0x0026
	lcall	_get_2
	mov	_rw_size,dpl
	mov	(_rw_size + 1),dph
	pop	ar4
;	.\read.c:16: break;
;	.\read.c:17: case 1:
	sjmp	00104$
00102$:
;	.\read.c:18: rw_ptr = get_2(0x0028, 0x28);
	mov	_get_2_PARM_2,#0x28
	mov	(_get_2_PARM_2 + 1),#0x00
	mov	dptr,#0x0028
	push	ar4
	lcall	_get_2
	mov	_rw_ptr,dpl
	mov	(_rw_ptr + 1),dph
;	.\read.c:19: rw_size = get_2(0x0026, 0x28);
	mov	_get_2_PARM_2,#0x28
	mov	(_get_2_PARM_2 + 1),#0x00
	mov	dptr,#0x0026
	lcall	_get_2
	mov	_rw_size,dpl
	mov	(_rw_size + 1),dph
	pop	ar4
;	.\read.c:23: }
00104$:
;	.\read.c:25: begin();
	push	ar4
	lcall	_begin
;	.\read.c:26: asm_shift_in_2(GET_HIGH_BITS(rw_ptr));
	mov	dpl,(_rw_ptr + 1)
	lcall	_asm_shift_in_2
;	.\read.c:27: asm_shift_in_2(GET_LOW_BITS(rw_ptr));
	mov	dpl,_rw_ptr
	lcall	_asm_shift_in_2
	pop	ar4
;	.\read.c:29: switch (*socket)
	mov	dpl,_read_RX_buffer_socket_10000_21
	mov	dph,(_read_RX_buffer_socket_10000_21 + 1)
	mov	b,(_read_RX_buffer_socket_10000_21 + 2)
	lcall	__gptrget
	mov	r3,a
	jz	00105$
;	.\read.c:31: case 0:
	cjne	r3,#0x01,00108$
	sjmp	00106$
00105$:
;	.\read.c:33: asm_shift_in_2(0x18);
	mov	dpl, #0x18
	push	ar4
	lcall	_asm_shift_in_2
	pop	ar4
;	.\read.c:34: break;
;	.\read.c:35: case 1: 
	sjmp	00108$
00106$:
;	.\read.c:37: asm_shift_in_2(0x38);
	mov	dpl, #0x38
	push	ar4
	lcall	_asm_shift_in_2
	pop	ar4
;	.\read.c:41: }
00108$:
;	.\read.c:43: switch (*socket){
	mov	dpl,_read_RX_buffer_socket_10000_21
	mov	dph,(_read_RX_buffer_socket_10000_21 + 1)
	mov	b,(_read_RX_buffer_socket_10000_21 + 2)
	lcall	__gptrget
	mov	r3,a
	jz	00142$
	cjne	r3,#0x01,00255$
	ljmp	00114$
00255$:
	ljmp	00119$
;	.\read.c:45: for(int i = 0; i < 6; i++){
00142$:
	mov	r3,#0x00
00125$:
	cjne	r3,#0x06,00256$
00256$:
	jnc	00110$
;	.\read.c:46: shift_out();
	push	ar3
	lcall	_shift_out
	pop	ar3
;	.\read.c:45: for(int i = 0; i < 6; i++){
	inc	r3
	sjmp	00125$
00110$:
;	.\read.c:50: int p1 = asm_shift_out_2();
	lcall	_asm_shift_out_2
	mov	r3, dpl
	mov	r2,#0x00
;	.\read.c:51: p1 <<= 8;
	mov	(_read_RX_buffer_p1_20001_28 + 1),r3
	mov	_read_RX_buffer_p1_20001_28,r2
;	.\read.c:53: p1 |= asm_shift_out_2();
	lcall	_asm_shift_out_2
	mov	r3, dpl
	mov	r2,#0x00
	mov	a,(_read_RX_buffer_p1_20001_28 + 1)
	orl	ar2,a
;	.\read.c:55: P2_1 = 0;
;	assignBit
	clr	_P2_1
;	.\read.c:56: for(int i = 0; i < p1; i++){
	clr	a
	mov	_read_RX_buffer_i_30001_29,a
	mov	(_read_RX_buffer_i_30001_29 + 1),a
00128$:
	clr	c
	mov	a,_read_RX_buffer_i_30001_29
	subb	a,r3
	mov	a,(_read_RX_buffer_i_30001_29 + 1)
	xrl	a,#0x80
	mov	b,r2
	xrl	b,#0x80
	subb	a,b
	jnc	00113$
;	.\read.c:58: buffer[i] = asm_shift_out_2();
	mov	a,_read_RX_buffer_i_30001_29
	add	a, #_buffer
	mov	r1,a
	push	ar3
	push	ar2
	push	ar1
	lcall	_asm_shift_out_2
	mov	a, dpl
	pop	ar1
	pop	ar2
	pop	ar3
	mov	@r1,a
;	.\read.c:59: if(i >= buffer_size){
	mov	r5,_buffer_size
	mov	r7,#0x00
	clr	c
	mov	a,_read_RX_buffer_i_30001_29
	subb	a,r5
	mov	a,(_read_RX_buffer_i_30001_29 + 1)
	xrl	a,#0x80
	mov	b,r7
	xrl	b,#0x80
	subb	a,b
	jnc	00113$
;	.\read.c:56: for(int i = 0; i < p1; i++){
	inc	_read_RX_buffer_i_30001_29
	clr	a
	cjne	a,_read_RX_buffer_i_30001_29,00128$
	inc	(_read_RX_buffer_i_30001_29 + 1)
	sjmp	00128$
00113$:
;	.\read.c:63: P2_1 = 1;
;	assignBit
	setb	_P2_1
;	.\read.c:64: ret = p1;
	mov	ar4,r3
;	.\read.c:65: break;
;	.\read.c:66: case 1:
	sjmp	00119$
00114$:
;	.\read.c:67: P2_1 = 0;
;	assignBit
	clr	_P2_1
;	.\read.c:68: for(int i = 0; i < rw_size; i++){
	mov	r6,#0x00
	mov	r7,#0x00
00131$:
	clr	c
	mov	a,r6
	subb	a,_rw_size
	mov	a,r7
	xrl	a,#0x80
	mov	b,(_rw_size + 1)
	xrl	b,#0x80
	subb	a,b
	jnc	00117$
;	.\read.c:70: buffer[i] = asm_shift_out_2();
	mov	a,r6
	add	a, #_buffer
	mov	r1,a
	push	ar7
	push	ar6
	push	ar1
	lcall	_asm_shift_out_2
	mov	a, dpl
	pop	ar1
	pop	ar6
	pop	ar7
	mov	@r1,a
;	.\read.c:71: if(i >= buffer_size){
	mov	r3,_buffer_size
	mov	r5,#0x00
	clr	c
	mov	a,r6
	subb	a,r3
	mov	a,r7
	xrl	a,#0x80
	mov	b,r5
	xrl	b,#0x80
	subb	a,b
	jnc	00117$
;	.\read.c:68: for(int i = 0; i < rw_size; i++){
	inc	r6
	cjne	r6,#0x00,00131$
	inc	r7
	sjmp	00131$
00117$:
;	.\read.c:75: P2_1 = 1;
;	assignBit
	setb	_P2_1
;	.\read.c:76: ret = rw_size;
	mov	r4,_rw_size
;	.\read.c:80: }
00119$:
;	.\read.c:81: end();
	push	ar4
	lcall	_end
	pop	ar4
;	.\read.c:83: rw_ptr += rw_size;
	mov	a,_rw_size
	add	a, _rw_ptr
	mov	_rw_ptr,a
	mov	a,(_rw_size + 1)
	addc	a, (_rw_ptr + 1)
	mov	(_rw_ptr + 1),a
;	.\read.c:85: switch (*socket)
	mov	dpl,_read_RX_buffer_socket_10000_21
	mov	dph,(_read_RX_buffer_socket_10000_21 + 1)
	mov	b,(_read_RX_buffer_socket_10000_21 + 2)
	lcall	__gptrget
	mov	r7,a
	jz	00120$
;	.\read.c:87: case 0:
	cjne	r7,#0x01,00123$
	sjmp	00121$
00120$:
;	.\read.c:88: send_2(0x0028, 0x0C, GET_HIGH_BITS(rw_ptr), GET_LOW_BITS(rw_ptr));
	mov	a,(_rw_ptr + 1)
	mov	_send_2_PARM_3,a
	rlc	a
	subb	a,acc
	mov	(_send_2_PARM_3 + 1),a
	mov	_send_2_PARM_4,_rw_ptr
	mov	(_send_2_PARM_4 + 1),#0x00
	mov	_send_2_PARM_2,#0x0c
	mov	(_send_2_PARM_2 + 1),#0x00
	mov	dptr,#0x0028
	push	ar4
	lcall	_send_2
;	.\read.c:89: send_1(0x0001, 0x0C, 0x40);
	mov	_send_1_PARM_2,#0x0c
	mov	(_send_1_PARM_2 + 1),#0x00
	mov	_send_1_PARM_3,#0x40
	mov	(_send_1_PARM_3 + 1),#0x00
	mov	dptr,#0x0001
	lcall	_send_1
	pop	ar4
;	.\read.c:90: break;
;	.\read.c:91: case 1: 
	sjmp	00123$
00121$:
;	.\read.c:92: send_2(0x0028, 0x2C, GET_HIGH_BITS(rw_ptr), GET_LOW_BITS(rw_ptr));
	mov	a,(_rw_ptr + 1)
	mov	_send_2_PARM_3,a
	rlc	a
	subb	a,acc
	mov	(_send_2_PARM_3 + 1),a
	mov	_send_2_PARM_4,_rw_ptr
	mov	(_send_2_PARM_4 + 1),#0x00
	mov	_send_2_PARM_2,#0x2c
	mov	(_send_2_PARM_2 + 1),#0x00
	mov	dptr,#0x0028
	push	ar4
	lcall	_send_2
;	.\read.c:93: send_1(0x0001, 0x2C, 0x40);
	mov	_send_1_PARM_2,#0x2c
	mov	(_send_1_PARM_2 + 1),#0x00
	mov	_send_1_PARM_3,#0x40
	mov	(_send_1_PARM_3 + 1),#0x00
	mov	dptr,#0x0001
	lcall	_send_1
	pop	ar4
;	.\read.c:97: }
00123$:
;	.\read.c:99: return ret;
	mov	dpl, r4
;	.\read.c:100: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
