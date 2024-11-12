;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (MINGW32)
;--------------------------------------------------------
	.module w5500
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _end
	.globl _begin
	.globl _asm_shift_in_2
	.globl _asm_shift_out_2
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
	.globl _set_mac_adr_PARM_6
	.globl _set_mac_adr_PARM_5
	.globl _set_mac_adr_PARM_4
	.globl _set_mac_adr_PARM_3
	.globl _set_mac_adr_PARM_2
	.globl _get_2_PARM_2
	.globl _send_4_PARM_6
	.globl _send_4_PARM_5
	.globl _send_4_PARM_4
	.globl _send_4_PARM_3
	.globl _send_4_PARM_2
	.globl _send_2_PARM_4
	.globl _send_2_PARM_3
	.globl _send_2_PARM_2
	.globl _send_1_PARM_3
	.globl _send_1_PARM_2
	.globl _send_1
	.globl _send_2
	.globl _send_4
	.globl _get_2
	.globl _set_mac_adr
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
_send_1_PARM_2:
	.ds 2
_send_1_PARM_3:
	.ds 2
_send_2_PARM_2:
	.ds 2
_send_2_PARM_3:
	.ds 2
_send_2_PARM_4:
	.ds 2
_send_4_PARM_2:
	.ds 2
_send_4_PARM_3:
	.ds 2
_send_4_PARM_4:
	.ds 2
_send_4_PARM_5:
	.ds 2
_send_4_PARM_6:
	.ds 2
_get_2_PARM_2:
	.ds 2
_set_mac_adr_PARM_2:
	.ds 2
_set_mac_adr_PARM_3:
	.ds 2
_set_mac_adr_PARM_4:
	.ds 2
_set_mac_adr_PARM_5:
	.ds 2
_set_mac_adr_PARM_6:
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
;Allocation info for local variables in function 'send_1'
;------------------------------------------------------------
;cntl                      Allocated with name '_send_1_PARM_2'
;w                         Allocated with name '_send_1_PARM_3'
;adr                       Allocated to registers r6 r7 
;------------------------------------------------------------
;	.\w5500.c:8: void send_1(int adr, int cntl, int w){
;	-----------------------------------------
;	 function send_1
;	-----------------------------------------
_send_1:
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
;	.\w5500.c:9: begin();
	push	ar7
	push	ar6
	lcall	_begin
	pop	ar6
	pop	ar7
;	.\w5500.c:10: asm_shift_in_2(adr >> 8);
	mov	dpl,r7
	push	ar7
	push	ar6
	lcall	_asm_shift_in_2
	pop	ar6
	pop	ar7
;	.\w5500.c:11: asm_shift_in_2(adr & 0x00FF);
	mov	dpl,r6
	lcall	_asm_shift_in_2
;	.\w5500.c:12: asm_shift_in_2(cntl);
	mov	dpl,_send_1_PARM_2
	lcall	_asm_shift_in_2
;	.\w5500.c:13: asm_shift_in_2(w);
	mov	dpl,_send_1_PARM_3
	lcall	_asm_shift_in_2
;	.\w5500.c:20: end();
;	.\w5500.c:21: }
	ljmp	_end
;------------------------------------------------------------
;Allocation info for local variables in function 'send_2'
;------------------------------------------------------------
;cntl                      Allocated with name '_send_2_PARM_2'
;w                         Allocated with name '_send_2_PARM_3'
;x                         Allocated with name '_send_2_PARM_4'
;adr                       Allocated to registers r6 r7 
;------------------------------------------------------------
;	.\w5500.c:23: void send_2(int adr, int cntl, int w, int x){
;	-----------------------------------------
;	 function send_2
;	-----------------------------------------
_send_2:
	mov	r6, dpl
	mov	r7, dph
;	.\w5500.c:24: begin();
	push	ar7
	push	ar6
	lcall	_begin
	pop	ar6
	pop	ar7
;	.\w5500.c:25: asm_shift_in_2(adr >> 8);
	mov	dpl,r7
	push	ar7
	push	ar6
	lcall	_asm_shift_in_2
	pop	ar6
	pop	ar7
;	.\w5500.c:26: asm_shift_in_2(adr & 0x00FF);
	mov	dpl,r6
	lcall	_asm_shift_in_2
;	.\w5500.c:27: asm_shift_in_2(cntl);
	mov	dpl,_send_2_PARM_2
	lcall	_asm_shift_in_2
;	.\w5500.c:28: asm_shift_in_2(w);
	mov	dpl,_send_2_PARM_3
	lcall	_asm_shift_in_2
;	.\w5500.c:29: asm_shift_in_2(x);
	mov	dpl,_send_2_PARM_4
	lcall	_asm_shift_in_2
;	.\w5500.c:36: end();
;	.\w5500.c:37: }
	ljmp	_end
;------------------------------------------------------------
;Allocation info for local variables in function 'send_4'
;------------------------------------------------------------
;cntl                      Allocated with name '_send_4_PARM_2'
;w                         Allocated with name '_send_4_PARM_3'
;x                         Allocated with name '_send_4_PARM_4'
;y                         Allocated with name '_send_4_PARM_5'
;z                         Allocated with name '_send_4_PARM_6'
;adr                       Allocated to registers r6 r7 
;------------------------------------------------------------
;	.\w5500.c:39: void send_4(int adr, int cntl, int w, int x, int y, int z){
;	-----------------------------------------
;	 function send_4
;	-----------------------------------------
_send_4:
	mov	r6, dpl
	mov	r7, dph
;	.\w5500.c:40: begin();
	push	ar7
	push	ar6
	lcall	_begin
	pop	ar6
	pop	ar7
;	.\w5500.c:41: asm_shift_in_2(adr >> 8);
	mov	dpl,r7
	push	ar7
	push	ar6
	lcall	_asm_shift_in_2
	pop	ar6
	pop	ar7
;	.\w5500.c:42: asm_shift_in_2(adr & 0x00FF);
	mov	dpl,r6
	lcall	_asm_shift_in_2
;	.\w5500.c:43: asm_shift_in_2(cntl);
	mov	dpl,_send_4_PARM_2
	lcall	_asm_shift_in_2
;	.\w5500.c:44: asm_shift_in_2(w);
	mov	dpl,_send_4_PARM_3
	lcall	_asm_shift_in_2
;	.\w5500.c:45: asm_shift_in_2(x);
	mov	dpl,_send_4_PARM_4
	lcall	_asm_shift_in_2
;	.\w5500.c:46: asm_shift_in_2(y);
	mov	dpl,_send_4_PARM_5
	lcall	_asm_shift_in_2
;	.\w5500.c:47: asm_shift_in_2(z);
	mov	dpl,_send_4_PARM_6
	lcall	_asm_shift_in_2
;	.\w5500.c:56: end();
;	.\w5500.c:57: }
	ljmp	_end
;------------------------------------------------------------
;Allocation info for local variables in function 'get_2'
;------------------------------------------------------------
;cntl                      Allocated with name '_get_2_PARM_2'
;adr                       Allocated to registers r6 r7 
;ret                       Allocated to registers r7 r6 
;------------------------------------------------------------
;	.\w5500.c:59: int get_2(int adr, int cntl){
;	-----------------------------------------
;	 function get_2
;	-----------------------------------------
_get_2:
	mov	r6, dpl
	mov	r7, dph
;	.\w5500.c:61: begin();
	push	ar7
	push	ar6
	lcall	_begin
	pop	ar6
	pop	ar7
;	.\w5500.c:62: asm_shift_in_2(adr>>8);
	mov	dpl,r7
	push	ar7
	push	ar6
	lcall	_asm_shift_in_2
	pop	ar6
	pop	ar7
;	.\w5500.c:63: asm_shift_in_2(adr&0x00FF);
	mov	dpl,r6
	lcall	_asm_shift_in_2
;	.\w5500.c:64: asm_shift_in_2(cntl);
	mov	dpl,_get_2_PARM_2
	lcall	_asm_shift_in_2
;	.\w5500.c:65: ret = asm_shift_out_2();
	lcall	_asm_shift_out_2
;	.\w5500.c:66: ret<<=8;
	mov	r6,dpl
	mov	r7,#0x00
;	.\w5500.c:67: ret |= asm_shift_out_2();
	push	ar7
	push	ar6
	lcall	_asm_shift_out_2
	mov	r5, dpl
	pop	ar6
	pop	ar7
	mov	r4,#0x00
	mov	a,r5
	orl	ar7,a
	mov	a,r4
	orl	ar6,a
;	.\w5500.c:68: end();
	push	ar7
	push	ar6
	lcall	_end
	pop	ar6
	pop	ar7
;	.\w5500.c:69: return ret;
	mov	dpl, r7
	mov	dph, r6
;	.\w5500.c:70: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'set_mac_adr'
;------------------------------------------------------------
;mac2                      Allocated with name '_set_mac_adr_PARM_2'
;mac3                      Allocated with name '_set_mac_adr_PARM_3'
;mac4                      Allocated with name '_set_mac_adr_PARM_4'
;mac5                      Allocated with name '_set_mac_adr_PARM_5'
;mac6                      Allocated with name '_set_mac_adr_PARM_6'
;mac1                      Allocated to registers r6 r7 
;------------------------------------------------------------
;	.\w5500.c:72: void set_mac_adr(int mac1, int mac2, int mac3, int mac4, int mac5, int mac6){
;	-----------------------------------------
;	 function set_mac_adr
;	-----------------------------------------
_set_mac_adr:
	mov	r6, dpl
	mov	r7, dph
;	.\w5500.c:73: begin();
	push	ar7
	push	ar6
	lcall	_begin
;	.\w5500.c:74: shift_in(0x00);
	mov	dpl, #0x00
	lcall	_shift_in
;	.\w5500.c:75: shift_in(0x09);
	mov	dpl, #0x09
	lcall	_shift_in
;	.\w5500.c:76: shift_in(0x04);
	mov	dpl, #0x04
	lcall	_shift_in
	pop	ar6
	pop	ar7
;	.\w5500.c:77: shift_in(mac1);
	mov	dpl,r6
	lcall	_shift_in
;	.\w5500.c:78: shift_in(mac2);
	mov	dpl,_set_mac_adr_PARM_2
	lcall	_shift_in
;	.\w5500.c:79: shift_in(mac3);
	mov	dpl,_set_mac_adr_PARM_3
	lcall	_shift_in
;	.\w5500.c:80: shift_in(mac4);
	mov	dpl,_set_mac_adr_PARM_4
	lcall	_shift_in
;	.\w5500.c:81: shift_in(mac5);
	mov	dpl,_set_mac_adr_PARM_5
	lcall	_shift_in
;	.\w5500.c:82: shift_in(mac6);
	mov	dpl,_set_mac_adr_PARM_6
	lcall	_shift_in
;	.\w5500.c:84: end();
;	.\w5500.c:85: }
	ljmp	_end
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
