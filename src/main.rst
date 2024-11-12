                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.4.0 #14620 (MINGW32)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _WOL_ISR
                                     13 	.globl _Timer1_ISR
                                     14 	.globl _get_config
                                     15 	.globl _process_cmd
                                     16 	.globl _clear_buffer
                                     17 	.globl _SIR_poll
                                     18 	.globl _transmit_string
                                     19 	.globl _transmit_data
                                     20 	.globl _receive_data
                                     21 	.globl _set_mac_adr
                                     22 	.globl _get_2
                                     23 	.globl _send_4
                                     24 	.globl _send_2
                                     25 	.globl _send_1
                                     26 	.globl _CY
                                     27 	.globl _AC
                                     28 	.globl _F0
                                     29 	.globl _RS1
                                     30 	.globl _RS0
                                     31 	.globl _OV
                                     32 	.globl _F1
                                     33 	.globl _P
                                     34 	.globl _PS
                                     35 	.globl _PT1
                                     36 	.globl _PX1
                                     37 	.globl _PT0
                                     38 	.globl _PX0
                                     39 	.globl _RD
                                     40 	.globl _WR
                                     41 	.globl _T1
                                     42 	.globl _T0
                                     43 	.globl _INT1
                                     44 	.globl _INT0
                                     45 	.globl _TXD
                                     46 	.globl _RXD
                                     47 	.globl _P3_7
                                     48 	.globl _P3_6
                                     49 	.globl _P3_5
                                     50 	.globl _P3_4
                                     51 	.globl _P3_3
                                     52 	.globl _P3_2
                                     53 	.globl _P3_1
                                     54 	.globl _P3_0
                                     55 	.globl _EA
                                     56 	.globl _ES
                                     57 	.globl _ET1
                                     58 	.globl _EX1
                                     59 	.globl _ET0
                                     60 	.globl _EX0
                                     61 	.globl _P2_7
                                     62 	.globl _P2_6
                                     63 	.globl _P2_5
                                     64 	.globl _P2_4
                                     65 	.globl _P2_3
                                     66 	.globl _P2_2
                                     67 	.globl _P2_1
                                     68 	.globl _P2_0
                                     69 	.globl _SM0
                                     70 	.globl _SM1
                                     71 	.globl _SM2
                                     72 	.globl _REN
                                     73 	.globl _TB8
                                     74 	.globl _RB8
                                     75 	.globl _TI
                                     76 	.globl _RI
                                     77 	.globl _P1_7
                                     78 	.globl _P1_6
                                     79 	.globl _P1_5
                                     80 	.globl _P1_4
                                     81 	.globl _P1_3
                                     82 	.globl _P1_2
                                     83 	.globl _P1_1
                                     84 	.globl _P1_0
                                     85 	.globl _TF1
                                     86 	.globl _TR1
                                     87 	.globl _TF0
                                     88 	.globl _TR0
                                     89 	.globl _IE1
                                     90 	.globl _IT1
                                     91 	.globl _IE0
                                     92 	.globl _IT0
                                     93 	.globl _P0_7
                                     94 	.globl _P0_6
                                     95 	.globl _P0_5
                                     96 	.globl _P0_4
                                     97 	.globl _P0_3
                                     98 	.globl _P0_2
                                     99 	.globl _P0_1
                                    100 	.globl _P0_0
                                    101 	.globl _B
                                    102 	.globl _ACC
                                    103 	.globl _PSW
                                    104 	.globl _IP
                                    105 	.globl _P3
                                    106 	.globl _IE
                                    107 	.globl _P2
                                    108 	.globl _SBUF
                                    109 	.globl _SCON
                                    110 	.globl _P1
                                    111 	.globl _TH1
                                    112 	.globl _TH0
                                    113 	.globl _TL1
                                    114 	.globl _TL0
                                    115 	.globl _TMOD
                                    116 	.globl _TCON
                                    117 	.globl _PCON
                                    118 	.globl _DPH
                                    119 	.globl _DPL
                                    120 	.globl _SP
                                    121 	.globl _P0
                                    122 	.globl _udp_status
                                    123 	.globl _status
                                    124 ;--------------------------------------------------------
                                    125 ; special function registers
                                    126 ;--------------------------------------------------------
                                    127 	.area RSEG    (ABS,DATA)
      000000                        128 	.org 0x0000
                           000080   129 _P0	=	0x0080
                           000081   130 _SP	=	0x0081
                           000082   131 _DPL	=	0x0082
                           000083   132 _DPH	=	0x0083
                           000087   133 _PCON	=	0x0087
                           000088   134 _TCON	=	0x0088
                           000089   135 _TMOD	=	0x0089
                           00008A   136 _TL0	=	0x008a
                           00008B   137 _TL1	=	0x008b
                           00008C   138 _TH0	=	0x008c
                           00008D   139 _TH1	=	0x008d
                           000090   140 _P1	=	0x0090
                           000098   141 _SCON	=	0x0098
                           000099   142 _SBUF	=	0x0099
                           0000A0   143 _P2	=	0x00a0
                           0000A8   144 _IE	=	0x00a8
                           0000B0   145 _P3	=	0x00b0
                           0000B8   146 _IP	=	0x00b8
                           0000D0   147 _PSW	=	0x00d0
                           0000E0   148 _ACC	=	0x00e0
                           0000F0   149 _B	=	0x00f0
                                    150 ;--------------------------------------------------------
                                    151 ; special function bits
                                    152 ;--------------------------------------------------------
                                    153 	.area RSEG    (ABS,DATA)
      000000                        154 	.org 0x0000
                           000080   155 _P0_0	=	0x0080
                           000081   156 _P0_1	=	0x0081
                           000082   157 _P0_2	=	0x0082
                           000083   158 _P0_3	=	0x0083
                           000084   159 _P0_4	=	0x0084
                           000085   160 _P0_5	=	0x0085
                           000086   161 _P0_6	=	0x0086
                           000087   162 _P0_7	=	0x0087
                           000088   163 _IT0	=	0x0088
                           000089   164 _IE0	=	0x0089
                           00008A   165 _IT1	=	0x008a
                           00008B   166 _IE1	=	0x008b
                           00008C   167 _TR0	=	0x008c
                           00008D   168 _TF0	=	0x008d
                           00008E   169 _TR1	=	0x008e
                           00008F   170 _TF1	=	0x008f
                           000090   171 _P1_0	=	0x0090
                           000091   172 _P1_1	=	0x0091
                           000092   173 _P1_2	=	0x0092
                           000093   174 _P1_3	=	0x0093
                           000094   175 _P1_4	=	0x0094
                           000095   176 _P1_5	=	0x0095
                           000096   177 _P1_6	=	0x0096
                           000097   178 _P1_7	=	0x0097
                           000098   179 _RI	=	0x0098
                           000099   180 _TI	=	0x0099
                           00009A   181 _RB8	=	0x009a
                           00009B   182 _TB8	=	0x009b
                           00009C   183 _REN	=	0x009c
                           00009D   184 _SM2	=	0x009d
                           00009E   185 _SM1	=	0x009e
                           00009F   186 _SM0	=	0x009f
                           0000A0   187 _P2_0	=	0x00a0
                           0000A1   188 _P2_1	=	0x00a1
                           0000A2   189 _P2_2	=	0x00a2
                           0000A3   190 _P2_3	=	0x00a3
                           0000A4   191 _P2_4	=	0x00a4
                           0000A5   192 _P2_5	=	0x00a5
                           0000A6   193 _P2_6	=	0x00a6
                           0000A7   194 _P2_7	=	0x00a7
                           0000A8   195 _EX0	=	0x00a8
                           0000A9   196 _ET0	=	0x00a9
                           0000AA   197 _EX1	=	0x00aa
                           0000AB   198 _ET1	=	0x00ab
                           0000AC   199 _ES	=	0x00ac
                           0000AF   200 _EA	=	0x00af
                           0000B0   201 _P3_0	=	0x00b0
                           0000B1   202 _P3_1	=	0x00b1
                           0000B2   203 _P3_2	=	0x00b2
                           0000B3   204 _P3_3	=	0x00b3
                           0000B4   205 _P3_4	=	0x00b4
                           0000B5   206 _P3_5	=	0x00b5
                           0000B6   207 _P3_6	=	0x00b6
                           0000B7   208 _P3_7	=	0x00b7
                           0000B0   209 _RXD	=	0x00b0
                           0000B1   210 _TXD	=	0x00b1
                           0000B2   211 _INT0	=	0x00b2
                           0000B3   212 _INT1	=	0x00b3
                           0000B4   213 _T0	=	0x00b4
                           0000B5   214 _T1	=	0x00b5
                           0000B6   215 _WR	=	0x00b6
                           0000B7   216 _RD	=	0x00b7
                           0000B8   217 _PX0	=	0x00b8
                           0000B9   218 _PT0	=	0x00b9
                           0000BA   219 _PX1	=	0x00ba
                           0000BB   220 _PT1	=	0x00bb
                           0000BC   221 _PS	=	0x00bc
                           0000D0   222 _P	=	0x00d0
                           0000D1   223 _F1	=	0x00d1
                           0000D2   224 _OV	=	0x00d2
                           0000D3   225 _RS0	=	0x00d3
                           0000D4   226 _RS1	=	0x00d4
                           0000D5   227 _F0	=	0x00d5
                           0000D6   228 _AC	=	0x00d6
                           0000D7   229 _CY	=	0x00d7
                                    230 ;--------------------------------------------------------
                                    231 ; overlayable register banks
                                    232 ;--------------------------------------------------------
                                    233 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        234 	.ds 8
                                    235 ;--------------------------------------------------------
                                    236 ; internal ram data
                                    237 ;--------------------------------------------------------
                                    238 	.area DSEG    (DATA)
      000008                        239 _flag:
      000008                        240 	.ds 1
      000009                        241 _status::
      000009                        242 	.ds 1
      00000A                        243 _udp_status::
      00000A                        244 	.ds 1
      00000B                        245 _int_flag:
      00000B                        246 	.ds 1
      00000C                        247 _socket_status_poll_PARM_2:
      00000C                        248 	.ds 1
                                    249 ;--------------------------------------------------------
                                    250 ; overlayable items in internal ram
                                    251 ;--------------------------------------------------------
                                    252 ;--------------------------------------------------------
                                    253 ; Stack segment in internal ram
                                    254 ;--------------------------------------------------------
                                    255 	.area SSEG
      000080                        256 __start__stack:
      000080                        257 	.ds	1
                                    258 
                                    259 ;--------------------------------------------------------
                                    260 ; indirectly addressable internal ram data
                                    261 ;--------------------------------------------------------
                                    262 	.area ISEG    (DATA)
                                    263 ;--------------------------------------------------------
                                    264 ; absolute internal ram data
                                    265 ;--------------------------------------------------------
                                    266 	.area IABS    (ABS,DATA)
                                    267 	.area IABS    (ABS,DATA)
                                    268 ;--------------------------------------------------------
                                    269 ; bit data
                                    270 ;--------------------------------------------------------
                                    271 	.area BSEG    (BIT)
                                    272 ;--------------------------------------------------------
                                    273 ; paged external ram data
                                    274 ;--------------------------------------------------------
                                    275 	.area PSEG    (PAG,XDATA)
                                    276 ;--------------------------------------------------------
                                    277 ; uninitialized external ram data
                                    278 ;--------------------------------------------------------
                                    279 	.area XSEG    (XDATA)
                                    280 ;--------------------------------------------------------
                                    281 ; absolute external ram data
                                    282 ;--------------------------------------------------------
                                    283 	.area XABS    (ABS,XDATA)
                                    284 ;--------------------------------------------------------
                                    285 ; initialized external ram data
                                    286 ;--------------------------------------------------------
                                    287 	.area XISEG   (XDATA)
                                    288 	.area HOME    (CODE)
                                    289 	.area GSINIT0 (CODE)
                                    290 	.area GSINIT1 (CODE)
                                    291 	.area GSINIT2 (CODE)
                                    292 	.area GSINIT3 (CODE)
                                    293 	.area GSINIT4 (CODE)
                                    294 	.area GSINIT5 (CODE)
                                    295 	.area GSINIT  (CODE)
                                    296 	.area GSFINAL (CODE)
                                    297 	.area CSEG    (CODE)
                                    298 ;--------------------------------------------------------
                                    299 ; interrupt vector
                                    300 ;--------------------------------------------------------
                                    301 	.area HOME    (CODE)
      000000                        302 __interrupt_vect:
      000000 02 00 21         [24]  303 	ljmp	__sdcc_gsinit_startup
      000003 02 00 DA         [24]  304 	ljmp	_WOL_ISR
      000006                        305 	.ds	5
      00000B 32               [24]  306 	reti
      00000C                        307 	.ds	7
      000013 32               [24]  308 	reti
      000014                        309 	.ds	7
      00001B 02 00 CF         [24]  310 	ljmp	_Timer1_ISR
                                    311 ;--------------------------------------------------------
                                    312 ; global & static initialisations
                                    313 ;--------------------------------------------------------
                                    314 	.area HOME    (CODE)
                                    315 	.area GSINIT  (CODE)
                                    316 	.area GSFINAL (CODE)
                                    317 	.area GSINIT  (CODE)
                                    318 	.globl __sdcc_gsinit_startup
                                    319 	.globl __sdcc_program_startup
                                    320 	.globl __start__stack
                                    321 	.globl __mcs51_genXINIT
                                    322 	.globl __mcs51_genXRAMCLEAR
                                    323 	.globl __mcs51_genRAMCLEAR
                                    324 ;	main.c:11: static unsigned char flag = 0;
      00007A 75 08 00         [24]  325 	mov	_flag,#0x00
                                    326 ;	main.c:14: static unsigned char int_flag = 0;
      00007D 75 0B 00         [24]  327 	mov	_int_flag,#0x00
                                    328 	.area GSFINAL (CODE)
      0000A1 02 00 1E         [24]  329 	ljmp	__sdcc_program_startup
                                    330 ;--------------------------------------------------------
                                    331 ; Home
                                    332 ;--------------------------------------------------------
                                    333 	.area HOME    (CODE)
                                    334 	.area HOME    (CODE)
      00001E                        335 __sdcc_program_startup:
      00001E 02 00 DE         [24]  336 	ljmp	_main
                                    337 ;	return from main will return to caller
                                    338 ;--------------------------------------------------------
                                    339 ; code
                                    340 ;--------------------------------------------------------
                                    341 	.area CSEG    (CODE)
                                    342 ;------------------------------------------------------------
                                    343 ;Allocation info for local variables in function 'UART_Init'
                                    344 ;------------------------------------------------------------
                                    345 ;	main.c:24: void UART_Init(void){
                                    346 ;	-----------------------------------------
                                    347 ;	 function UART_Init
                                    348 ;	-----------------------------------------
      0000A4                        349 _UART_Init:
                           000007   350 	ar7 = 0x07
                           000006   351 	ar6 = 0x06
                           000005   352 	ar5 = 0x05
                           000004   353 	ar4 = 0x04
                           000003   354 	ar3 = 0x03
                           000002   355 	ar2 = 0x02
                           000001   356 	ar1 = 0x01
                           000000   357 	ar0 = 0x00
                                    358 ;	main.c:25: TMOD = 0x21;
      0000A4 75 89 21         [24]  359 	mov	_TMOD,#0x21
                                    360 ;	main.c:26: TH1 = 0xFD;
      0000A7 75 8D FD         [24]  361 	mov	_TH1,#0xfd
                                    362 ;	main.c:27: TL1 = 0xFD;
      0000AA 75 8B FD         [24]  363 	mov	_TL1,#0xfd
                                    364 ;	main.c:29: SCON = 0x50;
      0000AD 75 98 50         [24]  365 	mov	_SCON,#0x50
                                    366 ;	main.c:30: TR1 = 1;
                                    367 ;	assignBit
      0000B0 D2 8E            [12]  368 	setb	_TR1
                                    369 ;	main.c:31: }
      0000B2 22               [24]  370 	ret
                                    371 ;------------------------------------------------------------
                                    372 ;Allocation info for local variables in function 'SPI_Init'
                                    373 ;------------------------------------------------------------
                                    374 ;	main.c:33: void SPI_Init(void){
                                    375 ;	-----------------------------------------
                                    376 ;	 function SPI_Init
                                    377 ;	-----------------------------------------
      0000B3                        378 _SPI_Init:
                                    379 ;	main.c:34: P2_5 = 0;
                                    380 ;	assignBit
      0000B3 C2 A5            [12]  381 	clr	_P2_5
                                    382 ;	main.c:35: P2_4 = 1;
                                    383 ;	assignBit
      0000B5 D2 A4            [12]  384 	setb	_P2_4
                                    385 ;	main.c:36: P2_7 = 0;
                                    386 ;	assignBit
      0000B7 C2 A7            [12]  387 	clr	_P2_7
                                    388 ;	main.c:37: P2_6 = 1;
                                    389 ;	assignBit
      0000B9 D2 A6            [12]  390 	setb	_P2_6
                                    391 ;	main.c:38: }
      0000BB 22               [24]  392 	ret
                                    393 ;------------------------------------------------------------
                                    394 ;Allocation info for local variables in function 'Timer_Init'
                                    395 ;------------------------------------------------------------
                                    396 ;	main.c:40: void Timer_Init(void){
                                    397 ;	-----------------------------------------
                                    398 ;	 function Timer_Init
                                    399 ;	-----------------------------------------
      0000BC                        400 _Timer_Init:
                                    401 ;	main.c:41: TH0 = 0x00;
      0000BC 75 8C 00         [24]  402 	mov	_TH0,#0x00
                                    403 ;	main.c:42: TL0 = 0x00;
      0000BF 75 8A 00         [24]  404 	mov	_TL0,#0x00
                                    405 ;	main.c:43: TR0 = 1;
                                    406 ;	assignBit
      0000C2 D2 8C            [12]  407 	setb	_TR0
                                    408 ;	main.c:44: ET1 = 1;
                                    409 ;	assignBit
      0000C4 D2 AB            [12]  410 	setb	_ET1
                                    411 ;	main.c:45: ET0 = 1;
                                    412 ;	assignBit
      0000C6 D2 A9            [12]  413 	setb	_ET0
                                    414 ;	main.c:46: EA = 1;
                                    415 ;	assignBit
      0000C8 D2 AF            [12]  416 	setb	_EA
                                    417 ;	main.c:49: EX0 = 1;
                                    418 ;	assignBit
      0000CA D2 A8            [12]  419 	setb	_EX0
                                    420 ;	main.c:50: IT0 = 0;
                                    421 ;	assignBit
      0000CC C2 88            [12]  422 	clr	_IT0
                                    423 ;	main.c:51: }
      0000CE 22               [24]  424 	ret
                                    425 ;------------------------------------------------------------
                                    426 ;Allocation info for local variables in function 'Timer1_ISR'
                                    427 ;------------------------------------------------------------
                                    428 ;	main.c:53: void Timer1_ISR(void) __interrupt (3) {
                                    429 ;	-----------------------------------------
                                    430 ;	 function Timer1_ISR
                                    431 ;	-----------------------------------------
      0000CF                        432 _Timer1_ISR:
                                    433 ;	main.c:54: TF0 = 0;
                                    434 ;	assignBit
      0000CF C2 8D            [12]  435 	clr	_TF0
                                    436 ;	main.c:55: TH0 = 0x00;
      0000D1 75 8C 00         [24]  437 	mov	_TH0,#0x00
                                    438 ;	main.c:56: TL0 = 0x00;
      0000D4 75 8A 00         [24]  439 	mov	_TL0,#0x00
                                    440 ;	main.c:57: TR0 = 1;
                                    441 ;	assignBit
      0000D7 D2 8C            [12]  442 	setb	_TR0
                                    443 ;	main.c:58: }
      0000D9 32               [24]  444 	reti
                                    445 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    446 ;	eliminated unneeded push/pop not_psw
                                    447 ;	eliminated unneeded push/pop dpl
                                    448 ;	eliminated unneeded push/pop dph
                                    449 ;	eliminated unneeded push/pop b
                                    450 ;	eliminated unneeded push/pop acc
                                    451 ;------------------------------------------------------------
                                    452 ;Allocation info for local variables in function 'WOL_ISR'
                                    453 ;------------------------------------------------------------
                                    454 ;	main.c:60: void WOL_ISR(void) __interrupt (0){
                                    455 ;	-----------------------------------------
                                    456 ;	 function WOL_ISR
                                    457 ;	-----------------------------------------
      0000DA                        458 _WOL_ISR:
                                    459 ;	main.c:61: int_flag = 1; 
      0000DA 75 0B 01         [24]  460 	mov	_int_flag,#0x01
                                    461 ;	main.c:62: }
      0000DD 32               [24]  462 	reti
                                    463 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    464 ;	eliminated unneeded push/pop not_psw
                                    465 ;	eliminated unneeded push/pop dpl
                                    466 ;	eliminated unneeded push/pop dph
                                    467 ;	eliminated unneeded push/pop b
                                    468 ;	eliminated unneeded push/pop acc
                                    469 ;------------------------------------------------------------
                                    470 ;Allocation info for local variables in function 'main'
                                    471 ;------------------------------------------------------------
                                    472 ;c                         Allocated to registers r7 
                                    473 ;------------------------------------------------------------
                                    474 ;	main.c:64: void main(void){
                                    475 ;	-----------------------------------------
                                    476 ;	 function main
                                    477 ;	-----------------------------------------
      0000DE                        478 _main:
                                    479 ;	main.c:65: UART_Init();
      0000DE 12 00 A4         [24]  480 	lcall	_UART_Init
                                    481 ;	main.c:66: SPI_Init();
      0000E1 12 00 B3         [24]  482 	lcall	_SPI_Init
                                    483 ;	main.c:67: Timer_Init();
      0000E4 12 00 BC         [24]  484 	lcall	_Timer_Init
                                    485 ;	main.c:69: send_1(0x0018, 0x04, 0x03);
      0000E7 75 0D 04         [24]  486 	mov	_send_1_PARM_2,#0x04
      0000EA 75 0E 00         [24]  487 	mov	(_send_1_PARM_2 + 1),#0x00
      0000ED 75 0F 03         [24]  488 	mov	_send_1_PARM_3,#0x03
      0000F0 75 10 00         [24]  489 	mov	(_send_1_PARM_3 + 1),#0x00
      0000F3 90 00 18         [24]  490 	mov	dptr,#0x0018
      0000F6 12 04 3A         [24]  491 	lcall	_send_1
                                    492 ;	main.c:72: send_1(0x0000, 0x04, 0b00010000);
      0000F9 75 0D 04         [24]  493 	mov	_send_1_PARM_2,#0x04
      0000FC 75 0E 00         [24]  494 	mov	(_send_1_PARM_2 + 1),#0x00
      0000FF 75 0F 10         [24]  495 	mov	_send_1_PARM_3,#0x10
      000102 75 10 00         [24]  496 	mov	(_send_1_PARM_3 + 1),#0x00
      000105 90 00 00         [24]  497 	mov	dptr,#0x0000
      000108 12 04 3A         [24]  498 	lcall	_send_1
                                    499 ;	main.c:74: send_1(0x0016, 0x04, 0x10);
      00010B 75 0D 04         [24]  500 	mov	_send_1_PARM_2,#0x04
      00010E 75 0E 00         [24]  501 	mov	(_send_1_PARM_2 + 1),#0x00
      000111 75 0F 10         [24]  502 	mov	_send_1_PARM_3,#0x10
      000114 75 10 00         [24]  503 	mov	(_send_1_PARM_3 + 1),#0x00
      000117 90 00 16         [24]  504 	mov	dptr,#0x0016
      00011A 12 04 3A         [24]  505 	lcall	_send_1
                                    506 ;	main.c:76: device_net_init();
      00011D 12 02 8F         [24]  507 	lcall	_device_net_init
                                    508 ;	main.c:77: UDP_socket_init();
      000120 12 03 17         [24]  509 	lcall	_UDP_socket_init
                                    510 ;	main.c:78: TCP_socket_init();
      000123 12 03 8C         [24]  511 	lcall	_TCP_socket_init
                                    512 ;	main.c:79: transmit_string("Setup Complete \r\n");
      000126 90 19 CB         [24]  513 	mov	dptr,#___str_0
      000129 75 F0 80         [24]  514 	mov	b, #0x80
      00012C 12 08 6D         [24]  515 	lcall	_transmit_string
                                    516 ;	main.c:80: while(1){
      00012F                        517 00127$:
                                    518 ;	main.c:81: switch(mode){
      00012F E4               [12]  519 	clr	a
      000130 B5 5C 02         [24]  520 	cjne	a,_mode,00209$
      000133 80 0A            [24]  521 	sjmp	00101$
      000135                        522 00209$:
      000135 74 02            [12]  523 	mov	a,#0x02
      000137 B5 5C 03         [24]  524 	cjne	a,_mode,00210$
      00013A 02 01 E0         [24]  525 	ljmp	00112$
      00013D                        526 00210$:
                                    527 ;	main.c:82: case DUAL_POLLING_MODE:
      00013D 80 F0            [24]  528 	sjmp	00127$
      00013F                        529 00101$:
                                    530 ;	main.c:84: receive_data(&flag);
      00013F 90 00 08         [24]  531 	mov	dptr,#_flag
      000142 75 F0 40         [24]  532 	mov	b, #0x40
      000145 12 08 4C         [24]  533 	lcall	_receive_data
                                    534 ;	main.c:86: if(int_flag){
      000148 E5 0B            [12]  535 	mov	a,_int_flag
      00014A 60 57            [24]  536 	jz	00108$
                                    537 ;	main.c:87: socket_status_poll(&status, 1);
      00014C 75 0C 01         [24]  538 	mov	_socket_status_poll_PARM_2,#0x01
      00014F 90 00 09         [24]  539 	mov	dptr,#_status
      000152 75 F0 40         [24]  540 	mov	b, #0x40
      000155 12 03 DA         [24]  541 	lcall	_socket_status_poll
                                    542 ;	main.c:88: socket_status_poll(&udp_status, 0);
      000158 75 0C 00         [24]  543 	mov	_socket_status_poll_PARM_2,#0x00
      00015B 90 00 0A         [24]  544 	mov	dptr,#_udp_status
      00015E 75 F0 40         [24]  545 	mov	b, #0x40
      000161 12 03 DA         [24]  546 	lcall	_socket_status_poll
                                    547 ;	main.c:89: if(status == 0x00){
      000164 E5 09            [12]  548 	mov	a,_status
                                    549 ;	main.c:91: send_1(0x0001, 0x2C, 0x01);
      000166 70 22            [24]  550 	jnz	00103$
      000168 75 0D 2C         [24]  551 	mov	_send_1_PARM_2,#0x2c
      00016B F5 0E            [12]  552 	mov	(_send_1_PARM_2 + 1),a
      00016D 75 0F 01         [24]  553 	mov	_send_1_PARM_3,#0x01
      000170 F5 10            [12]  554 	mov	(_send_1_PARM_3 + 1),a
      000172 90 00 01         [24]  555 	mov	dptr,#0x0001
      000175 12 04 3A         [24]  556 	lcall	_send_1
                                    557 ;	main.c:93: send_1(0x0001, 0x2C, 0x02);
      000178 75 0D 2C         [24]  558 	mov	_send_1_PARM_2,#0x2c
      00017B 75 0E 00         [24]  559 	mov	(_send_1_PARM_2 + 1),#0x00
      00017E 75 0F 02         [24]  560 	mov	_send_1_PARM_3,#0x02
      000181 75 10 00         [24]  561 	mov	(_send_1_PARM_3 + 1),#0x00
      000184 90 00 01         [24]  562 	mov	dptr,#0x0001
      000187 12 04 3A         [24]  563 	lcall	_send_1
      00018A                        564 00103$:
                                    565 ;	main.c:95: SIR_poll();
      00018A 12 08 A5         [24]  566 	lcall	_SIR_poll
                                    567 ;	main.c:96: if(inactivity_counter > 15 && status != 0x00){
      00018D E5 60            [12]  568 	mov	a,_inactivity_counter
      00018F 24 F0            [12]  569 	add	a,#0xff - 0x0f
      000191 50 10            [24]  570 	jnc	00108$
      000193 E5 09            [12]  571 	mov	a,_status
      000195 60 0C            [24]  572 	jz	00108$
                                    573 ;	main.c:97: transmit_string("Going back to sleep\r\n");
      000197 90 19 DD         [24]  574 	mov	dptr,#___str_1
      00019A 75 F0 80         [24]  575 	mov	b, #0x80
      00019D 12 08 6D         [24]  576 	lcall	_transmit_string
                                    577 ;	main.c:98: int_flag = 0;
      0001A0 75 0B 00         [24]  578 	mov	_int_flag,#0x00
      0001A3                        579 00108$:
                                    580 ;	main.c:101: switch (flag){
      0001A3 74 3F            [12]  581 	mov	a,#0x3f
      0001A5 B5 08 02         [24]  582 	cjne	a,_flag,00215$
      0001A8 80 03            [24]  583 	sjmp	00216$
      0001AA                        584 00215$:
      0001AA 02 01 2F         [24]  585 	ljmp	00127$
      0001AD                        586 00216$:
                                    587 ;	main.c:103: flag = 0;
      0001AD 75 08 00         [24]  588 	mov	_flag,#0x00
                                    589 ;	main.c:104: transmit_string("\r\n"); 
      0001B0 90 19 F3         [24]  590 	mov	dptr,#___str_2
      0001B3 75 F0 80         [24]  591 	mov	b, #0x80
      0001B6 12 08 6D         [24]  592 	lcall	_transmit_string
                                    593 ;	main.c:105: get_config();
      0001B9 12 0F A8         [24]  594 	lcall	_get_config
                                    595 ;	main.c:106: transmit_string("\r\n"); 
      0001BC 90 19 F3         [24]  596 	mov	dptr,#___str_2
      0001BF 75 F0 80         [24]  597 	mov	b, #0x80
      0001C2 12 08 6D         [24]  598 	lcall	_transmit_string
                                    599 ;	main.c:107: transmit_string("Set/Change RTU Address (0-9) using: RTU=#\r\nSet/Change IP address using: IP=###.###.###.###\r\nSet/Change Subnet Mask using: SUB=###.###.###.###\r\n");
      0001C5 90 19 F6         [24]  600 	mov	dptr,#___str_3
      0001C8 75 F0 80         [24]  601 	mov	b, #0x80
      0001CB 12 08 6D         [24]  602 	lcall	_transmit_string
                                    603 ;	main.c:108: transmit_string("Set/Change Gateway using: GATE=###.###.###.###\r\nSet/Change MAC Address using: MAC=############\r\nChange Mode using: MODE=\r\n");
      0001CE 90 1A 86         [24]  604 	mov	dptr,#___str_4
      0001D1 75 F0 80         [24]  605 	mov	b, #0x80
      0001D4 12 08 6D         [24]  606 	lcall	_transmit_string
                                    607 ;	main.c:109: last_polling_mode = DUAL_POLLING_MODE;
      0001D7 75 5E 00         [24]  608 	mov	_last_polling_mode,#0x00
                                    609 ;	main.c:110: mode = CONFIG_CHANGE_MODE;
      0001DA 75 5C 02         [24]  610 	mov	_mode,#0x02
                                    611 ;	main.c:111: break;
      0001DD 02 01 2F         [24]  612 	ljmp	00127$
                                    613 ;	main.c:117: case CONFIG_CHANGE_MODE:
      0001E0                        614 00112$:
                                    615 ;	main.c:119: if(RI){
      0001E0 20 98 03         [24]  616 	jb	_RI,00217$
      0001E3 02 01 2F         [24]  617 	ljmp	00127$
      0001E6                        618 00217$:
                                    619 ;	main.c:120: char c = SBUF;
      0001E6 AF 99            [24]  620 	mov	r7,_SBUF
                                    621 ;	main.c:121: RI = 0;
                                    622 ;	assignBit
      0001E8 C2 98            [12]  623 	clr	_RI
                                    624 ;	main.c:122: if(c == '\r' || c == '\n' || buffer_idx >= buffer_size - 2){
      0001EA BF 0D 02         [24]  625 	cjne	r7,#0x0d,00218$
      0001ED 80 24            [24]  626 	sjmp	00117$
      0001EF                        627 00218$:
      0001EF BF 0A 02         [24]  628 	cjne	r7,#0x0a,00219$
      0001F2 80 1F            [24]  629 	sjmp	00117$
      0001F4                        630 00219$:
      0001F4 AD 5B            [24]  631 	mov	r5,_buffer_size
      0001F6 7E 00            [12]  632 	mov	r6,#0x00
      0001F8 ED               [12]  633 	mov	a,r5
      0001F9 24 FE            [12]  634 	add	a,#0xfe
      0001FB FD               [12]  635 	mov	r5,a
      0001FC EE               [12]  636 	mov	a,r6
      0001FD 34 FF            [12]  637 	addc	a,#0xff
      0001FF FE               [12]  638 	mov	r6,a
      000200 AB 5A            [24]  639 	mov	r3,_buffer_idx
      000202 7C 00            [12]  640 	mov	r4,#0x00
      000204 C3               [12]  641 	clr	c
      000205 EB               [12]  642 	mov	a,r3
      000206 9D               [12]  643 	subb	a,r5
      000207 EC               [12]  644 	mov	a,r4
      000208 64 80            [12]  645 	xrl	a,#0x80
      00020A 8E F0            [24]  646 	mov	b,r6
      00020C 63 F0 80         [24]  647 	xrl	b,#0x80
      00020F 95 F0            [12]  648 	subb	a,b
      000211 40 42            [24]  649 	jc	00118$
      000213                        650 00117$:
                                    651 ;	main.c:123: buffer[buffer_idx]= '.';
      000213 E5 5A            [12]  652 	mov	a,_buffer_idx
      000215 24 3D            [12]  653 	add	a, #_buffer
      000217 F8               [12]  654 	mov	r0,a
      000218 76 2E            [12]  655 	mov	@r0,#0x2e
                                    656 ;	main.c:124: buffer[buffer_idx + 1]= '\0';
      00021A E5 5A            [12]  657 	mov	a,_buffer_idx
      00021C 04               [12]  658 	inc	a
      00021D 24 3D            [12]  659 	add	a, #_buffer
      00021F F8               [12]  660 	mov	r0,a
      000220 76 00            [12]  661 	mov	@r0,#0x00
                                    662 ;	main.c:125: transmit_string("\r\n");
      000222 90 19 F3         [24]  663 	mov	dptr,#___str_2
      000225 75 F0 80         [24]  664 	mov	b, #0x80
      000228 12 08 6D         [24]  665 	lcall	_transmit_string
                                    666 ;	main.c:126: transmit_string(buffer);
      00022B 90 00 3D         [24]  667 	mov	dptr,#_buffer
      00022E 75 F0 40         [24]  668 	mov	b, #0x40
      000231 12 08 6D         [24]  669 	lcall	_transmit_string
                                    670 ;	main.c:127: transmit_string("\r\n");
      000234 90 19 F3         [24]  671 	mov	dptr,#___str_2
      000237 75 F0 80         [24]  672 	mov	b, #0x80
      00023A 12 08 6D         [24]  673 	lcall	_transmit_string
                                    674 ;	main.c:128: buffer_idx = 0;
      00023D 75 5A 00         [24]  675 	mov	_buffer_idx,#0x00
                                    676 ;	main.c:129: process_cmd();
      000240 12 13 62         [24]  677 	lcall	_process_cmd
                                    678 ;	main.c:130: clear_buffer();
      000243 12 0F 80         [24]  679 	lcall	_clear_buffer
                                    680 ;	main.c:131: transmit_string("\r\n");
      000246 90 19 F3         [24]  681 	mov	dptr,#___str_2
      000249 75 F0 80         [24]  682 	mov	b, #0x80
      00024C 12 08 6D         [24]  683 	lcall	_transmit_string
                                    684 ;	main.c:132: buffer_idx = 0;
      00024F 75 5A 00         [24]  685 	mov	_buffer_idx,#0x00
      000252 02 01 2F         [24]  686 	ljmp	00127$
      000255                        687 00118$:
                                    688 ;	main.c:133: } else if (c == 8 && buffer_idx > 0){
      000255 BF 08 19         [24]  689 	cjne	r7,#0x08,00114$
      000258 E5 5A            [12]  690 	mov	a,_buffer_idx
      00025A 60 15            [24]  691 	jz	00114$
                                    692 ;	main.c:135: buffer[buffer_idx] = 0;
      00025C E5 5A            [12]  693 	mov	a,_buffer_idx
      00025E 24 3D            [12]  694 	add	a, #_buffer
      000260 F8               [12]  695 	mov	r0,a
      000261 76 00            [12]  696 	mov	@r0,#0x00
                                    697 ;	main.c:136: buffer_idx--;
      000263 15 5A            [12]  698 	dec	_buffer_idx
                                    699 ;	main.c:137: transmit_string("\b \b");
      000265 90 1B 01         [24]  700 	mov	dptr,#___str_5
      000268 75 F0 80         [24]  701 	mov	b, #0x80
      00026B 12 08 6D         [24]  702 	lcall	_transmit_string
      00026E 02 01 2F         [24]  703 	ljmp	00127$
      000271                        704 00114$:
                                    705 ;	main.c:139: buffer[buffer_idx] = c;
      000271 E5 5A            [12]  706 	mov	a,_buffer_idx
      000273 24 3D            [12]  707 	add	a, #_buffer
      000275 F8               [12]  708 	mov	r0,a
      000276 A6 07            [24]  709 	mov	@r0,ar7
                                    710 ;	main.c:140: transmit_data(&buffer[buffer_idx]);
      000278 E5 5A            [12]  711 	mov	a,_buffer_idx
      00027A 24 3D            [12]  712 	add	a, #_buffer
      00027C FF               [12]  713 	mov	r7,a
      00027D 7E 00            [12]  714 	mov	r6,#0x00
      00027F 7D 40            [12]  715 	mov	r5,#0x40
      000281 8F 82            [24]  716 	mov	dpl, r7
      000283 8E 83            [24]  717 	mov	dph, r6
      000285 8D F0            [24]  718 	mov	b, r5
      000287 12 08 38         [24]  719 	lcall	_transmit_data
                                    720 ;	main.c:141: buffer_idx++;
      00028A 05 5A            [12]  721 	inc	_buffer_idx
                                    722 ;	main.c:144: break;
                                    723 ;	main.c:147: }
                                    724 ;	main.c:149: }
      00028C 02 01 2F         [24]  725 	ljmp	00127$
                                    726 ;------------------------------------------------------------
                                    727 ;Allocation info for local variables in function 'device_net_init'
                                    728 ;------------------------------------------------------------
                                    729 ;	main.c:151: void device_net_init(void){
                                    730 ;	-----------------------------------------
                                    731 ;	 function device_net_init
                                    732 ;	-----------------------------------------
      00028F                        733 _device_net_init:
                                    734 ;	main.c:153: send_4(0x000F, 0x04, 192, 168, 0, 102);
      00028F 75 17 04         [24]  735 	mov	_send_4_PARM_2,#0x04
      000292 75 18 00         [24]  736 	mov	(_send_4_PARM_2 + 1),#0x00
      000295 75 19 C0         [24]  737 	mov	_send_4_PARM_3,#0xc0
      000298 75 1A 00         [24]  738 	mov	(_send_4_PARM_3 + 1),#0x00
      00029B 75 1B A8         [24]  739 	mov	_send_4_PARM_4,#0xa8
      00029E E4               [12]  740 	clr	a
      00029F F5 1C            [12]  741 	mov	(_send_4_PARM_4 + 1),a
      0002A1 F5 1D            [12]  742 	mov	_send_4_PARM_5,a
      0002A3 F5 1E            [12]  743 	mov	(_send_4_PARM_5 + 1),a
      0002A5 75 1F 66         [24]  744 	mov	_send_4_PARM_6,#0x66
      0002A8 F5 20            [12]  745 	mov	(_send_4_PARM_6 + 1),a
      0002AA 90 00 0F         [24]  746 	mov	dptr,#0x000f
      0002AD 12 04 A0         [24]  747 	lcall	_send_4
                                    748 ;	main.c:155: send_4(0x0005, 0x04, 255, 255, 255, 0);
      0002B0 75 17 04         [24]  749 	mov	_send_4_PARM_2,#0x04
      0002B3 75 18 00         [24]  750 	mov	(_send_4_PARM_2 + 1),#0x00
      0002B6 75 19 FF         [24]  751 	mov	_send_4_PARM_3,#0xff
      0002B9 75 1A 00         [24]  752 	mov	(_send_4_PARM_3 + 1),#0x00
      0002BC 75 1B FF         [24]  753 	mov	_send_4_PARM_4,#0xff
      0002BF 75 1C 00         [24]  754 	mov	(_send_4_PARM_4 + 1),#0x00
      0002C2 75 1D FF         [24]  755 	mov	_send_4_PARM_5,#0xff
      0002C5 E4               [12]  756 	clr	a
      0002C6 F5 1E            [12]  757 	mov	(_send_4_PARM_5 + 1),a
      0002C8 F5 1F            [12]  758 	mov	_send_4_PARM_6,a
      0002CA F5 20            [12]  759 	mov	(_send_4_PARM_6 + 1),a
      0002CC 90 00 05         [24]  760 	mov	dptr,#0x0005
      0002CF 12 04 A0         [24]  761 	lcall	_send_4
                                    762 ;	main.c:157: send_4(0x0001, 0x04, 192, 168, 0, 1);
      0002D2 75 17 04         [24]  763 	mov	_send_4_PARM_2,#0x04
      0002D5 75 18 00         [24]  764 	mov	(_send_4_PARM_2 + 1),#0x00
      0002D8 75 19 C0         [24]  765 	mov	_send_4_PARM_3,#0xc0
      0002DB 75 1A 00         [24]  766 	mov	(_send_4_PARM_3 + 1),#0x00
      0002DE 75 1B A8         [24]  767 	mov	_send_4_PARM_4,#0xa8
      0002E1 E4               [12]  768 	clr	a
      0002E2 F5 1C            [12]  769 	mov	(_send_4_PARM_4 + 1),a
      0002E4 F5 1D            [12]  770 	mov	_send_4_PARM_5,a
      0002E6 F5 1E            [12]  771 	mov	(_send_4_PARM_5 + 1),a
      0002E8 75 1F 01         [24]  772 	mov	_send_4_PARM_6,#0x01
      0002EB F5 20            [12]  773 	mov	(_send_4_PARM_6 + 1),a
      0002ED 90 00 01         [24]  774 	mov	dptr,#0x0001
      0002F0 12 04 A0         [24]  775 	lcall	_send_4
                                    776 ;	main.c:159: set_mac_adr(0x4e,0x12,0xC4,0xba,0x1c,0x3e);
      0002F3 75 23 12         [24]  777 	mov	_set_mac_adr_PARM_2,#0x12
      0002F6 75 24 00         [24]  778 	mov	(_set_mac_adr_PARM_2 + 1),#0x00
      0002F9 75 25 C4         [24]  779 	mov	_set_mac_adr_PARM_3,#0xc4
      0002FC 75 26 00         [24]  780 	mov	(_set_mac_adr_PARM_3 + 1),#0x00
      0002FF 75 27 BA         [24]  781 	mov	_set_mac_adr_PARM_4,#0xba
      000302 75 28 00         [24]  782 	mov	(_set_mac_adr_PARM_4 + 1),#0x00
      000305 75 29 1C         [24]  783 	mov	_set_mac_adr_PARM_5,#0x1c
      000308 75 2A 00         [24]  784 	mov	(_set_mac_adr_PARM_5 + 1),#0x00
      00030B 75 2B 3E         [24]  785 	mov	_set_mac_adr_PARM_6,#0x3e
      00030E 75 2C 00         [24]  786 	mov	(_set_mac_adr_PARM_6 + 1),#0x00
      000311 90 00 4E         [24]  787 	mov	dptr,#0x004e
                                    788 ;	main.c:160: }
      000314 02 05 35         [24]  789 	ljmp	_set_mac_adr
                                    790 ;------------------------------------------------------------
                                    791 ;Allocation info for local variables in function 'UDP_socket_init'
                                    792 ;------------------------------------------------------------
                                    793 ;	main.c:162: void UDP_socket_init(void){
                                    794 ;	-----------------------------------------
                                    795 ;	 function UDP_socket_init
                                    796 ;	-----------------------------------------
      000317                        797 _UDP_socket_init:
                                    798 ;	main.c:164: send_2(0x0004, 0x0C, 0xE7, 0x9D);
      000317 75 11 0C         [24]  799 	mov	_send_2_PARM_2,#0x0c
      00031A 75 12 00         [24]  800 	mov	(_send_2_PARM_2 + 1),#0x00
      00031D 75 13 E7         [24]  801 	mov	_send_2_PARM_3,#0xe7
      000320 75 14 00         [24]  802 	mov	(_send_2_PARM_3 + 1),#0x00
      000323 75 15 9D         [24]  803 	mov	_send_2_PARM_4,#0x9d
      000326 75 16 00         [24]  804 	mov	(_send_2_PARM_4 + 1),#0x00
      000329 90 00 04         [24]  805 	mov	dptr,#0x0004
      00032C 12 04 6A         [24]  806 	lcall	_send_2
                                    807 ;	main.c:166: send_1(0x0000, 0x0C, 0x02);
      00032F 75 0D 0C         [24]  808 	mov	_send_1_PARM_2,#0x0c
      000332 75 0E 00         [24]  809 	mov	(_send_1_PARM_2 + 1),#0x00
      000335 75 0F 02         [24]  810 	mov	_send_1_PARM_3,#0x02
      000338 75 10 00         [24]  811 	mov	(_send_1_PARM_3 + 1),#0x00
      00033B 90 00 00         [24]  812 	mov	dptr,#0x0000
      00033E 12 04 3A         [24]  813 	lcall	_send_1
                                    814 ;	main.c:168: send_1(0x0001, 0x0C, 0x01);
      000341 75 0D 0C         [24]  815 	mov	_send_1_PARM_2,#0x0c
      000344 75 0E 00         [24]  816 	mov	(_send_1_PARM_2 + 1),#0x00
      000347 75 0F 01         [24]  817 	mov	_send_1_PARM_3,#0x01
      00034A 75 10 00         [24]  818 	mov	(_send_1_PARM_3 + 1),#0x00
      00034D 90 00 01         [24]  819 	mov	dptr,#0x0001
      000350 12 04 3A         [24]  820 	lcall	_send_1
                                    821 ;	main.c:170: send_4(0x000C, 0x0C, 192, 168, 0, 101);
      000353 75 17 0C         [24]  822 	mov	_send_4_PARM_2,#0x0c
      000356 75 18 00         [24]  823 	mov	(_send_4_PARM_2 + 1),#0x00
      000359 75 19 C0         [24]  824 	mov	_send_4_PARM_3,#0xc0
      00035C 75 1A 00         [24]  825 	mov	(_send_4_PARM_3 + 1),#0x00
      00035F 75 1B A8         [24]  826 	mov	_send_4_PARM_4,#0xa8
      000362 E4               [12]  827 	clr	a
      000363 F5 1C            [12]  828 	mov	(_send_4_PARM_4 + 1),a
      000365 F5 1D            [12]  829 	mov	_send_4_PARM_5,a
      000367 F5 1E            [12]  830 	mov	(_send_4_PARM_5 + 1),a
      000369 75 1F 65         [24]  831 	mov	_send_4_PARM_6,#0x65
      00036C F5 20            [12]  832 	mov	(_send_4_PARM_6 + 1),a
      00036E 90 00 0C         [24]  833 	mov	dptr,#0x000c
      000371 12 04 A0         [24]  834 	lcall	_send_4
                                    835 ;	main.c:172: send_2(0x0010, 0x0C, 0xE7, 0x9D);
      000374 75 11 0C         [24]  836 	mov	_send_2_PARM_2,#0x0c
      000377 75 12 00         [24]  837 	mov	(_send_2_PARM_2 + 1),#0x00
      00037A 75 13 E7         [24]  838 	mov	_send_2_PARM_3,#0xe7
      00037D 75 14 00         [24]  839 	mov	(_send_2_PARM_3 + 1),#0x00
      000380 75 15 9D         [24]  840 	mov	_send_2_PARM_4,#0x9d
      000383 75 16 00         [24]  841 	mov	(_send_2_PARM_4 + 1),#0x00
      000386 90 00 10         [24]  842 	mov	dptr,#0x0010
                                    843 ;	main.c:173: }
      000389 02 04 6A         [24]  844 	ljmp	_send_2
                                    845 ;------------------------------------------------------------
                                    846 ;Allocation info for local variables in function 'TCP_socket_init'
                                    847 ;------------------------------------------------------------
                                    848 ;	main.c:175: void TCP_socket_init(void){
                                    849 ;	-----------------------------------------
                                    850 ;	 function TCP_socket_init
                                    851 ;	-----------------------------------------
      00038C                        852 _TCP_socket_init:
                                    853 ;	main.c:177: send_1(0x0000, 0x2C, 0x01);
      00038C 75 0D 2C         [24]  854 	mov	_send_1_PARM_2,#0x2c
      00038F 75 0E 00         [24]  855 	mov	(_send_1_PARM_2 + 1),#0x00
      000392 75 0F 01         [24]  856 	mov	_send_1_PARM_3,#0x01
      000395 75 10 00         [24]  857 	mov	(_send_1_PARM_3 + 1),#0x00
      000398 90 00 00         [24]  858 	mov	dptr,#0x0000
      00039B 12 04 3A         [24]  859 	lcall	_send_1
                                    860 ;	main.c:179: send_2(0x0004, 0x2C, 0xE7, 0x9E);
      00039E 75 11 2C         [24]  861 	mov	_send_2_PARM_2,#0x2c
      0003A1 75 12 00         [24]  862 	mov	(_send_2_PARM_2 + 1),#0x00
      0003A4 75 13 E7         [24]  863 	mov	_send_2_PARM_3,#0xe7
      0003A7 75 14 00         [24]  864 	mov	(_send_2_PARM_3 + 1),#0x00
      0003AA 75 15 9E         [24]  865 	mov	_send_2_PARM_4,#0x9e
      0003AD 75 16 00         [24]  866 	mov	(_send_2_PARM_4 + 1),#0x00
      0003B0 90 00 04         [24]  867 	mov	dptr,#0x0004
      0003B3 12 04 6A         [24]  868 	lcall	_send_2
                                    869 ;	main.c:181: send_1(0x0001, 0x2C, 0x01);
      0003B6 75 0D 2C         [24]  870 	mov	_send_1_PARM_2,#0x2c
      0003B9 75 0E 00         [24]  871 	mov	(_send_1_PARM_2 + 1),#0x00
      0003BC 75 0F 01         [24]  872 	mov	_send_1_PARM_3,#0x01
      0003BF 75 10 00         [24]  873 	mov	(_send_1_PARM_3 + 1),#0x00
      0003C2 90 00 01         [24]  874 	mov	dptr,#0x0001
      0003C5 12 04 3A         [24]  875 	lcall	_send_1
                                    876 ;	main.c:183: send_1(0x0001, 0x2C, 0x02);
      0003C8 75 0D 2C         [24]  877 	mov	_send_1_PARM_2,#0x2c
      0003CB 75 0E 00         [24]  878 	mov	(_send_1_PARM_2 + 1),#0x00
      0003CE 75 0F 02         [24]  879 	mov	_send_1_PARM_3,#0x02
      0003D1 75 10 00         [24]  880 	mov	(_send_1_PARM_3 + 1),#0x00
      0003D4 90 00 01         [24]  881 	mov	dptr,#0x0001
                                    882 ;	main.c:184: }
      0003D7 02 04 3A         [24]  883 	ljmp	_send_1
                                    884 ;------------------------------------------------------------
                                    885 ;Allocation info for local variables in function 'socket_status_poll'
                                    886 ;------------------------------------------------------------
                                    887 ;socket                    Allocated with name '_socket_status_poll_PARM_2'
                                    888 ;status                    Allocated to registers r5 r6 r7 
                                    889 ;------------------------------------------------------------
                                    890 ;	main.c:186: void socket_status_poll(unsigned char* status, unsigned char socket){
                                    891 ;	-----------------------------------------
                                    892 ;	 function socket_status_poll
                                    893 ;	-----------------------------------------
      0003DA                        894 _socket_status_poll:
      0003DA AD 82            [24]  895 	mov	r5, dpl
      0003DC AE 83            [24]  896 	mov	r6, dph
      0003DE AF F0            [24]  897 	mov	r7, b
                                    898 ;	main.c:187: switch (socket)
      0003E0 E4               [12]  899 	clr	a
      0003E1 B5 0C 02         [24]  900 	cjne	a,_socket_status_poll_PARM_2,00119$
      0003E4 80 07            [24]  901 	sjmp	00101$
      0003E6                        902 00119$:
      0003E6 74 01            [12]  903 	mov	a,#0x01
                                    904 ;	main.c:189: case 0:
      0003E8 B5 0C 4E         [24]  905 	cjne	a,_socket_status_poll_PARM_2,00105$
      0003EB 80 26            [24]  906 	sjmp	00102$
      0003ED                        907 00101$:
                                    908 ;	main.c:190: *status = get_2(0x0003, 0x08) >> 8;
      0003ED 75 21 08         [24]  909 	mov	_get_2_PARM_2,#0x08
      0003F0 75 22 00         [24]  910 	mov	(_get_2_PARM_2 + 1),#0x00
      0003F3 90 00 03         [24]  911 	mov	dptr,#0x0003
      0003F6 C0 07            [24]  912 	push	ar7
      0003F8 C0 06            [24]  913 	push	ar6
      0003FA C0 05            [24]  914 	push	ar5
      0003FC 12 04 E2         [24]  915 	lcall	_get_2
      0003FF AC 83            [24]  916 	mov	r4, dph
      000401 D0 05            [24]  917 	pop	ar5
      000403 D0 06            [24]  918 	pop	ar6
      000405 D0 07            [24]  919 	pop	ar7
      000407 8C 03            [24]  920 	mov	ar3,r4
      000409 8D 82            [24]  921 	mov	dpl,r5
      00040B 8E 83            [24]  922 	mov	dph,r6
      00040D 8F F0            [24]  923 	mov	b,r7
      00040F EB               [12]  924 	mov	a,r3
                                    925 ;	main.c:191: break;
                                    926 ;	main.c:192: case 1: 
      000410 02 18 8F         [24]  927 	ljmp	__gptrput
      000413                        928 00102$:
                                    929 ;	main.c:193: *status = get_2(0x0003, 0x28) >> 8;
      000413 75 21 28         [24]  930 	mov	_get_2_PARM_2,#0x28
      000416 75 22 00         [24]  931 	mov	(_get_2_PARM_2 + 1),#0x00
      000419 90 00 03         [24]  932 	mov	dptr,#0x0003
      00041C C0 07            [24]  933 	push	ar7
      00041E C0 06            [24]  934 	push	ar6
      000420 C0 05            [24]  935 	push	ar5
      000422 12 04 E2         [24]  936 	lcall	_get_2
      000425 AC 83            [24]  937 	mov	r4, dph
      000427 D0 05            [24]  938 	pop	ar5
      000429 D0 06            [24]  939 	pop	ar6
      00042B D0 07            [24]  940 	pop	ar7
      00042D 8C 03            [24]  941 	mov	ar3,r4
      00042F 8D 82            [24]  942 	mov	dpl,r5
      000431 8E 83            [24]  943 	mov	dph,r6
      000433 8F F0            [24]  944 	mov	b,r7
      000435 EB               [12]  945 	mov	a,r3
                                    946 ;	main.c:197: }
                                    947 ;	main.c:198: }
      000436 02 18 8F         [24]  948 	ljmp	__gptrput
      000439                        949 00105$:
      000439 22               [24]  950 	ret
                                    951 	.area CSEG    (CODE)
                                    952 	.area CONST   (CODE)
                                    953 	.area CONST   (CODE)
      0019CB                        954 ___str_0:
      0019CB 53 65 74 75 70 20 43   955 	.ascii "Setup Complete "
             6F 6D 70 6C 65 74 65
             20
      0019DA 0D                     956 	.db 0x0d
      0019DB 0A                     957 	.db 0x0a
      0019DC 00                     958 	.db 0x00
                                    959 	.area CSEG    (CODE)
                                    960 	.area CONST   (CODE)
      0019DD                        961 ___str_1:
      0019DD 47 6F 69 6E 67 20 62   962 	.ascii "Going back to sleep"
             61 63 6B 20 74 6F 20
             73 6C 65 65 70
      0019F0 0D                     963 	.db 0x0d
      0019F1 0A                     964 	.db 0x0a
      0019F2 00                     965 	.db 0x00
                                    966 	.area CSEG    (CODE)
                                    967 	.area CONST   (CODE)
      0019F3                        968 ___str_2:
      0019F3 0D                     969 	.db 0x0d
      0019F4 0A                     970 	.db 0x0a
      0019F5 00                     971 	.db 0x00
                                    972 	.area CSEG    (CODE)
                                    973 	.area CONST   (CODE)
      0019F6                        974 ___str_3:
      0019F6 53 65 74 2F 43 68 61   975 	.ascii "Set/Change RTU Address (0-9) using: RTU=#"
             6E 67 65 20 52 54 55
             20 41 64 64 72 65 73
             73 20 28 30 2D 39 29
             20 75 73 69 6E 67 3A
             20 52 54 55 3D 23
      001A1F 0D                     976 	.db 0x0d
      001A20 0A                     977 	.db 0x0a
      001A21 53 65 74 2F 43 68 61   978 	.ascii "Set/Change IP address using: IP=###.###.###.###"
             6E 67 65 20 49 50 20
             61 64 64 72 65 73 73
             20 75 73 69 6E 67 3A
             20 49 50 3D 23 23 23
             2E 23 23 23 2E 23 23
             23 2E 23 23 23
      001A50 0D                     979 	.db 0x0d
      001A51 0A                     980 	.db 0x0a
      001A52 53 65 74 2F 43 68 61   981 	.ascii "Set/Change Subnet Mask using: SUB=###.###.###.###"
             6E 67 65 20 53 75 62
             6E 65 74 20 4D 61 73
             6B 20 75 73 69 6E 67
             3A 20 53 55 42 3D 23
             23 23 2E 23 23 23 2E
             23 23 23 2E 23 23 23
      001A83 0D                     982 	.db 0x0d
      001A84 0A                     983 	.db 0x0a
      001A85 00                     984 	.db 0x00
                                    985 	.area CSEG    (CODE)
                                    986 	.area CONST   (CODE)
      001A86                        987 ___str_4:
      001A86 53 65 74 2F 43 68 61   988 	.ascii "Set/Change Gateway using: GATE=###.###.###.###"
             6E 67 65 20 47 61 74
             65 77 61 79 20 75 73
             69 6E 67 3A 20 47 41
             54 45 3D 23 23 23 2E
             23 23 23 2E 23 23 23
             2E 23 23 23
      001AB4 0D                     989 	.db 0x0d
      001AB5 0A                     990 	.db 0x0a
      001AB6 53 65 74 2F 43 68 61   991 	.ascii "Set/Change MAC Address using: MAC=############"
             6E 67 65 20 4D 41 43
             20 41 64 64 72 65 73
             73 20 75 73 69 6E 67
             3A 20 4D 41 43 3D 23
             23 23 23 23 23 23 23
             23 23 23 23
      001AE4 0D                     992 	.db 0x0d
      001AE5 0A                     993 	.db 0x0a
      001AE6 43 68 61 6E 67 65 20   994 	.ascii "Change Mode using: MODE="
             4D 6F 64 65 20 75 73
             69 6E 67 3A 20 4D 4F
             44 45 3D
      001AFE 0D                     995 	.db 0x0d
      001AFF 0A                     996 	.db 0x0a
      001B00 00                     997 	.db 0x00
                                    998 	.area CSEG    (CODE)
                                    999 	.area CONST   (CODE)
      001B01                       1000 ___str_5:
      001B01 08                    1001 	.db 0x08
      001B02 20                    1002 	.ascii " "
      001B03 08                    1003 	.db 0x08
      001B04 00                    1004 	.db 0x00
                                   1005 	.area CSEG    (CODE)
                                   1006 	.area XINIT   (CODE)
                                   1007 	.area CABS    (ABS,CODE)
