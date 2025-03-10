;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (MINGW32)
;--------------------------------------------------------
	.module write
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _get_2
	.globl _send_2
	.globl _end
	.globl _begin
	.globl _asm_shift_in_2
	.globl _shift_in
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
	.globl _write_to_buffer_PARM_2
	.globl _write_to_buffer
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
_write_to_buffer_PARM_2:
	.ds 3
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
;Allocation info for local variables in function 'write_to_buffer'
;------------------------------------------------------------
;str                       Allocated with name '_write_to_buffer_PARM_2'
;socket                    Allocated to registers r7 
;i                         Allocated to registers r5 
;------------------------------------------------------------
;	.\write.c:8: void write_to_buffer(unsigned char socket, char* str){
;	-----------------------------------------
;	 function write_to_buffer
;	-----------------------------------------
_write_to_buffer:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	mov	r7, dpl
;	.\write.c:10: switch (socket)
	clr	a
	cjne	r7,#0x00,00167$
	inc	a
00167$:
	mov	r6,a
	jnz	00101$
;	.\write.c:12: case 0:
	cjne	r7,#0x01,00103$
	sjmp	00102$
00101$:
;	.\write.c:13: rw_ptr = get_2(0x0024, 0x08);
	mov	_get_2_PARM_2,#0x08
	mov	(_get_2_PARM_2 + 1),#0x00
	mov	dptr,#0x0024
	push	ar7
	push	ar6
	lcall	_get_2
	mov	_rw_ptr,dpl
	mov	(_rw_ptr + 1),dph
	pop	ar6
	pop	ar7
;	.\write.c:14: break;
;	.\write.c:15: case 1: 
	sjmp	00104$
00102$:
;	.\write.c:16: rw_ptr = get_2(0x0024, 0x28);
	mov	_get_2_PARM_2,#0x28
	mov	(_get_2_PARM_2 + 1),#0x00
	mov	dptr,#0x0024
	push	ar7
	push	ar6
	lcall	_get_2
	mov	_rw_ptr,dpl
	mov	(_rw_ptr + 1),dph
	pop	ar6
	pop	ar7
;	.\write.c:17: break;
;	.\write.c:18: default:
	sjmp	00104$
00103$:
;	.\write.c:19: rw_ptr = 0;
	clr	a
	mov	_rw_ptr,a
	mov	(_rw_ptr + 1),a
;	.\write.c:21: }
00104$:
;	.\write.c:22: begin();
	push	ar7
	push	ar6
	lcall	_begin
;	.\write.c:23: asm_shift_in_2(GET_HIGH_BITS(rw_ptr));
	mov	dpl,(_rw_ptr + 1)
	lcall	_asm_shift_in_2
;	.\write.c:25: asm_shift_in_2(GET_LOW_BITS(rw_ptr));
	mov	dpl,_rw_ptr
	lcall	_asm_shift_in_2
	pop	ar6
	pop	ar7
;	.\write.c:27: switch (socket)
	mov	a,r6
	jnz	00105$
;	.\write.c:29: case 0:
	cjne	r7,#0x01,00108$
	sjmp	00106$
00105$:
;	.\write.c:30: shift_in(0x14);
	mov	dpl, #0x14
	push	ar7
	push	ar6
	lcall	_shift_in
	pop	ar6
	pop	ar7
;	.\write.c:31: break;
;	.\write.c:32: case 1: 
	sjmp	00108$
00106$:
;	.\write.c:33: shift_in(0x34);
	mov	dpl, #0x34
	push	ar7
	push	ar6
	lcall	_shift_in
	pop	ar6
	pop	ar7
;	.\write.c:36: }
00108$:
;	.\write.c:38: P2_0 = 0;
;	assignBit
	clr	_P2_0
;	.\write.c:39: while(str[i] != '\0'){
	mov	r5,#0x00
00109$:
	mov	a,r5
	add	a, _write_to_buffer_PARM_2
	mov	r2,a
	clr	a
	addc	a, (_write_to_buffer_PARM_2 + 1)
	mov	r3,a
	mov	r4,(_write_to_buffer_PARM_2 + 2)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r4,a
	jz	00111$
;	.\write.c:40: asm_shift_in_2(str[i]);
	mov	dpl, r4
	push	ar7
	push	ar6
	push	ar5
	lcall	_asm_shift_in_2
	pop	ar5
	pop	ar6
	pop	ar7
;	.\write.c:42: i++;
	inc	r5
	sjmp	00109$
00111$:
;	.\write.c:44: P2_0 = 1;
;	assignBit
	setb	_P2_0
;	.\write.c:46: rw_ptr += i;
	mov	r4,#0x00
	mov	a,r5
	add	a, _rw_ptr
	mov	_rw_ptr,a
	mov	a,r4
	addc	a, (_rw_ptr + 1)
	mov	(_rw_ptr + 1),a
;	.\write.c:47: end();
	push	ar7
	push	ar6
	lcall	_end
	pop	ar6
	pop	ar7
;	.\write.c:50: switch (socket)
	mov	a,r6
	jnz	00112$
;	.\write.c:52: case 0:
	cjne	r7,#0x01,00116$
	sjmp	00113$
00112$:
;	.\write.c:53: send_2(0x0024, 0x0C, GET_HIGH_BITS(rw_ptr), GET_LOW_BITS(rw_ptr));
	mov	a,(_rw_ptr + 1)
	mov	_send_2_PARM_3,a
	rlc	a
	subb	a,acc
	mov	(_send_2_PARM_3 + 1),a
	mov	_send_2_PARM_4,_rw_ptr
	mov	(_send_2_PARM_4 + 1),#0x00
	mov	_send_2_PARM_2,#0x0c
	mov	(_send_2_PARM_2 + 1),#0x00
	mov	dptr,#0x0024
;	.\write.c:54: break;
;	.\write.c:55: case 1:
	ljmp	_send_2
00113$:
;	.\write.c:56: send_2(0x0024, 0x2C, GET_HIGH_BITS(rw_ptr), GET_LOW_BITS(rw_ptr));
	mov	a,(_rw_ptr + 1)
	mov	_send_2_PARM_3,a
	rlc	a
	subb	a,acc
	mov	(_send_2_PARM_3 + 1),a
	mov	_send_2_PARM_4,_rw_ptr
	mov	(_send_2_PARM_4 + 1),#0x00
	mov	_send_2_PARM_2,#0x2c
	mov	(_send_2_PARM_2 + 1),#0x00
	mov	dptr,#0x0024
;	.\write.c:60: }
;	.\write.c:62: }
	ljmp	_send_2
00116$:
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
