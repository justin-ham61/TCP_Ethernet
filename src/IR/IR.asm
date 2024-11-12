;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (MINGW32)
;--------------------------------------------------------
	.module IR
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _write_to_buffer
	.globl _clear_buffer
	.globl _send_1
	.globl _transmit_string
	.globl _read_RX_buffer
	.globl _end
	.globl _begin
	.globl _shift_out
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
	.globl _get_Sn_IR_PARM_2
	.globl _SIR_poll
	.globl _get_Sn_IR
	.globl _get_SIR
	.globl _process_buff
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
_SIR_poll_ir_10000_27:
	.ds 1
_SIR_poll_socket_10000_27:
	.ds 1
_get_Sn_IR_PARM_2:
	.ds 3
_get_SIR_sir_byte_10000_43:
	.ds 1
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
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
;Allocation info for local variables in function 'SIR_poll'
;------------------------------------------------------------
;ir                        Allocated with name '_SIR_poll_ir_10000_27'
;socket                    Allocated with name '_SIR_poll_socket_10000_27'
;cntl_byte                 Allocated to registers r7 
;length                    Allocated to registers 
;x                         Allocated to registers r6 
;------------------------------------------------------------
;	.\IR.c:18: void SIR_poll(void){
;	-----------------------------------------
;	 function SIR_poll
;	-----------------------------------------
_SIR_poll:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	.\IR.c:19: unsigned char ir = 0;
	mov	_SIR_poll_ir_10000_27,#0x00
;	.\IR.c:20: unsigned char socket = 0;
	mov	_SIR_poll_socket_10000_27,#0x00
;	.\IR.c:21: unsigned char cntl_byte = 0;
	mov	r7,#0x00
;	.\IR.c:22: get_SIR(&socket);
	mov	dptr,#_SIR_poll_socket_10000_27
	mov	b, #0x40
	push	ar7
	lcall	_get_SIR
;	.\IR.c:23: get_Sn_IR(socket, &ir);
	mov	r5,_SIR_poll_socket_10000_27
	mov	r6,#0x00
	mov	_get_Sn_IR_PARM_2,#_SIR_poll_ir_10000_27
	mov	(_get_Sn_IR_PARM_2 + 1),r6
	mov	(_get_Sn_IR_PARM_2 + 2),#0x40
	mov	dpl, r5
	mov	dph, r6
	lcall	_get_Sn_IR
	pop	ar7
;	.\IR.c:26: if(ir != 0){
	mov	a,_SIR_poll_ir_10000_27
	jz	00102$
;	.\IR.c:27: inactivity_counter = 0;
	mov	_inactivity_counter,#0x00
	sjmp	00103$
00102$:
;	.\IR.c:29: inactivity_counter++;
	inc	_inactivity_counter
00103$:
;	.\IR.c:32: if(P3_2 == 0){
	jnb	_P3_2,00191$
	ljmp	00127$
00191$:
;	.\IR.c:34: switch (socket)
	clr	a
	cjne	a,_SIR_poll_socket_10000_27,00192$
	sjmp	00104$
00192$:
	mov	a,#0x01
;	.\IR.c:36: case 0:
	cjne	a,_SIR_poll_socket_10000_27,00107$
	sjmp	00105$
00104$:
;	.\IR.c:37: cntl_byte = 0x0C;
	mov	r7,#0x0c
;	.\IR.c:38: break;
;	.\IR.c:39: case 1: 
	sjmp	00107$
00105$:
;	.\IR.c:40: cntl_byte = 0x2C;
	mov	r7,#0x2c
;	.\IR.c:44: }
00107$:
;	.\IR.c:48: if(ir & SN_IR_SEND_OK){
	mov	a,_SIR_poll_ir_10000_27
	mov	r6,a
	jnb	acc.4,00109$
;	.\IR.c:49: send_1(0x0002, cntl_byte, (ir & SN_IR_SEND_OK));
	mov	_send_1_PARM_2,r7
	clr	a
	mov	(_send_1_PARM_2 + 1),a
	mov	r5,a
	mov	a,#0x10
	anl	a,r6
	mov	_send_1_PARM_3,a
	mov	(_send_1_PARM_3 + 1),r5
	mov	dptr,#0x0002
	push	ar7
	lcall	_send_1
	pop	ar7
00109$:
;	.\IR.c:52: if(ir & SN_IR_TIMEOUT){
	mov	a,_SIR_poll_ir_10000_27
	jnb	acc.3,00111$
;	.\IR.c:53: send_1(0x0000, cntl_byte, 0x01);
	mov	ar5,r7
	mov	r6,#0x00
	mov	_send_1_PARM_2,r5
	mov	(_send_1_PARM_2 + 1),r6
	mov	_send_1_PARM_3,#0x01
	mov	(_send_1_PARM_3 + 1),r6
	mov	dptr,#0x0000
	push	ar7
	push	ar6
	push	ar5
	lcall	_send_1
	pop	ar5
	pop	ar6
;	.\IR.c:55: send_1(0x0001, cntl_byte, 0x01);
	mov	_send_1_PARM_2,r5
	mov	(_send_1_PARM_2 + 1),r6
	mov	_send_1_PARM_3,#0x01
	mov	(_send_1_PARM_3 + 1),#0x00
	mov	dptr,#0x0001
	push	ar6
	push	ar5
	lcall	_send_1
	pop	ar5
	pop	ar6
;	.\IR.c:57: send_1(0x0001, cntl_byte, 0x02);
	mov	_send_1_PARM_2,r5
	mov	(_send_1_PARM_2 + 1),r6
	mov	_send_1_PARM_3,#0x02
	mov	(_send_1_PARM_3 + 1),#0x00
	mov	dptr,#0x0001
	push	ar6
	push	ar5
	lcall	_send_1
	pop	ar5
	pop	ar6
;	.\IR.c:58: send_1(0x0002, cntl_byte, (ir & SN_IR_TIMEOUT));
	mov	r3,_SIR_poll_ir_10000_27
	mov	r4,#0x00
	mov	a,#0x08
	anl	a,r3
	mov	_send_1_PARM_3,a
	mov	(_send_1_PARM_3 + 1),r4
	mov	_send_1_PARM_2,r5
	mov	(_send_1_PARM_2 + 1),r6
	mov	dptr,#0x0002
	lcall	_send_1
	pop	ar7
00111$:
;	.\IR.c:61: if(ir & SN_IR_RECV){
	mov	a,_SIR_poll_ir_10000_27
	jb	acc.2,00196$
	ljmp	00121$
00196$:
;	.\IR.c:62: P2_2 = 0;
;	assignBit
	clr	_P2_2
;	.\IR.c:63: unsigned char length = read_RX_buffer(&socket);
	mov	dptr,#_SIR_poll_socket_10000_27
	mov	b, #0x40
	push	ar7
	lcall	_read_RX_buffer
;	.\IR.c:65: x = process_buff(0);
	mov	dpl, #0x00
	lcall	_process_buff
	mov	r6, dpl
	pop	ar7
;	.\IR.c:66: switch (x){
	mov	a,r6
	add	a,#0xff - 0x05
	jnc	00197$
	ljmp	00119$
00197$:
	mov	a,r6
	add	a,r6
	add	a,r6
	mov	dptr,#00198$
	jmp	@a+dptr
00198$:
	ljmp	00112$
	ljmp	00113$
	ljmp	00114$
	ljmp	00115$
	ljmp	00116$
	ljmp	00117$
;	.\IR.c:67: case 0:
00112$:
;	.\IR.c:68: transmit_string(buffer);
	mov	dptr,#_buffer
	mov	b, #0x40
	push	ar7
	lcall	_transmit_string
	pop	ar7
;	.\IR.c:69: buffer[2] = rtu + '0';
	mov	r6,_rtu
	mov	a,#0x30
	add	a, r6
	mov	(_buffer + 0x0002),a
;	.\IR.c:70: break;
	ljmp	00119$
;	.\IR.c:71: case 1:
00113$:
;	.\IR.c:72: transmit_string("No : Found");
	mov	dptr,#___str_0
	mov	b, #0x80
	push	ar7
	lcall	_transmit_string
;	.\IR.c:73: write_to_buffer(socket, "Incorrect format: \":\"");
	mov	_write_to_buffer_PARM_2,#___str_1
	mov	(_write_to_buffer_PARM_2 + 1),#(___str_1 >> 8)
	mov	(_write_to_buffer_PARM_2 + 2),#0x80
	mov	dpl, _SIR_poll_socket_10000_27
	lcall	_write_to_buffer
	pop	ar7
;	.\IR.c:74: break;
;	.\IR.c:75: case 2: 
	sjmp	00119$
00114$:
;	.\IR.c:76: transmit_string("No < found");
	mov	dptr,#___str_2
	mov	b, #0x80
	push	ar7
	lcall	_transmit_string
;	.\IR.c:77: write_to_buffer(socket, "Incorrect format: \"<\"");
	mov	_write_to_buffer_PARM_2,#___str_3
	mov	(_write_to_buffer_PARM_2 + 1),#(___str_3 >> 8)
	mov	(_write_to_buffer_PARM_2 + 2),#0x80
	mov	dpl, _SIR_poll_socket_10000_27
	lcall	_write_to_buffer
	pop	ar7
;	.\IR.c:78: break;
;	.\IR.c:79: case 3: 
	sjmp	00119$
00115$:
;	.\IR.c:80: transmit_string("No RTU Number found");
	mov	dptr,#___str_4
	mov	b, #0x80
	push	ar7
	lcall	_transmit_string
;	.\IR.c:81: write_to_buffer(socket, "Wrong RTU number");
	mov	_write_to_buffer_PARM_2,#___str_5
	mov	(_write_to_buffer_PARM_2 + 1),#(___str_5 >> 8)
	mov	(_write_to_buffer_PARM_2 + 2),#0x80
	mov	dpl, _SIR_poll_socket_10000_27
	lcall	_write_to_buffer
	pop	ar7
;	.\IR.c:82: break;
;	.\IR.c:83: case 4:
	sjmp	00119$
00116$:
;	.\IR.c:84: transmit_string("Error in message format");
	mov	dptr,#___str_6
	mov	b, #0x80
	push	ar7
	lcall	_transmit_string
;	.\IR.c:85: write_to_buffer(socket, "Error in message format");
	mov	_write_to_buffer_PARM_2,#___str_6
	mov	(_write_to_buffer_PARM_2 + 1),#(___str_6 >> 8)
	mov	(_write_to_buffer_PARM_2 + 2),#0x80
	mov	dpl, _SIR_poll_socket_10000_27
	lcall	_write_to_buffer
	pop	ar7
;	.\IR.c:86: break;
;	.\IR.c:87: case 5: 
	sjmp	00119$
00117$:
;	.\IR.c:88: transmit_string("No > found");
	mov	dptr,#___str_7
	mov	b, #0x80
	push	ar7
	lcall	_transmit_string
;	.\IR.c:89: write_to_buffer(socket, "Incorrect format: \">\"");
	mov	_write_to_buffer_PARM_2,#___str_8
	mov	(_write_to_buffer_PARM_2 + 1),#(___str_8 >> 8)
	mov	(_write_to_buffer_PARM_2 + 2),#0x80
	mov	dpl, _SIR_poll_socket_10000_27
	lcall	_write_to_buffer
	pop	ar7
;	.\IR.c:93: }
00119$:
;	.\IR.c:95: write_to_buffer(socket, &buffer[0]);
	mov	_write_to_buffer_PARM_2,#_buffer
	mov	(_write_to_buffer_PARM_2 + 1),#0x00
	mov	(_write_to_buffer_PARM_2 + 2),#0x40
	mov	dpl, _SIR_poll_socket_10000_27
	push	ar7
	lcall	_write_to_buffer
	pop	ar7
;	.\IR.c:96: send_1(0x0001, cntl_byte, 0x20);
	mov	ar5,r7
	mov	r6,#0x00
	mov	_send_1_PARM_2,r5
	mov	(_send_1_PARM_2 + 1),r6
	mov	_send_1_PARM_3,#0x20
	mov	(_send_1_PARM_3 + 1),r6
	mov	dptr,#0x0001
	push	ar7
	push	ar6
	push	ar5
	lcall	_send_1
;	.\IR.c:97: P2_2 = 1;
;	assignBit
	setb	_P2_2
;	.\IR.c:98: transmit_string("\r\n");
	mov	dptr,#___str_9
	mov	b, #0x80
	lcall	_transmit_string
;	.\IR.c:99: clear_buffer();
	lcall	_clear_buffer
	pop	ar5
	pop	ar6
;	.\IR.c:100: send_1(0x0002, cntl_byte, (ir & SN_IR_RECV));
	mov	r3,_SIR_poll_ir_10000_27
	mov	r4,#0x00
	mov	a,#0x04
	anl	a,r3
	mov	_send_1_PARM_3,a
	mov	(_send_1_PARM_3 + 1),r4
	mov	_send_1_PARM_2,r5
	mov	(_send_1_PARM_2 + 1),r6
	mov	dptr,#0x0002
	lcall	_send_1
	pop	ar7
00121$:
;	.\IR.c:103: if(ir & SN_IR_DISCON){
	mov	a,_SIR_poll_ir_10000_27
	jnb	acc.1,00123$
;	.\IR.c:104: send_1(0x0001, cntl_byte, 0x08);
	mov	ar5,r7
	mov	r6,#0x00
	mov	_send_1_PARM_2,r5
	mov	(_send_1_PARM_2 + 1),r6
	mov	_send_1_PARM_3,#0x08
	mov	(_send_1_PARM_3 + 1),r6
	mov	dptr,#0x0001
	push	ar7
	push	ar6
	push	ar5
	lcall	_send_1
	pop	ar5
	pop	ar6
;	.\IR.c:105: send_1(0x0002, cntl_byte, (ir & SN_IR_DISCON));
	mov	r3,_SIR_poll_ir_10000_27
	mov	r4,#0x00
	mov	a,#0x02
	anl	a,r3
	mov	_send_1_PARM_3,a
	mov	(_send_1_PARM_3 + 1),r4
	mov	_send_1_PARM_2,r5
	mov	(_send_1_PARM_2 + 1),r6
	mov	dptr,#0x0002
	lcall	_send_1
	pop	ar7
00123$:
;	.\IR.c:108: if(ir & SN_IR_CON){
	mov	a,_SIR_poll_ir_10000_27
	mov	r6,a
	jnb	acc.0,00125$
;	.\IR.c:109: send_1(0x0002, cntl_byte, (ir & SN_IR_CON));
	mov	_send_1_PARM_2,r7
	clr	a
	mov	(_send_1_PARM_2 + 1),a
	mov	r7,a
	mov	a,#0x01
	anl	a,r6
	mov	_send_1_PARM_3,a
	mov	(_send_1_PARM_3 + 1),r7
	mov	dptr,#0x0002
	lcall	_send_1
00125$:
;	.\IR.c:112: P1 = 0x00;
	mov	_P1,#0x00
00127$:
;	.\IR.c:114: P1 = 0xFF;
	mov	_P1,#0xff
;	.\IR.c:115: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'get_Sn_IR'
;------------------------------------------------------------
;ir                        Allocated with name '_get_Sn_IR_PARM_2'
;socket                    Allocated to registers r6 r7 
;------------------------------------------------------------
;	.\IR.c:117: void get_Sn_IR(int socket, unsigned char *ir){
;	-----------------------------------------
;	 function get_Sn_IR
;	-----------------------------------------
_get_Sn_IR:
	mov	r6, dpl
	mov	r7, dph
;	.\IR.c:118: begin();
	push	ar7
	push	ar6
	lcall	_begin
;	.\IR.c:119: shift_in(0x00);
	mov	dpl, #0x00
	lcall	_shift_in
;	.\IR.c:120: shift_in(0x02);
	mov	dpl, #0x02
	lcall	_shift_in
	pop	ar6
	pop	ar7
;	.\IR.c:121: switch (socket)
	cjne	r6,#0x00,00119$
	cjne	r7,#0x00,00119$
	sjmp	00101$
00119$:
;	.\IR.c:123: case 0:
	cjne	r6,#0x01,00104$
	cjne	r7,#0x00,00104$
	sjmp	00102$
00101$:
;	.\IR.c:124: shift_in(0x08);
	mov	dpl, #0x08
	lcall	_shift_in
;	.\IR.c:125: break;
;	.\IR.c:126: case 1:
	sjmp	00104$
00102$:
;	.\IR.c:127: shift_in(0x28);
	mov	dpl, #0x28
	lcall	_shift_in
;	.\IR.c:130: }
00104$:
;	.\IR.c:131: *ir = shift_out();
	mov	r5,_get_Sn_IR_PARM_2
	mov	r6,(_get_Sn_IR_PARM_2 + 1)
	mov	r7,(_get_Sn_IR_PARM_2 + 2)
	push	ar7
	push	ar6
	push	ar5
	lcall	_shift_out
	mov	r4, dpl
	pop	ar5
	pop	ar6
	pop	ar7
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r4
	lcall	__gptrput
;	.\IR.c:132: end();
;	.\IR.c:133: }
	ljmp	_end
;------------------------------------------------------------
;Allocation info for local variables in function 'get_SIR'
;------------------------------------------------------------
;socket                    Allocated to registers r5 r6 r7 
;sir_byte                  Allocated with name '_get_SIR_sir_byte_10000_43'
;i                         Allocated to registers r3 
;------------------------------------------------------------
;	.\IR.c:135: void get_SIR(unsigned char *socket){
;	-----------------------------------------
;	 function get_SIR
;	-----------------------------------------
_get_SIR:
	mov	r5, dpl
	mov	r6, dph
	mov	r7, b
;	.\IR.c:137: begin();
	push	ar7
	push	ar6
	push	ar5
	lcall	_begin
;	.\IR.c:138: shift_in(0x00);
	mov	dpl, #0x00
	lcall	_shift_in
;	.\IR.c:139: shift_in(0x17);
	mov	dpl, #0x17
	lcall	_shift_in
;	.\IR.c:140: shift_in(0x00);
	mov	dpl, #0x00
	lcall	_shift_in
;	.\IR.c:141: sir_byte = shift_out();
	lcall	_shift_out
	mov	_get_SIR_sir_byte_10000_43,dpl
	pop	ar5
	pop	ar6
	pop	ar7
;	.\IR.c:143: for(int i = 0; i < 8; i++){
	mov	r3,#0x00
00105$:
	cjne	r3,#0x08,00128$
00128$:
	jnc	00103$
;	.\IR.c:144: if(sir_byte & (1 << i)){
	mov	b,r3
	inc	b
	mov	r1,#0x01
	mov	r2,#0x00
	sjmp	00131$
00130$:
	mov	a,r1
	add	a,r1
	mov	r1,a
	mov	a,r2
	rlc	a
	mov	r2,a
00131$:
	djnz	b,00130$
	mov	r0,_get_SIR_sir_byte_10000_43
	mov	r4,#0x00
	mov	a,r0
	anl	ar1,a
	mov	a,r4
	anl	ar2,a
	mov	a,r1
	orl	a,r2
	jz	00106$
;	.\IR.c:145: *socket = i;
	mov	ar4,r3
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r4
	lcall	__gptrput
00106$:
;	.\IR.c:143: for(int i = 0; i < 8; i++){
	inc	r3
	sjmp	00105$
00103$:
;	.\IR.c:149: end();
;	.\IR.c:150: }
	ljmp	_end
;------------------------------------------------------------
;Allocation info for local variables in function 'process_buff'
;------------------------------------------------------------
;start_idx                 Allocated to registers r7 
;------------------------------------------------------------
;	.\IR.c:152: unsigned char process_buff(unsigned char start_idx){
;	-----------------------------------------
;	 function process_buff
;	-----------------------------------------
_process_buff:
;	.\IR.c:153: if(buffer[start_idx + 0] != ':'){
	mov	a,dpl
	mov	r7,a
	add	a, #_buffer
	mov	r1,a
	mov	ar6,@r1
	cjne	r6,#0x3a,00176$
	sjmp	00102$
00176$:
;	.\IR.c:154: return 1;
	mov	dpl, #0x01
	ret
00102$:
;	.\IR.c:156: if(buffer[start_idx + 1] != '<'){
	mov	a,r7
	inc	a
	add	a, #_buffer
	mov	r1,a
	mov	ar6,@r1
	cjne	r6,#0x3c,00177$
	sjmp	00104$
00177$:
;	.\IR.c:157: return 2;
	mov	dpl, #0x02
	ret
00104$:
;	.\IR.c:159: buffer[start_idx + 1] = '[';
	mov	a,r7
	inc	a
	add	a, #_buffer
	mov	r0,a
	mov	@r0,#0x5b
;	.\IR.c:161: if(buffer[start_idx + 2] < '0' || buffer[start_idx + 2] > '9'){
	mov	a,#0x02
	add	a, r7
	add	a, #_buffer
	mov	r1,a
	mov	ar6,@r1
	cjne	r6,#0x30,00178$
00178$:
	jc	00106$
	mov	a,#0x02
	add	a, r7
	add	a, #_buffer
	mov	r1,a
	mov	a,@r1
	add	a,#0xff - 0x39
	jnc	00107$
00106$:
;	.\IR.c:162: return 3;
	mov	dpl, #0x03
	ret
00107$:
;	.\IR.c:165: buffer_idx = start_idx + 3;
	mov	a,#0x03
	add	a, r7
	mov	_buffer_idx,a
;	.\IR.c:166: while(buffer[buffer_idx] != '>' && buffer_idx < buffer_size){
00114$:
	mov	a,_buffer_idx
	add	a, #_buffer
	mov	r1,a
	mov	ar7,@r1
	cjne	r7,#0x3e,00181$
	sjmp	00116$
00181$:
	clr	c
	mov	a,_buffer_idx
	subb	a,_buffer_size
	jnc	00116$
;	.\IR.c:168: if(buffer[buffer_idx] >= 'a' && buffer[buffer_idx] <= 'z'){
	cjne	r7,#0x61,00183$
00183$:
	jc	00110$
	mov	a,r7
	add	a,#0xff - 0x7a
	jc	00110$
;	.\IR.c:169: buffer[buffer_idx] -= 32;
	mov	a,r7
	add	a,#0xe0
	mov	@r1,a
	sjmp	00111$
00110$:
;	.\IR.c:171: return 4;
	mov	dpl, #0x04
	ret
00111$:
;	.\IR.c:173: buffer_idx++;
	inc	_buffer_idx
	sjmp	00114$
00116$:
;	.\IR.c:175: if(buffer_idx < buffer_size){
	clr	c
	mov	a,_buffer_idx
	subb	a,_buffer_size
	jnc	00118$
;	.\IR.c:176: buffer[buffer_idx] = ']';
	mov	a,_buffer_idx
	add	a, #_buffer
	mov	r0,a
	mov	@r0,#0x5d
	sjmp	00119$
00118$:
;	.\IR.c:178: return 5;
	mov	dpl, #0x05
	ret
00119$:
;	.\IR.c:181: return 0;
	mov	dpl, #0x00
;	.\IR.c:182: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area CONST   (CODE)
___str_0:
	.ascii "No : Found"
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_1:
	.ascii "Incorrect format: "
	.db 0x22
	.ascii ":"
	.db 0x22
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_2:
	.ascii "No < found"
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_3:
	.ascii "Incorrect format: "
	.db 0x22
	.ascii "<"
	.db 0x22
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_4:
	.ascii "No RTU Number found"
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_5:
	.ascii "Wrong RTU number"
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_6:
	.ascii "Error in message format"
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_7:
	.ascii "No > found"
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_8:
	.ascii "Incorrect format: "
	.db 0x22
	.ascii ">"
	.db 0x22
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_9:
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
