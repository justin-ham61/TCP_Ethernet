;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (MINGW32)
;--------------------------------------------------------
	.module main
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _WOL_ISR
	.globl _Timer1_ISR
	.globl _get_config
	.globl _process_cmd
	.globl _clear_buffer
	.globl _SIR_poll
	.globl _transmit_string
	.globl _transmit_data
	.globl _receive_data
	.globl _set_mac_adr
	.globl _get_2
	.globl _send_4
	.globl _send_2
	.globl _send_1
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
	.globl _udp_status
	.globl _status
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
_flag:
	.ds 1
_status::
	.ds 1
_udp_status::
	.ds 1
_int_flag:
	.ds 1
_socket_status_poll_PARM_2:
	.ds 1
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
;--------------------------------------------------------
; Stack segment in internal ram
;--------------------------------------------------------
	.area SSEG
__start__stack:
	.ds	1

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
; interrupt vector
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
	ljmp	_WOL_ISR
	.ds	5
	reti
	.ds	7
	reti
	.ds	7
	ljmp	_Timer1_ISR
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
;	main.c:11: static unsigned char flag = 0;
	mov	_flag,#0x00
;	main.c:14: static unsigned char int_flag = 0;
	mov	_int_flag,#0x00
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'UART_Init'
;------------------------------------------------------------
;	main.c:24: void UART_Init(void){
;	-----------------------------------------
;	 function UART_Init
;	-----------------------------------------
_UART_Init:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	main.c:25: TMOD = 0x21;
	mov	_TMOD,#0x21
;	main.c:26: TH1 = 0xFD;
	mov	_TH1,#0xfd
;	main.c:27: TL1 = 0xFD;
	mov	_TL1,#0xfd
;	main.c:29: SCON = 0x50;
	mov	_SCON,#0x50
;	main.c:30: TR1 = 1;
;	assignBit
	setb	_TR1
;	main.c:31: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SPI_Init'
;------------------------------------------------------------
;	main.c:33: void SPI_Init(void){
;	-----------------------------------------
;	 function SPI_Init
;	-----------------------------------------
_SPI_Init:
;	main.c:34: P2_5 = 0;
;	assignBit
	clr	_P2_5
;	main.c:35: P2_4 = 1;
;	assignBit
	setb	_P2_4
;	main.c:36: P2_7 = 0;
;	assignBit
	clr	_P2_7
;	main.c:37: P2_6 = 1;
;	assignBit
	setb	_P2_6
;	main.c:38: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer_Init'
;------------------------------------------------------------
;	main.c:40: void Timer_Init(void){
;	-----------------------------------------
;	 function Timer_Init
;	-----------------------------------------
_Timer_Init:
;	main.c:41: TH0 = 0x00;
	mov	_TH0,#0x00
;	main.c:42: TL0 = 0x00;
	mov	_TL0,#0x00
;	main.c:43: TR0 = 1;
;	assignBit
	setb	_TR0
;	main.c:44: ET1 = 1;
;	assignBit
	setb	_ET1
;	main.c:45: ET0 = 1;
;	assignBit
	setb	_ET0
;	main.c:46: EA = 1;
;	assignBit
	setb	_EA
;	main.c:49: EX0 = 1;
;	assignBit
	setb	_EX0
;	main.c:50: IT0 = 0;
;	assignBit
	clr	_IT0
;	main.c:51: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer1_ISR'
;------------------------------------------------------------
;	main.c:53: void Timer1_ISR(void) __interrupt (3) {
;	-----------------------------------------
;	 function Timer1_ISR
;	-----------------------------------------
_Timer1_ISR:
;	main.c:54: TF0 = 0;
;	assignBit
	clr	_TF0
;	main.c:55: TH0 = 0x00;
	mov	_TH0,#0x00
;	main.c:56: TL0 = 0x00;
	mov	_TL0,#0x00
;	main.c:57: TR0 = 1;
;	assignBit
	setb	_TR0
;	main.c:58: }
	reti
;	eliminated unneeded mov psw,# (no regs used in bank)
;	eliminated unneeded push/pop not_psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
;------------------------------------------------------------
;Allocation info for local variables in function 'WOL_ISR'
;------------------------------------------------------------
;	main.c:60: void WOL_ISR(void) __interrupt (0){
;	-----------------------------------------
;	 function WOL_ISR
;	-----------------------------------------
_WOL_ISR:
;	main.c:61: int_flag = 1; 
	mov	_int_flag,#0x01
;	main.c:62: }
	reti
;	eliminated unneeded mov psw,# (no regs used in bank)
;	eliminated unneeded push/pop not_psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;c                         Allocated to registers r7 
;------------------------------------------------------------
;	main.c:64: void main(void){
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c:65: UART_Init();
	lcall	_UART_Init
;	main.c:66: SPI_Init();
	lcall	_SPI_Init
;	main.c:67: Timer_Init();
	lcall	_Timer_Init
;	main.c:69: send_1(0x0018, 0x04, 0x03);
	mov	_send_1_PARM_2,#0x04
	mov	(_send_1_PARM_2 + 1),#0x00
	mov	_send_1_PARM_3,#0x03
	mov	(_send_1_PARM_3 + 1),#0x00
	mov	dptr,#0x0018
	lcall	_send_1
;	main.c:72: send_1(0x0000, 0x04, 0b00010000);
	mov	_send_1_PARM_2,#0x04
	mov	(_send_1_PARM_2 + 1),#0x00
	mov	_send_1_PARM_3,#0x10
	mov	(_send_1_PARM_3 + 1),#0x00
	mov	dptr,#0x0000
	lcall	_send_1
;	main.c:74: send_1(0x0016, 0x04, 0x10);
	mov	_send_1_PARM_2,#0x04
	mov	(_send_1_PARM_2 + 1),#0x00
	mov	_send_1_PARM_3,#0x10
	mov	(_send_1_PARM_3 + 1),#0x00
	mov	dptr,#0x0016
	lcall	_send_1
;	main.c:76: device_net_init();
	lcall	_device_net_init
;	main.c:77: UDP_socket_init();
	lcall	_UDP_socket_init
;	main.c:78: TCP_socket_init();
	lcall	_TCP_socket_init
;	main.c:79: transmit_string("Setup Complete \r\n");
	mov	dptr,#___str_0
	mov	b, #0x80
	lcall	_transmit_string
;	main.c:80: while(1){
00127$:
;	main.c:81: switch(mode){
	clr	a
	cjne	a,_mode,00209$
	sjmp	00101$
00209$:
	mov	a,#0x02
	cjne	a,_mode,00210$
	ljmp	00112$
00210$:
;	main.c:82: case DUAL_POLLING_MODE:
	sjmp	00127$
00101$:
;	main.c:84: receive_data(&flag);
	mov	dptr,#_flag
	mov	b, #0x40
	lcall	_receive_data
;	main.c:86: if(int_flag){
	mov	a,_int_flag
	jz	00108$
;	main.c:87: socket_status_poll(&status, 1);
	mov	_socket_status_poll_PARM_2,#0x01
	mov	dptr,#_status
	mov	b, #0x40
	lcall	_socket_status_poll
;	main.c:88: socket_status_poll(&udp_status, 0);
	mov	_socket_status_poll_PARM_2,#0x00
	mov	dptr,#_udp_status
	mov	b, #0x40
	lcall	_socket_status_poll
;	main.c:89: if(status == 0x00){
	mov	a,_status
;	main.c:91: send_1(0x0001, 0x2C, 0x01);
	jnz	00103$
	mov	_send_1_PARM_2,#0x2c
	mov	(_send_1_PARM_2 + 1),a
	mov	_send_1_PARM_3,#0x01
	mov	(_send_1_PARM_3 + 1),a
	mov	dptr,#0x0001
	lcall	_send_1
;	main.c:93: send_1(0x0001, 0x2C, 0x02);
	mov	_send_1_PARM_2,#0x2c
	mov	(_send_1_PARM_2 + 1),#0x00
	mov	_send_1_PARM_3,#0x02
	mov	(_send_1_PARM_3 + 1),#0x00
	mov	dptr,#0x0001
	lcall	_send_1
00103$:
;	main.c:95: SIR_poll();
	lcall	_SIR_poll
;	main.c:96: if(inactivity_counter > 15 && status != 0x00){
	mov	a,_inactivity_counter
	add	a,#0xff - 0x0f
	jnc	00108$
	mov	a,_status
	jz	00108$
;	main.c:97: transmit_string("Going back to sleep\r\n");
	mov	dptr,#___str_1
	mov	b, #0x80
	lcall	_transmit_string
;	main.c:98: int_flag = 0;
	mov	_int_flag,#0x00
00108$:
;	main.c:101: switch (flag){
	mov	a,#0x3f
	cjne	a,_flag,00215$
	sjmp	00216$
00215$:
	ljmp	00127$
00216$:
;	main.c:103: flag = 0;
	mov	_flag,#0x00
;	main.c:104: transmit_string("\r\n"); 
	mov	dptr,#___str_2
	mov	b, #0x80
	lcall	_transmit_string
;	main.c:105: get_config();
	lcall	_get_config
;	main.c:106: transmit_string("\r\n"); 
	mov	dptr,#___str_2
	mov	b, #0x80
	lcall	_transmit_string
;	main.c:107: transmit_string("Set/Change RTU Address (0-9) using: RTU=#\r\nSet/Change IP address using: IP=###.###.###.###\r\nSet/Change Subnet Mask using: SUB=###.###.###.###\r\n");
	mov	dptr,#___str_3
	mov	b, #0x80
	lcall	_transmit_string
;	main.c:108: transmit_string("Set/Change Gateway using: GATE=###.###.###.###\r\nSet/Change MAC Address using: MAC=############\r\nChange Mode using: MODE=\r\n");
	mov	dptr,#___str_4
	mov	b, #0x80
	lcall	_transmit_string
;	main.c:109: last_polling_mode = DUAL_POLLING_MODE;
	mov	_last_polling_mode,#0x00
;	main.c:110: mode = CONFIG_CHANGE_MODE;
	mov	_mode,#0x02
;	main.c:111: break;
	ljmp	00127$
;	main.c:117: case CONFIG_CHANGE_MODE:
00112$:
;	main.c:119: if(RI){
	jb	_RI,00217$
	ljmp	00127$
00217$:
;	main.c:120: char c = SBUF;
	mov	r7,_SBUF
;	main.c:121: RI = 0;
;	assignBit
	clr	_RI
;	main.c:122: if(c == '\r' || c == '\n' || buffer_idx >= buffer_size - 2){
	cjne	r7,#0x0d,00218$
	sjmp	00117$
00218$:
	cjne	r7,#0x0a,00219$
	sjmp	00117$
00219$:
	mov	r5,_buffer_size
	mov	r6,#0x00
	mov	a,r5
	add	a,#0xfe
	mov	r5,a
	mov	a,r6
	addc	a,#0xff
	mov	r6,a
	mov	r3,_buffer_idx
	mov	r4,#0x00
	clr	c
	mov	a,r3
	subb	a,r5
	mov	a,r4
	xrl	a,#0x80
	mov	b,r6
	xrl	b,#0x80
	subb	a,b
	jc	00118$
00117$:
;	main.c:123: buffer[buffer_idx]= '.';
	mov	a,_buffer_idx
	add	a, #_buffer
	mov	r0,a
	mov	@r0,#0x2e
;	main.c:124: buffer[buffer_idx + 1]= '\0';
	mov	a,_buffer_idx
	inc	a
	add	a, #_buffer
	mov	r0,a
	mov	@r0,#0x00
;	main.c:125: transmit_string("\r\n");
	mov	dptr,#___str_2
	mov	b, #0x80
	lcall	_transmit_string
;	main.c:126: transmit_string(buffer);
	mov	dptr,#_buffer
	mov	b, #0x40
	lcall	_transmit_string
;	main.c:127: transmit_string("\r\n");
	mov	dptr,#___str_2
	mov	b, #0x80
	lcall	_transmit_string
;	main.c:128: buffer_idx = 0;
	mov	_buffer_idx,#0x00
;	main.c:129: process_cmd();
	lcall	_process_cmd
;	main.c:130: clear_buffer();
	lcall	_clear_buffer
;	main.c:131: transmit_string("\r\n");
	mov	dptr,#___str_2
	mov	b, #0x80
	lcall	_transmit_string
;	main.c:132: buffer_idx = 0;
	mov	_buffer_idx,#0x00
	ljmp	00127$
00118$:
;	main.c:133: } else if (c == 8 && buffer_idx > 0){
	cjne	r7,#0x08,00114$
	mov	a,_buffer_idx
	jz	00114$
;	main.c:135: buffer[buffer_idx] = 0;
	mov	a,_buffer_idx
	add	a, #_buffer
	mov	r0,a
	mov	@r0,#0x00
;	main.c:136: buffer_idx--;
	dec	_buffer_idx
;	main.c:137: transmit_string("\b \b");
	mov	dptr,#___str_5
	mov	b, #0x80
	lcall	_transmit_string
	ljmp	00127$
00114$:
;	main.c:139: buffer[buffer_idx] = c;
	mov	a,_buffer_idx
	add	a, #_buffer
	mov	r0,a
	mov	@r0,ar7
;	main.c:140: transmit_data(&buffer[buffer_idx]);
	mov	a,_buffer_idx
	add	a, #_buffer
	mov	r7,a
	mov	r6,#0x00
	mov	r5,#0x40
	mov	dpl, r7
	mov	dph, r6
	mov	b, r5
	lcall	_transmit_data
;	main.c:141: buffer_idx++;
	inc	_buffer_idx
;	main.c:144: break;
;	main.c:147: }
;	main.c:149: }
	ljmp	00127$
;------------------------------------------------------------
;Allocation info for local variables in function 'device_net_init'
;------------------------------------------------------------
;	main.c:151: void device_net_init(void){
;	-----------------------------------------
;	 function device_net_init
;	-----------------------------------------
_device_net_init:
;	main.c:153: send_4(0x000F, 0x04, 192, 168, 0, 102);
	mov	_send_4_PARM_2,#0x04
	mov	(_send_4_PARM_2 + 1),#0x00
	mov	_send_4_PARM_3,#0xc0
	mov	(_send_4_PARM_3 + 1),#0x00
	mov	_send_4_PARM_4,#0xa8
	clr	a
	mov	(_send_4_PARM_4 + 1),a
	mov	_send_4_PARM_5,a
	mov	(_send_4_PARM_5 + 1),a
	mov	_send_4_PARM_6,#0x66
	mov	(_send_4_PARM_6 + 1),a
	mov	dptr,#0x000f
	lcall	_send_4
;	main.c:155: send_4(0x0005, 0x04, 255, 255, 255, 0);
	mov	_send_4_PARM_2,#0x04
	mov	(_send_4_PARM_2 + 1),#0x00
	mov	_send_4_PARM_3,#0xff
	mov	(_send_4_PARM_3 + 1),#0x00
	mov	_send_4_PARM_4,#0xff
	mov	(_send_4_PARM_4 + 1),#0x00
	mov	_send_4_PARM_5,#0xff
	clr	a
	mov	(_send_4_PARM_5 + 1),a
	mov	_send_4_PARM_6,a
	mov	(_send_4_PARM_6 + 1),a
	mov	dptr,#0x0005
	lcall	_send_4
;	main.c:157: send_4(0x0001, 0x04, 192, 168, 0, 1);
	mov	_send_4_PARM_2,#0x04
	mov	(_send_4_PARM_2 + 1),#0x00
	mov	_send_4_PARM_3,#0xc0
	mov	(_send_4_PARM_3 + 1),#0x00
	mov	_send_4_PARM_4,#0xa8
	clr	a
	mov	(_send_4_PARM_4 + 1),a
	mov	_send_4_PARM_5,a
	mov	(_send_4_PARM_5 + 1),a
	mov	_send_4_PARM_6,#0x01
	mov	(_send_4_PARM_6 + 1),a
	mov	dptr,#0x0001
	lcall	_send_4
;	main.c:159: set_mac_adr(0x4e,0x12,0xC4,0xba,0x1c,0x3e);
	mov	_set_mac_adr_PARM_2,#0x12
	mov	(_set_mac_adr_PARM_2 + 1),#0x00
	mov	_set_mac_adr_PARM_3,#0xc4
	mov	(_set_mac_adr_PARM_3 + 1),#0x00
	mov	_set_mac_adr_PARM_4,#0xba
	mov	(_set_mac_adr_PARM_4 + 1),#0x00
	mov	_set_mac_adr_PARM_5,#0x1c
	mov	(_set_mac_adr_PARM_5 + 1),#0x00
	mov	_set_mac_adr_PARM_6,#0x3e
	mov	(_set_mac_adr_PARM_6 + 1),#0x00
	mov	dptr,#0x004e
;	main.c:160: }
	ljmp	_set_mac_adr
;------------------------------------------------------------
;Allocation info for local variables in function 'UDP_socket_init'
;------------------------------------------------------------
;	main.c:162: void UDP_socket_init(void){
;	-----------------------------------------
;	 function UDP_socket_init
;	-----------------------------------------
_UDP_socket_init:
;	main.c:164: send_2(0x0004, 0x0C, 0xE7, 0x9D);
	mov	_send_2_PARM_2,#0x0c
	mov	(_send_2_PARM_2 + 1),#0x00
	mov	_send_2_PARM_3,#0xe7
	mov	(_send_2_PARM_3 + 1),#0x00
	mov	_send_2_PARM_4,#0x9d
	mov	(_send_2_PARM_4 + 1),#0x00
	mov	dptr,#0x0004
	lcall	_send_2
;	main.c:166: send_1(0x0000, 0x0C, 0x02);
	mov	_send_1_PARM_2,#0x0c
	mov	(_send_1_PARM_2 + 1),#0x00
	mov	_send_1_PARM_3,#0x02
	mov	(_send_1_PARM_3 + 1),#0x00
	mov	dptr,#0x0000
	lcall	_send_1
;	main.c:168: send_1(0x0001, 0x0C, 0x01);
	mov	_send_1_PARM_2,#0x0c
	mov	(_send_1_PARM_2 + 1),#0x00
	mov	_send_1_PARM_3,#0x01
	mov	(_send_1_PARM_3 + 1),#0x00
	mov	dptr,#0x0001
	lcall	_send_1
;	main.c:170: send_4(0x000C, 0x0C, 192, 168, 0, 101);
	mov	_send_4_PARM_2,#0x0c
	mov	(_send_4_PARM_2 + 1),#0x00
	mov	_send_4_PARM_3,#0xc0
	mov	(_send_4_PARM_3 + 1),#0x00
	mov	_send_4_PARM_4,#0xa8
	clr	a
	mov	(_send_4_PARM_4 + 1),a
	mov	_send_4_PARM_5,a
	mov	(_send_4_PARM_5 + 1),a
	mov	_send_4_PARM_6,#0x65
	mov	(_send_4_PARM_6 + 1),a
	mov	dptr,#0x000c
	lcall	_send_4
;	main.c:172: send_2(0x0010, 0x0C, 0xE7, 0x9D);
	mov	_send_2_PARM_2,#0x0c
	mov	(_send_2_PARM_2 + 1),#0x00
	mov	_send_2_PARM_3,#0xe7
	mov	(_send_2_PARM_3 + 1),#0x00
	mov	_send_2_PARM_4,#0x9d
	mov	(_send_2_PARM_4 + 1),#0x00
	mov	dptr,#0x0010
;	main.c:173: }
	ljmp	_send_2
;------------------------------------------------------------
;Allocation info for local variables in function 'TCP_socket_init'
;------------------------------------------------------------
;	main.c:175: void TCP_socket_init(void){
;	-----------------------------------------
;	 function TCP_socket_init
;	-----------------------------------------
_TCP_socket_init:
;	main.c:177: send_1(0x0000, 0x2C, 0x01);
	mov	_send_1_PARM_2,#0x2c
	mov	(_send_1_PARM_2 + 1),#0x00
	mov	_send_1_PARM_3,#0x01
	mov	(_send_1_PARM_3 + 1),#0x00
	mov	dptr,#0x0000
	lcall	_send_1
;	main.c:179: send_2(0x0004, 0x2C, 0xE7, 0x9E);
	mov	_send_2_PARM_2,#0x2c
	mov	(_send_2_PARM_2 + 1),#0x00
	mov	_send_2_PARM_3,#0xe7
	mov	(_send_2_PARM_3 + 1),#0x00
	mov	_send_2_PARM_4,#0x9e
	mov	(_send_2_PARM_4 + 1),#0x00
	mov	dptr,#0x0004
	lcall	_send_2
;	main.c:181: send_1(0x0001, 0x2C, 0x01);
	mov	_send_1_PARM_2,#0x2c
	mov	(_send_1_PARM_2 + 1),#0x00
	mov	_send_1_PARM_3,#0x01
	mov	(_send_1_PARM_3 + 1),#0x00
	mov	dptr,#0x0001
	lcall	_send_1
;	main.c:183: send_1(0x0001, 0x2C, 0x02);
	mov	_send_1_PARM_2,#0x2c
	mov	(_send_1_PARM_2 + 1),#0x00
	mov	_send_1_PARM_3,#0x02
	mov	(_send_1_PARM_3 + 1),#0x00
	mov	dptr,#0x0001
;	main.c:184: }
	ljmp	_send_1
;------------------------------------------------------------
;Allocation info for local variables in function 'socket_status_poll'
;------------------------------------------------------------
;socket                    Allocated with name '_socket_status_poll_PARM_2'
;status                    Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	main.c:186: void socket_status_poll(unsigned char* status, unsigned char socket){
;	-----------------------------------------
;	 function socket_status_poll
;	-----------------------------------------
_socket_status_poll:
	mov	r5, dpl
	mov	r6, dph
	mov	r7, b
;	main.c:187: switch (socket)
	clr	a
	cjne	a,_socket_status_poll_PARM_2,00119$
	sjmp	00101$
00119$:
	mov	a,#0x01
;	main.c:189: case 0:
	cjne	a,_socket_status_poll_PARM_2,00105$
	sjmp	00102$
00101$:
;	main.c:190: *status = get_2(0x0003, 0x08) >> 8;
	mov	_get_2_PARM_2,#0x08
	mov	(_get_2_PARM_2 + 1),#0x00
	mov	dptr,#0x0003
	push	ar7
	push	ar6
	push	ar5
	lcall	_get_2
	mov	r4, dph
	pop	ar5
	pop	ar6
	pop	ar7
	mov	ar3,r4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r3
;	main.c:191: break;
;	main.c:192: case 1: 
	ljmp	__gptrput
00102$:
;	main.c:193: *status = get_2(0x0003, 0x28) >> 8;
	mov	_get_2_PARM_2,#0x28
	mov	(_get_2_PARM_2 + 1),#0x00
	mov	dptr,#0x0003
	push	ar7
	push	ar6
	push	ar5
	lcall	_get_2
	mov	r4, dph
	pop	ar5
	pop	ar6
	pop	ar7
	mov	ar3,r4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r3
;	main.c:197: }
;	main.c:198: }
	ljmp	__gptrput
00105$:
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area CONST   (CODE)
___str_0:
	.ascii "Setup Complete "
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_1:
	.ascii "Going back to sleep"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_2:
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_3:
	.ascii "Set/Change RTU Address (0-9) using: RTU=#"
	.db 0x0d
	.db 0x0a
	.ascii "Set/Change IP address using: IP=###.###.###.###"
	.db 0x0d
	.db 0x0a
	.ascii "Set/Change Subnet Mask using: SUB=###.###.###.###"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_4:
	.ascii "Set/Change Gateway using: GATE=###.###.###.###"
	.db 0x0d
	.db 0x0a
	.ascii "Set/Change MAC Address using: MAC=############"
	.db 0x0d
	.db 0x0a
	.ascii "Change Mode using: MODE="
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_5:
	.db 0x08
	.ascii " "
	.db 0x08
	.db 0x00
	.area CSEG    (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
