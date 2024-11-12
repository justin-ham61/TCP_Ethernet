                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.4.0 #14620 (MINGW32)
                                      4 ;--------------------------------------------------------
                                      5 	.module IR
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _write_to_buffer
                                     12 	.globl _clear_buffer
                                     13 	.globl _send_1
                                     14 	.globl _transmit_string
                                     15 	.globl _read_RX_buffer
                                     16 	.globl _end
                                     17 	.globl _begin
                                     18 	.globl _shift_out
                                     19 	.globl _shift_in
                                     20 	.globl _CY
                                     21 	.globl _AC
                                     22 	.globl _F0
                                     23 	.globl _RS1
                                     24 	.globl _RS0
                                     25 	.globl _OV
                                     26 	.globl _F1
                                     27 	.globl _P
                                     28 	.globl _PS
                                     29 	.globl _PT1
                                     30 	.globl _PX1
                                     31 	.globl _PT0
                                     32 	.globl _PX0
                                     33 	.globl _RD
                                     34 	.globl _WR
                                     35 	.globl _T1
                                     36 	.globl _T0
                                     37 	.globl _INT1
                                     38 	.globl _INT0
                                     39 	.globl _TXD
                                     40 	.globl _RXD
                                     41 	.globl _P3_7
                                     42 	.globl _P3_6
                                     43 	.globl _P3_5
                                     44 	.globl _P3_4
                                     45 	.globl _P3_3
                                     46 	.globl _P3_2
                                     47 	.globl _P3_1
                                     48 	.globl _P3_0
                                     49 	.globl _EA
                                     50 	.globl _ES
                                     51 	.globl _ET1
                                     52 	.globl _EX1
                                     53 	.globl _ET0
                                     54 	.globl _EX0
                                     55 	.globl _P2_7
                                     56 	.globl _P2_6
                                     57 	.globl _P2_5
                                     58 	.globl _P2_4
                                     59 	.globl _P2_3
                                     60 	.globl _P2_2
                                     61 	.globl _P2_1
                                     62 	.globl _P2_0
                                     63 	.globl _SM0
                                     64 	.globl _SM1
                                     65 	.globl _SM2
                                     66 	.globl _REN
                                     67 	.globl _TB8
                                     68 	.globl _RB8
                                     69 	.globl _TI
                                     70 	.globl _RI
                                     71 	.globl _P1_7
                                     72 	.globl _P1_6
                                     73 	.globl _P1_5
                                     74 	.globl _P1_4
                                     75 	.globl _P1_3
                                     76 	.globl _P1_2
                                     77 	.globl _P1_1
                                     78 	.globl _P1_0
                                     79 	.globl _TF1
                                     80 	.globl _TR1
                                     81 	.globl _TF0
                                     82 	.globl _TR0
                                     83 	.globl _IE1
                                     84 	.globl _IT1
                                     85 	.globl _IE0
                                     86 	.globl _IT0
                                     87 	.globl _P0_7
                                     88 	.globl _P0_6
                                     89 	.globl _P0_5
                                     90 	.globl _P0_4
                                     91 	.globl _P0_3
                                     92 	.globl _P0_2
                                     93 	.globl _P0_1
                                     94 	.globl _P0_0
                                     95 	.globl _B
                                     96 	.globl _ACC
                                     97 	.globl _PSW
                                     98 	.globl _IP
                                     99 	.globl _P3
                                    100 	.globl _IE
                                    101 	.globl _P2
                                    102 	.globl _SBUF
                                    103 	.globl _SCON
                                    104 	.globl _P1
                                    105 	.globl _TH1
                                    106 	.globl _TH0
                                    107 	.globl _TL1
                                    108 	.globl _TL0
                                    109 	.globl _TMOD
                                    110 	.globl _TCON
                                    111 	.globl _PCON
                                    112 	.globl _DPH
                                    113 	.globl _DPL
                                    114 	.globl _SP
                                    115 	.globl _P0
                                    116 	.globl _get_Sn_IR_PARM_2
                                    117 	.globl _SIR_poll
                                    118 	.globl _get_Sn_IR
                                    119 	.globl _get_SIR
                                    120 	.globl _process_buff
                                    121 ;--------------------------------------------------------
                                    122 ; special function registers
                                    123 ;--------------------------------------------------------
                                    124 	.area RSEG    (ABS,DATA)
      000000                        125 	.org 0x0000
                           000080   126 _P0	=	0x0080
                           000081   127 _SP	=	0x0081
                           000082   128 _DPL	=	0x0082
                           000083   129 _DPH	=	0x0083
                           000087   130 _PCON	=	0x0087
                           000088   131 _TCON	=	0x0088
                           000089   132 _TMOD	=	0x0089
                           00008A   133 _TL0	=	0x008a
                           00008B   134 _TL1	=	0x008b
                           00008C   135 _TH0	=	0x008c
                           00008D   136 _TH1	=	0x008d
                           000090   137 _P1	=	0x0090
                           000098   138 _SCON	=	0x0098
                           000099   139 _SBUF	=	0x0099
                           0000A0   140 _P2	=	0x00a0
                           0000A8   141 _IE	=	0x00a8
                           0000B0   142 _P3	=	0x00b0
                           0000B8   143 _IP	=	0x00b8
                           0000D0   144 _PSW	=	0x00d0
                           0000E0   145 _ACC	=	0x00e0
                           0000F0   146 _B	=	0x00f0
                                    147 ;--------------------------------------------------------
                                    148 ; special function bits
                                    149 ;--------------------------------------------------------
                                    150 	.area RSEG    (ABS,DATA)
      000000                        151 	.org 0x0000
                           000080   152 _P0_0	=	0x0080
                           000081   153 _P0_1	=	0x0081
                           000082   154 _P0_2	=	0x0082
                           000083   155 _P0_3	=	0x0083
                           000084   156 _P0_4	=	0x0084
                           000085   157 _P0_5	=	0x0085
                           000086   158 _P0_6	=	0x0086
                           000087   159 _P0_7	=	0x0087
                           000088   160 _IT0	=	0x0088
                           000089   161 _IE0	=	0x0089
                           00008A   162 _IT1	=	0x008a
                           00008B   163 _IE1	=	0x008b
                           00008C   164 _TR0	=	0x008c
                           00008D   165 _TF0	=	0x008d
                           00008E   166 _TR1	=	0x008e
                           00008F   167 _TF1	=	0x008f
                           000090   168 _P1_0	=	0x0090
                           000091   169 _P1_1	=	0x0091
                           000092   170 _P1_2	=	0x0092
                           000093   171 _P1_3	=	0x0093
                           000094   172 _P1_4	=	0x0094
                           000095   173 _P1_5	=	0x0095
                           000096   174 _P1_6	=	0x0096
                           000097   175 _P1_7	=	0x0097
                           000098   176 _RI	=	0x0098
                           000099   177 _TI	=	0x0099
                           00009A   178 _RB8	=	0x009a
                           00009B   179 _TB8	=	0x009b
                           00009C   180 _REN	=	0x009c
                           00009D   181 _SM2	=	0x009d
                           00009E   182 _SM1	=	0x009e
                           00009F   183 _SM0	=	0x009f
                           0000A0   184 _P2_0	=	0x00a0
                           0000A1   185 _P2_1	=	0x00a1
                           0000A2   186 _P2_2	=	0x00a2
                           0000A3   187 _P2_3	=	0x00a3
                           0000A4   188 _P2_4	=	0x00a4
                           0000A5   189 _P2_5	=	0x00a5
                           0000A6   190 _P2_6	=	0x00a6
                           0000A7   191 _P2_7	=	0x00a7
                           0000A8   192 _EX0	=	0x00a8
                           0000A9   193 _ET0	=	0x00a9
                           0000AA   194 _EX1	=	0x00aa
                           0000AB   195 _ET1	=	0x00ab
                           0000AC   196 _ES	=	0x00ac
                           0000AF   197 _EA	=	0x00af
                           0000B0   198 _P3_0	=	0x00b0
                           0000B1   199 _P3_1	=	0x00b1
                           0000B2   200 _P3_2	=	0x00b2
                           0000B3   201 _P3_3	=	0x00b3
                           0000B4   202 _P3_4	=	0x00b4
                           0000B5   203 _P3_5	=	0x00b5
                           0000B6   204 _P3_6	=	0x00b6
                           0000B7   205 _P3_7	=	0x00b7
                           0000B0   206 _RXD	=	0x00b0
                           0000B1   207 _TXD	=	0x00b1
                           0000B2   208 _INT0	=	0x00b2
                           0000B3   209 _INT1	=	0x00b3
                           0000B4   210 _T0	=	0x00b4
                           0000B5   211 _T1	=	0x00b5
                           0000B6   212 _WR	=	0x00b6
                           0000B7   213 _RD	=	0x00b7
                           0000B8   214 _PX0	=	0x00b8
                           0000B9   215 _PT0	=	0x00b9
                           0000BA   216 _PX1	=	0x00ba
                           0000BB   217 _PT1	=	0x00bb
                           0000BC   218 _PS	=	0x00bc
                           0000D0   219 _P	=	0x00d0
                           0000D1   220 _F1	=	0x00d1
                           0000D2   221 _OV	=	0x00d2
                           0000D3   222 _RS0	=	0x00d3
                           0000D4   223 _RS1	=	0x00d4
                           0000D5   224 _F0	=	0x00d5
                           0000D6   225 _AC	=	0x00d6
                           0000D7   226 _CY	=	0x00d7
                                    227 ;--------------------------------------------------------
                                    228 ; overlayable register banks
                                    229 ;--------------------------------------------------------
                                    230 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        231 	.ds 8
                                    232 ;--------------------------------------------------------
                                    233 ; internal ram data
                                    234 ;--------------------------------------------------------
                                    235 	.area DSEG    (DATA)
      00002D                        236 _SIR_poll_ir_10000_27:
      00002D                        237 	.ds 1
      00002E                        238 _SIR_poll_socket_10000_27:
      00002E                        239 	.ds 1
      00002F                        240 _get_Sn_IR_PARM_2:
      00002F                        241 	.ds 3
      000032                        242 _get_SIR_sir_byte_10000_43:
      000032                        243 	.ds 1
                                    244 ;--------------------------------------------------------
                                    245 ; overlayable items in internal ram
                                    246 ;--------------------------------------------------------
                                    247 	.area	OSEG    (OVR,DATA)
                                    248 ;--------------------------------------------------------
                                    249 ; indirectly addressable internal ram data
                                    250 ;--------------------------------------------------------
                                    251 	.area ISEG    (DATA)
                                    252 ;--------------------------------------------------------
                                    253 ; absolute internal ram data
                                    254 ;--------------------------------------------------------
                                    255 	.area IABS    (ABS,DATA)
                                    256 	.area IABS    (ABS,DATA)
                                    257 ;--------------------------------------------------------
                                    258 ; bit data
                                    259 ;--------------------------------------------------------
                                    260 	.area BSEG    (BIT)
                                    261 ;--------------------------------------------------------
                                    262 ; paged external ram data
                                    263 ;--------------------------------------------------------
                                    264 	.area PSEG    (PAG,XDATA)
                                    265 ;--------------------------------------------------------
                                    266 ; uninitialized external ram data
                                    267 ;--------------------------------------------------------
                                    268 	.area XSEG    (XDATA)
                                    269 ;--------------------------------------------------------
                                    270 ; absolute external ram data
                                    271 ;--------------------------------------------------------
                                    272 	.area XABS    (ABS,XDATA)
                                    273 ;--------------------------------------------------------
                                    274 ; initialized external ram data
                                    275 ;--------------------------------------------------------
                                    276 	.area XISEG   (XDATA)
                                    277 	.area HOME    (CODE)
                                    278 	.area GSINIT0 (CODE)
                                    279 	.area GSINIT1 (CODE)
                                    280 	.area GSINIT2 (CODE)
                                    281 	.area GSINIT3 (CODE)
                                    282 	.area GSINIT4 (CODE)
                                    283 	.area GSINIT5 (CODE)
                                    284 	.area GSINIT  (CODE)
                                    285 	.area GSFINAL (CODE)
                                    286 	.area CSEG    (CODE)
                                    287 ;--------------------------------------------------------
                                    288 ; global & static initialisations
                                    289 ;--------------------------------------------------------
                                    290 	.area HOME    (CODE)
                                    291 	.area GSINIT  (CODE)
                                    292 	.area GSFINAL (CODE)
                                    293 	.area GSINIT  (CODE)
                                    294 ;--------------------------------------------------------
                                    295 ; Home
                                    296 ;--------------------------------------------------------
                                    297 	.area HOME    (CODE)
                                    298 	.area HOME    (CODE)
                                    299 ;--------------------------------------------------------
                                    300 ; code
                                    301 ;--------------------------------------------------------
                                    302 	.area CSEG    (CODE)
                                    303 ;------------------------------------------------------------
                                    304 ;Allocation info for local variables in function 'SIR_poll'
                                    305 ;------------------------------------------------------------
                                    306 ;ir                        Allocated with name '_SIR_poll_ir_10000_27'
                                    307 ;socket                    Allocated with name '_SIR_poll_socket_10000_27'
                                    308 ;cntl_byte                 Allocated to registers r7 
                                    309 ;length                    Allocated to registers 
                                    310 ;x                         Allocated to registers r6 
                                    311 ;------------------------------------------------------------
                                    312 ;	.\IR.c:18: void SIR_poll(void){
                                    313 ;	-----------------------------------------
                                    314 ;	 function SIR_poll
                                    315 ;	-----------------------------------------
      0008A5                        316 _SIR_poll:
                           000007   317 	ar7 = 0x07
                           000006   318 	ar6 = 0x06
                           000005   319 	ar5 = 0x05
                           000004   320 	ar4 = 0x04
                           000003   321 	ar3 = 0x03
                           000002   322 	ar2 = 0x02
                           000001   323 	ar1 = 0x01
                           000000   324 	ar0 = 0x00
                                    325 ;	.\IR.c:19: unsigned char ir = 0;
      0008A5 75 2D 00         [24]  326 	mov	_SIR_poll_ir_10000_27,#0x00
                                    327 ;	.\IR.c:20: unsigned char socket = 0;
      0008A8 75 2E 00         [24]  328 	mov	_SIR_poll_socket_10000_27,#0x00
                                    329 ;	.\IR.c:21: unsigned char cntl_byte = 0;
      0008AB 7F 00            [12]  330 	mov	r7,#0x00
                                    331 ;	.\IR.c:22: get_SIR(&socket);
      0008AD 90 00 2E         [24]  332 	mov	dptr,#_SIR_poll_socket_10000_27
      0008B0 75 F0 40         [24]  333 	mov	b, #0x40
      0008B3 C0 07            [24]  334 	push	ar7
      0008B5 12 0B 6D         [24]  335 	lcall	_get_SIR
                                    336 ;	.\IR.c:23: get_Sn_IR(socket, &ir);
      0008B8 AD 2E            [24]  337 	mov	r5,_SIR_poll_socket_10000_27
      0008BA 7E 00            [12]  338 	mov	r6,#0x00
      0008BC 75 2F 2D         [24]  339 	mov	_get_Sn_IR_PARM_2,#_SIR_poll_ir_10000_27
      0008BF 8E 30            [24]  340 	mov	(_get_Sn_IR_PARM_2 + 1),r6
      0008C1 75 31 40         [24]  341 	mov	(_get_Sn_IR_PARM_2 + 2),#0x40
      0008C4 8D 82            [24]  342 	mov	dpl, r5
      0008C6 8E 83            [24]  343 	mov	dph, r6
      0008C8 12 0B 10         [24]  344 	lcall	_get_Sn_IR
      0008CB D0 07            [24]  345 	pop	ar7
                                    346 ;	.\IR.c:26: if(ir != 0){
      0008CD E5 2D            [12]  347 	mov	a,_SIR_poll_ir_10000_27
      0008CF 60 05            [24]  348 	jz	00102$
                                    349 ;	.\IR.c:27: inactivity_counter = 0;
      0008D1 75 60 00         [24]  350 	mov	_inactivity_counter,#0x00
      0008D4 80 02            [24]  351 	sjmp	00103$
      0008D6                        352 00102$:
                                    353 ;	.\IR.c:29: inactivity_counter++;
      0008D6 05 60            [12]  354 	inc	_inactivity_counter
      0008D8                        355 00103$:
                                    356 ;	.\IR.c:32: if(P3_2 == 0){
      0008D8 30 B2 03         [24]  357 	jnb	_P3_2,00191$
      0008DB 02 0B 0C         [24]  358 	ljmp	00127$
      0008DE                        359 00191$:
                                    360 ;	.\IR.c:34: switch (socket)
      0008DE E4               [12]  361 	clr	a
      0008DF B5 2E 02         [24]  362 	cjne	a,_SIR_poll_socket_10000_27,00192$
      0008E2 80 07            [24]  363 	sjmp	00104$
      0008E4                        364 00192$:
      0008E4 74 01            [12]  365 	mov	a,#0x01
                                    366 ;	.\IR.c:36: case 0:
      0008E6 B5 2E 08         [24]  367 	cjne	a,_SIR_poll_socket_10000_27,00107$
      0008E9 80 04            [24]  368 	sjmp	00105$
      0008EB                        369 00104$:
                                    370 ;	.\IR.c:37: cntl_byte = 0x0C;
      0008EB 7F 0C            [12]  371 	mov	r7,#0x0c
                                    372 ;	.\IR.c:38: break;
                                    373 ;	.\IR.c:39: case 1: 
      0008ED 80 02            [24]  374 	sjmp	00107$
      0008EF                        375 00105$:
                                    376 ;	.\IR.c:40: cntl_byte = 0x2C;
      0008EF 7F 2C            [12]  377 	mov	r7,#0x2c
                                    378 ;	.\IR.c:44: }
      0008F1                        379 00107$:
                                    380 ;	.\IR.c:48: if(ir & SN_IR_SEND_OK){
      0008F1 E5 2D            [12]  381 	mov	a,_SIR_poll_ir_10000_27
      0008F3 FE               [12]  382 	mov	r6,a
      0008F4 30 E4 17         [24]  383 	jnb	acc.4,00109$
                                    384 ;	.\IR.c:49: send_1(0x0002, cntl_byte, (ir & SN_IR_SEND_OK));
      0008F7 8F 0D            [24]  385 	mov	_send_1_PARM_2,r7
      0008F9 E4               [12]  386 	clr	a
      0008FA F5 0E            [12]  387 	mov	(_send_1_PARM_2 + 1),a
      0008FC FD               [12]  388 	mov	r5,a
      0008FD 74 10            [12]  389 	mov	a,#0x10
      0008FF 5E               [12]  390 	anl	a,r6
      000900 F5 0F            [12]  391 	mov	_send_1_PARM_3,a
      000902 8D 10            [24]  392 	mov	(_send_1_PARM_3 + 1),r5
      000904 90 00 02         [24]  393 	mov	dptr,#0x0002
      000907 C0 07            [24]  394 	push	ar7
      000909 12 04 3A         [24]  395 	lcall	_send_1
      00090C D0 07            [24]  396 	pop	ar7
      00090E                        397 00109$:
                                    398 ;	.\IR.c:52: if(ir & SN_IR_TIMEOUT){
      00090E E5 2D            [12]  399 	mov	a,_SIR_poll_ir_10000_27
      000910 30 E3 64         [24]  400 	jnb	acc.3,00111$
                                    401 ;	.\IR.c:53: send_1(0x0000, cntl_byte, 0x01);
      000913 8F 05            [24]  402 	mov	ar5,r7
      000915 7E 00            [12]  403 	mov	r6,#0x00
      000917 8D 0D            [24]  404 	mov	_send_1_PARM_2,r5
      000919 8E 0E            [24]  405 	mov	(_send_1_PARM_2 + 1),r6
      00091B 75 0F 01         [24]  406 	mov	_send_1_PARM_3,#0x01
      00091E 8E 10            [24]  407 	mov	(_send_1_PARM_3 + 1),r6
      000920 90 00 00         [24]  408 	mov	dptr,#0x0000
      000923 C0 07            [24]  409 	push	ar7
      000925 C0 06            [24]  410 	push	ar6
      000927 C0 05            [24]  411 	push	ar5
      000929 12 04 3A         [24]  412 	lcall	_send_1
      00092C D0 05            [24]  413 	pop	ar5
      00092E D0 06            [24]  414 	pop	ar6
                                    415 ;	.\IR.c:55: send_1(0x0001, cntl_byte, 0x01);
      000930 8D 0D            [24]  416 	mov	_send_1_PARM_2,r5
      000932 8E 0E            [24]  417 	mov	(_send_1_PARM_2 + 1),r6
      000934 75 0F 01         [24]  418 	mov	_send_1_PARM_3,#0x01
      000937 75 10 00         [24]  419 	mov	(_send_1_PARM_3 + 1),#0x00
      00093A 90 00 01         [24]  420 	mov	dptr,#0x0001
      00093D C0 06            [24]  421 	push	ar6
      00093F C0 05            [24]  422 	push	ar5
      000941 12 04 3A         [24]  423 	lcall	_send_1
      000944 D0 05            [24]  424 	pop	ar5
      000946 D0 06            [24]  425 	pop	ar6
                                    426 ;	.\IR.c:57: send_1(0x0001, cntl_byte, 0x02);
      000948 8D 0D            [24]  427 	mov	_send_1_PARM_2,r5
      00094A 8E 0E            [24]  428 	mov	(_send_1_PARM_2 + 1),r6
      00094C 75 0F 02         [24]  429 	mov	_send_1_PARM_3,#0x02
      00094F 75 10 00         [24]  430 	mov	(_send_1_PARM_3 + 1),#0x00
      000952 90 00 01         [24]  431 	mov	dptr,#0x0001
      000955 C0 06            [24]  432 	push	ar6
      000957 C0 05            [24]  433 	push	ar5
      000959 12 04 3A         [24]  434 	lcall	_send_1
      00095C D0 05            [24]  435 	pop	ar5
      00095E D0 06            [24]  436 	pop	ar6
                                    437 ;	.\IR.c:58: send_1(0x0002, cntl_byte, (ir & SN_IR_TIMEOUT));
      000960 AB 2D            [24]  438 	mov	r3,_SIR_poll_ir_10000_27
      000962 7C 00            [12]  439 	mov	r4,#0x00
      000964 74 08            [12]  440 	mov	a,#0x08
      000966 5B               [12]  441 	anl	a,r3
      000967 F5 0F            [12]  442 	mov	_send_1_PARM_3,a
      000969 8C 10            [24]  443 	mov	(_send_1_PARM_3 + 1),r4
      00096B 8D 0D            [24]  444 	mov	_send_1_PARM_2,r5
      00096D 8E 0E            [24]  445 	mov	(_send_1_PARM_2 + 1),r6
      00096F 90 00 02         [24]  446 	mov	dptr,#0x0002
      000972 12 04 3A         [24]  447 	lcall	_send_1
      000975 D0 07            [24]  448 	pop	ar7
      000977                        449 00111$:
                                    450 ;	.\IR.c:61: if(ir & SN_IR_RECV){
      000977 E5 2D            [12]  451 	mov	a,_SIR_poll_ir_10000_27
      000979 20 E2 03         [24]  452 	jb	acc.2,00196$
      00097C 02 0A B7         [24]  453 	ljmp	00121$
      00097F                        454 00196$:
                                    455 ;	.\IR.c:62: P2_2 = 0;
                                    456 ;	assignBit
      00097F C2 A2            [12]  457 	clr	_P2_2
                                    458 ;	.\IR.c:63: unsigned char length = read_RX_buffer(&socket);
      000981 90 00 2E         [24]  459 	mov	dptr,#_SIR_poll_socket_10000_27
      000984 75 F0 40         [24]  460 	mov	b, #0x40
      000987 C0 07            [24]  461 	push	ar7
      000989 12 0C 60         [24]  462 	lcall	_read_RX_buffer
                                    463 ;	.\IR.c:65: x = process_buff(0);
      00098C 75 82 00         [24]  464 	mov	dpl, #0x00
      00098F 12 0B D4         [24]  465 	lcall	_process_buff
      000992 AE 82            [24]  466 	mov	r6, dpl
      000994 D0 07            [24]  467 	pop	ar7
                                    468 ;	.\IR.c:66: switch (x){
      000996 EE               [12]  469 	mov	a,r6
      000997 24 FA            [12]  470 	add	a,#0xff - 0x05
      000999 50 03            [24]  471 	jnc	00197$
      00099B 02 0A 62         [24]  472 	ljmp	00119$
      00099E                        473 00197$:
      00099E EE               [12]  474 	mov	a,r6
      00099F 2E               [12]  475 	add	a,r6
      0009A0 2E               [12]  476 	add	a,r6
      0009A1 90 09 A5         [24]  477 	mov	dptr,#00198$
      0009A4 73               [24]  478 	jmp	@a+dptr
      0009A5                        479 00198$:
      0009A5 02 09 B7         [24]  480 	ljmp	00112$
      0009A8 02 09 CE         [24]  481 	ljmp	00113$
      0009AB 02 09 EC         [24]  482 	ljmp	00114$
      0009AE 02 0A 0A         [24]  483 	ljmp	00115$
      0009B1 02 0A 28         [24]  484 	ljmp	00116$
      0009B4 02 0A 46         [24]  485 	ljmp	00117$
                                    486 ;	.\IR.c:67: case 0:
      0009B7                        487 00112$:
                                    488 ;	.\IR.c:68: transmit_string(buffer);
      0009B7 90 00 3D         [24]  489 	mov	dptr,#_buffer
      0009BA 75 F0 40         [24]  490 	mov	b, #0x40
      0009BD C0 07            [24]  491 	push	ar7
      0009BF 12 08 6D         [24]  492 	lcall	_transmit_string
      0009C2 D0 07            [24]  493 	pop	ar7
                                    494 ;	.\IR.c:69: buffer[2] = rtu + '0';
      0009C4 AE 61            [24]  495 	mov	r6,_rtu
      0009C6 74 30            [12]  496 	mov	a,#0x30
      0009C8 2E               [12]  497 	add	a, r6
      0009C9 F5 3F            [12]  498 	mov	(_buffer + 0x0002),a
                                    499 ;	.\IR.c:70: break;
      0009CB 02 0A 62         [24]  500 	ljmp	00119$
                                    501 ;	.\IR.c:71: case 1:
      0009CE                        502 00113$:
                                    503 ;	.\IR.c:72: transmit_string("No : Found");
      0009CE 90 1B 05         [24]  504 	mov	dptr,#___str_0
      0009D1 75 F0 80         [24]  505 	mov	b, #0x80
      0009D4 C0 07            [24]  506 	push	ar7
      0009D6 12 08 6D         [24]  507 	lcall	_transmit_string
                                    508 ;	.\IR.c:73: write_to_buffer(socket, "Incorrect format: \":\"");
      0009D9 75 3A 10         [24]  509 	mov	_write_to_buffer_PARM_2,#___str_1
      0009DC 75 3B 1B         [24]  510 	mov	(_write_to_buffer_PARM_2 + 1),#(___str_1 >> 8)
      0009DF 75 3C 80         [24]  511 	mov	(_write_to_buffer_PARM_2 + 2),#0x80
      0009E2 85 2E 82         [24]  512 	mov	dpl, _SIR_poll_socket_10000_27
      0009E5 12 0E 71         [24]  513 	lcall	_write_to_buffer
      0009E8 D0 07            [24]  514 	pop	ar7
                                    515 ;	.\IR.c:74: break;
                                    516 ;	.\IR.c:75: case 2: 
      0009EA 80 76            [24]  517 	sjmp	00119$
      0009EC                        518 00114$:
                                    519 ;	.\IR.c:76: transmit_string("No < found");
      0009EC 90 1B 26         [24]  520 	mov	dptr,#___str_2
      0009EF 75 F0 80         [24]  521 	mov	b, #0x80
      0009F2 C0 07            [24]  522 	push	ar7
      0009F4 12 08 6D         [24]  523 	lcall	_transmit_string
                                    524 ;	.\IR.c:77: write_to_buffer(socket, "Incorrect format: \"<\"");
      0009F7 75 3A 31         [24]  525 	mov	_write_to_buffer_PARM_2,#___str_3
      0009FA 75 3B 1B         [24]  526 	mov	(_write_to_buffer_PARM_2 + 1),#(___str_3 >> 8)
      0009FD 75 3C 80         [24]  527 	mov	(_write_to_buffer_PARM_2 + 2),#0x80
      000A00 85 2E 82         [24]  528 	mov	dpl, _SIR_poll_socket_10000_27
      000A03 12 0E 71         [24]  529 	lcall	_write_to_buffer
      000A06 D0 07            [24]  530 	pop	ar7
                                    531 ;	.\IR.c:78: break;
                                    532 ;	.\IR.c:79: case 3: 
      000A08 80 58            [24]  533 	sjmp	00119$
      000A0A                        534 00115$:
                                    535 ;	.\IR.c:80: transmit_string("No RTU Number found");
      000A0A 90 1B 47         [24]  536 	mov	dptr,#___str_4
      000A0D 75 F0 80         [24]  537 	mov	b, #0x80
      000A10 C0 07            [24]  538 	push	ar7
      000A12 12 08 6D         [24]  539 	lcall	_transmit_string
                                    540 ;	.\IR.c:81: write_to_buffer(socket, "Wrong RTU number");
      000A15 75 3A 5B         [24]  541 	mov	_write_to_buffer_PARM_2,#___str_5
      000A18 75 3B 1B         [24]  542 	mov	(_write_to_buffer_PARM_2 + 1),#(___str_5 >> 8)
      000A1B 75 3C 80         [24]  543 	mov	(_write_to_buffer_PARM_2 + 2),#0x80
      000A1E 85 2E 82         [24]  544 	mov	dpl, _SIR_poll_socket_10000_27
      000A21 12 0E 71         [24]  545 	lcall	_write_to_buffer
      000A24 D0 07            [24]  546 	pop	ar7
                                    547 ;	.\IR.c:82: break;
                                    548 ;	.\IR.c:83: case 4:
      000A26 80 3A            [24]  549 	sjmp	00119$
      000A28                        550 00116$:
                                    551 ;	.\IR.c:84: transmit_string("Error in message format");
      000A28 90 1B 6C         [24]  552 	mov	dptr,#___str_6
      000A2B 75 F0 80         [24]  553 	mov	b, #0x80
      000A2E C0 07            [24]  554 	push	ar7
      000A30 12 08 6D         [24]  555 	lcall	_transmit_string
                                    556 ;	.\IR.c:85: write_to_buffer(socket, "Error in message format");
      000A33 75 3A 6C         [24]  557 	mov	_write_to_buffer_PARM_2,#___str_6
      000A36 75 3B 1B         [24]  558 	mov	(_write_to_buffer_PARM_2 + 1),#(___str_6 >> 8)
      000A39 75 3C 80         [24]  559 	mov	(_write_to_buffer_PARM_2 + 2),#0x80
      000A3C 85 2E 82         [24]  560 	mov	dpl, _SIR_poll_socket_10000_27
      000A3F 12 0E 71         [24]  561 	lcall	_write_to_buffer
      000A42 D0 07            [24]  562 	pop	ar7
                                    563 ;	.\IR.c:86: break;
                                    564 ;	.\IR.c:87: case 5: 
      000A44 80 1C            [24]  565 	sjmp	00119$
      000A46                        566 00117$:
                                    567 ;	.\IR.c:88: transmit_string("No > found");
      000A46 90 1B 84         [24]  568 	mov	dptr,#___str_7
      000A49 75 F0 80         [24]  569 	mov	b, #0x80
      000A4C C0 07            [24]  570 	push	ar7
      000A4E 12 08 6D         [24]  571 	lcall	_transmit_string
                                    572 ;	.\IR.c:89: write_to_buffer(socket, "Incorrect format: \">\"");
      000A51 75 3A 8F         [24]  573 	mov	_write_to_buffer_PARM_2,#___str_8
      000A54 75 3B 1B         [24]  574 	mov	(_write_to_buffer_PARM_2 + 1),#(___str_8 >> 8)
      000A57 75 3C 80         [24]  575 	mov	(_write_to_buffer_PARM_2 + 2),#0x80
      000A5A 85 2E 82         [24]  576 	mov	dpl, _SIR_poll_socket_10000_27
      000A5D 12 0E 71         [24]  577 	lcall	_write_to_buffer
      000A60 D0 07            [24]  578 	pop	ar7
                                    579 ;	.\IR.c:93: }
      000A62                        580 00119$:
                                    581 ;	.\IR.c:95: write_to_buffer(socket, &buffer[0]);
      000A62 75 3A 3D         [24]  582 	mov	_write_to_buffer_PARM_2,#_buffer
      000A65 75 3B 00         [24]  583 	mov	(_write_to_buffer_PARM_2 + 1),#0x00
      000A68 75 3C 40         [24]  584 	mov	(_write_to_buffer_PARM_2 + 2),#0x40
      000A6B 85 2E 82         [24]  585 	mov	dpl, _SIR_poll_socket_10000_27
      000A6E C0 07            [24]  586 	push	ar7
      000A70 12 0E 71         [24]  587 	lcall	_write_to_buffer
      000A73 D0 07            [24]  588 	pop	ar7
                                    589 ;	.\IR.c:96: send_1(0x0001, cntl_byte, 0x20);
      000A75 8F 05            [24]  590 	mov	ar5,r7
      000A77 7E 00            [12]  591 	mov	r6,#0x00
      000A79 8D 0D            [24]  592 	mov	_send_1_PARM_2,r5
      000A7B 8E 0E            [24]  593 	mov	(_send_1_PARM_2 + 1),r6
      000A7D 75 0F 20         [24]  594 	mov	_send_1_PARM_3,#0x20
      000A80 8E 10            [24]  595 	mov	(_send_1_PARM_3 + 1),r6
      000A82 90 00 01         [24]  596 	mov	dptr,#0x0001
      000A85 C0 07            [24]  597 	push	ar7
      000A87 C0 06            [24]  598 	push	ar6
      000A89 C0 05            [24]  599 	push	ar5
      000A8B 12 04 3A         [24]  600 	lcall	_send_1
                                    601 ;	.\IR.c:97: P2_2 = 1;
                                    602 ;	assignBit
      000A8E D2 A2            [12]  603 	setb	_P2_2
                                    604 ;	.\IR.c:98: transmit_string("\r\n");
      000A90 90 1B A5         [24]  605 	mov	dptr,#___str_9
      000A93 75 F0 80         [24]  606 	mov	b, #0x80
      000A96 12 08 6D         [24]  607 	lcall	_transmit_string
                                    608 ;	.\IR.c:99: clear_buffer();
      000A99 12 0F 80         [24]  609 	lcall	_clear_buffer
      000A9C D0 05            [24]  610 	pop	ar5
      000A9E D0 06            [24]  611 	pop	ar6
                                    612 ;	.\IR.c:100: send_1(0x0002, cntl_byte, (ir & SN_IR_RECV));
      000AA0 AB 2D            [24]  613 	mov	r3,_SIR_poll_ir_10000_27
      000AA2 7C 00            [12]  614 	mov	r4,#0x00
      000AA4 74 04            [12]  615 	mov	a,#0x04
      000AA6 5B               [12]  616 	anl	a,r3
      000AA7 F5 0F            [12]  617 	mov	_send_1_PARM_3,a
      000AA9 8C 10            [24]  618 	mov	(_send_1_PARM_3 + 1),r4
      000AAB 8D 0D            [24]  619 	mov	_send_1_PARM_2,r5
      000AAD 8E 0E            [24]  620 	mov	(_send_1_PARM_2 + 1),r6
      000AAF 90 00 02         [24]  621 	mov	dptr,#0x0002
      000AB2 12 04 3A         [24]  622 	lcall	_send_1
      000AB5 D0 07            [24]  623 	pop	ar7
      000AB7                        624 00121$:
                                    625 ;	.\IR.c:103: if(ir & SN_IR_DISCON){
      000AB7 E5 2D            [12]  626 	mov	a,_SIR_poll_ir_10000_27
      000AB9 30 E1 34         [24]  627 	jnb	acc.1,00123$
                                    628 ;	.\IR.c:104: send_1(0x0001, cntl_byte, 0x08);
      000ABC 8F 05            [24]  629 	mov	ar5,r7
      000ABE 7E 00            [12]  630 	mov	r6,#0x00
      000AC0 8D 0D            [24]  631 	mov	_send_1_PARM_2,r5
      000AC2 8E 0E            [24]  632 	mov	(_send_1_PARM_2 + 1),r6
      000AC4 75 0F 08         [24]  633 	mov	_send_1_PARM_3,#0x08
      000AC7 8E 10            [24]  634 	mov	(_send_1_PARM_3 + 1),r6
      000AC9 90 00 01         [24]  635 	mov	dptr,#0x0001
      000ACC C0 07            [24]  636 	push	ar7
      000ACE C0 06            [24]  637 	push	ar6
      000AD0 C0 05            [24]  638 	push	ar5
      000AD2 12 04 3A         [24]  639 	lcall	_send_1
      000AD5 D0 05            [24]  640 	pop	ar5
      000AD7 D0 06            [24]  641 	pop	ar6
                                    642 ;	.\IR.c:105: send_1(0x0002, cntl_byte, (ir & SN_IR_DISCON));
      000AD9 AB 2D            [24]  643 	mov	r3,_SIR_poll_ir_10000_27
      000ADB 7C 00            [12]  644 	mov	r4,#0x00
      000ADD 74 02            [12]  645 	mov	a,#0x02
      000ADF 5B               [12]  646 	anl	a,r3
      000AE0 F5 0F            [12]  647 	mov	_send_1_PARM_3,a
      000AE2 8C 10            [24]  648 	mov	(_send_1_PARM_3 + 1),r4
      000AE4 8D 0D            [24]  649 	mov	_send_1_PARM_2,r5
      000AE6 8E 0E            [24]  650 	mov	(_send_1_PARM_2 + 1),r6
      000AE8 90 00 02         [24]  651 	mov	dptr,#0x0002
      000AEB 12 04 3A         [24]  652 	lcall	_send_1
      000AEE D0 07            [24]  653 	pop	ar7
      000AF0                        654 00123$:
                                    655 ;	.\IR.c:108: if(ir & SN_IR_CON){
      000AF0 E5 2D            [12]  656 	mov	a,_SIR_poll_ir_10000_27
      000AF2 FE               [12]  657 	mov	r6,a
      000AF3 30 E0 13         [24]  658 	jnb	acc.0,00125$
                                    659 ;	.\IR.c:109: send_1(0x0002, cntl_byte, (ir & SN_IR_CON));
      000AF6 8F 0D            [24]  660 	mov	_send_1_PARM_2,r7
      000AF8 E4               [12]  661 	clr	a
      000AF9 F5 0E            [12]  662 	mov	(_send_1_PARM_2 + 1),a
      000AFB FF               [12]  663 	mov	r7,a
      000AFC 74 01            [12]  664 	mov	a,#0x01
      000AFE 5E               [12]  665 	anl	a,r6
      000AFF F5 0F            [12]  666 	mov	_send_1_PARM_3,a
      000B01 8F 10            [24]  667 	mov	(_send_1_PARM_3 + 1),r7
      000B03 90 00 02         [24]  668 	mov	dptr,#0x0002
      000B06 12 04 3A         [24]  669 	lcall	_send_1
      000B09                        670 00125$:
                                    671 ;	.\IR.c:112: P1 = 0x00;
      000B09 75 90 00         [24]  672 	mov	_P1,#0x00
      000B0C                        673 00127$:
                                    674 ;	.\IR.c:114: P1 = 0xFF;
      000B0C 75 90 FF         [24]  675 	mov	_P1,#0xff
                                    676 ;	.\IR.c:115: }
      000B0F 22               [24]  677 	ret
                                    678 ;------------------------------------------------------------
                                    679 ;Allocation info for local variables in function 'get_Sn_IR'
                                    680 ;------------------------------------------------------------
                                    681 ;ir                        Allocated with name '_get_Sn_IR_PARM_2'
                                    682 ;socket                    Allocated to registers r6 r7 
                                    683 ;------------------------------------------------------------
                                    684 ;	.\IR.c:117: void get_Sn_IR(int socket, unsigned char *ir){
                                    685 ;	-----------------------------------------
                                    686 ;	 function get_Sn_IR
                                    687 ;	-----------------------------------------
      000B10                        688 _get_Sn_IR:
      000B10 AE 82            [24]  689 	mov	r6, dpl
      000B12 AF 83            [24]  690 	mov	r7, dph
                                    691 ;	.\IR.c:118: begin();
      000B14 C0 07            [24]  692 	push	ar7
      000B16 C0 06            [24]  693 	push	ar6
      000B18 12 05 AD         [24]  694 	lcall	_begin
                                    695 ;	.\IR.c:119: shift_in(0x00);
      000B1B 75 82 00         [24]  696 	mov	dpl, #0x00
      000B1E 12 07 4D         [24]  697 	lcall	_shift_in
                                    698 ;	.\IR.c:120: shift_in(0x02);
      000B21 75 82 02         [24]  699 	mov	dpl, #0x02
      000B24 12 07 4D         [24]  700 	lcall	_shift_in
      000B27 D0 06            [24]  701 	pop	ar6
      000B29 D0 07            [24]  702 	pop	ar7
                                    703 ;	.\IR.c:121: switch (socket)
      000B2B BE 00 05         [24]  704 	cjne	r6,#0x00,00119$
      000B2E BF 00 02         [24]  705 	cjne	r7,#0x00,00119$
      000B31 80 08            [24]  706 	sjmp	00101$
      000B33                        707 00119$:
                                    708 ;	.\IR.c:123: case 0:
      000B33 BE 01 13         [24]  709 	cjne	r6,#0x01,00104$
      000B36 BF 00 10         [24]  710 	cjne	r7,#0x00,00104$
      000B39 80 08            [24]  711 	sjmp	00102$
      000B3B                        712 00101$:
                                    713 ;	.\IR.c:124: shift_in(0x08);
      000B3B 75 82 08         [24]  714 	mov	dpl, #0x08
      000B3E 12 07 4D         [24]  715 	lcall	_shift_in
                                    716 ;	.\IR.c:125: break;
                                    717 ;	.\IR.c:126: case 1:
      000B41 80 06            [24]  718 	sjmp	00104$
      000B43                        719 00102$:
                                    720 ;	.\IR.c:127: shift_in(0x28);
      000B43 75 82 28         [24]  721 	mov	dpl, #0x28
      000B46 12 07 4D         [24]  722 	lcall	_shift_in
                                    723 ;	.\IR.c:130: }
      000B49                        724 00104$:
                                    725 ;	.\IR.c:131: *ir = shift_out();
      000B49 AD 2F            [24]  726 	mov	r5,_get_Sn_IR_PARM_2
      000B4B AE 30            [24]  727 	mov	r6,(_get_Sn_IR_PARM_2 + 1)
      000B4D AF 31            [24]  728 	mov	r7,(_get_Sn_IR_PARM_2 + 2)
      000B4F C0 07            [24]  729 	push	ar7
      000B51 C0 06            [24]  730 	push	ar6
      000B53 C0 05            [24]  731 	push	ar5
      000B55 12 07 C8         [24]  732 	lcall	_shift_out
      000B58 AC 82            [24]  733 	mov	r4, dpl
      000B5A D0 05            [24]  734 	pop	ar5
      000B5C D0 06            [24]  735 	pop	ar6
      000B5E D0 07            [24]  736 	pop	ar7
      000B60 8D 82            [24]  737 	mov	dpl,r5
      000B62 8E 83            [24]  738 	mov	dph,r6
      000B64 8F F0            [24]  739 	mov	b,r7
      000B66 EC               [12]  740 	mov	a,r4
      000B67 12 18 8F         [24]  741 	lcall	__gptrput
                                    742 ;	.\IR.c:132: end();
                                    743 ;	.\IR.c:133: }
      000B6A 02 05 B0         [24]  744 	ljmp	_end
                                    745 ;------------------------------------------------------------
                                    746 ;Allocation info for local variables in function 'get_SIR'
                                    747 ;------------------------------------------------------------
                                    748 ;socket                    Allocated to registers r5 r6 r7 
                                    749 ;sir_byte                  Allocated with name '_get_SIR_sir_byte_10000_43'
                                    750 ;i                         Allocated to registers r3 
                                    751 ;------------------------------------------------------------
                                    752 ;	.\IR.c:135: void get_SIR(unsigned char *socket){
                                    753 ;	-----------------------------------------
                                    754 ;	 function get_SIR
                                    755 ;	-----------------------------------------
      000B6D                        756 _get_SIR:
      000B6D AD 82            [24]  757 	mov	r5, dpl
      000B6F AE 83            [24]  758 	mov	r6, dph
      000B71 AF F0            [24]  759 	mov	r7, b
                                    760 ;	.\IR.c:137: begin();
      000B73 C0 07            [24]  761 	push	ar7
      000B75 C0 06            [24]  762 	push	ar6
      000B77 C0 05            [24]  763 	push	ar5
      000B79 12 05 AD         [24]  764 	lcall	_begin
                                    765 ;	.\IR.c:138: shift_in(0x00);
      000B7C 75 82 00         [24]  766 	mov	dpl, #0x00
      000B7F 12 07 4D         [24]  767 	lcall	_shift_in
                                    768 ;	.\IR.c:139: shift_in(0x17);
      000B82 75 82 17         [24]  769 	mov	dpl, #0x17
      000B85 12 07 4D         [24]  770 	lcall	_shift_in
                                    771 ;	.\IR.c:140: shift_in(0x00);
      000B88 75 82 00         [24]  772 	mov	dpl, #0x00
      000B8B 12 07 4D         [24]  773 	lcall	_shift_in
                                    774 ;	.\IR.c:141: sir_byte = shift_out();
      000B8E 12 07 C8         [24]  775 	lcall	_shift_out
      000B91 85 82 32         [24]  776 	mov	_get_SIR_sir_byte_10000_43,dpl
      000B94 D0 05            [24]  777 	pop	ar5
      000B96 D0 06            [24]  778 	pop	ar6
      000B98 D0 07            [24]  779 	pop	ar7
                                    780 ;	.\IR.c:143: for(int i = 0; i < 8; i++){
      000B9A 7B 00            [12]  781 	mov	r3,#0x00
      000B9C                        782 00105$:
      000B9C BB 08 00         [24]  783 	cjne	r3,#0x08,00128$
      000B9F                        784 00128$:
      000B9F 50 30            [24]  785 	jnc	00103$
                                    786 ;	.\IR.c:144: if(sir_byte & (1 << i)){
      000BA1 8B F0            [24]  787 	mov	b,r3
      000BA3 05 F0            [12]  788 	inc	b
      000BA5 79 01            [12]  789 	mov	r1,#0x01
      000BA7 7A 00            [12]  790 	mov	r2,#0x00
      000BA9 80 06            [24]  791 	sjmp	00131$
      000BAB                        792 00130$:
      000BAB E9               [12]  793 	mov	a,r1
      000BAC 29               [12]  794 	add	a,r1
      000BAD F9               [12]  795 	mov	r1,a
      000BAE EA               [12]  796 	mov	a,r2
      000BAF 33               [12]  797 	rlc	a
      000BB0 FA               [12]  798 	mov	r2,a
      000BB1                        799 00131$:
      000BB1 D5 F0 F7         [24]  800 	djnz	b,00130$
      000BB4 A8 32            [24]  801 	mov	r0,_get_SIR_sir_byte_10000_43
      000BB6 7C 00            [12]  802 	mov	r4,#0x00
      000BB8 E8               [12]  803 	mov	a,r0
      000BB9 52 01            [12]  804 	anl	ar1,a
      000BBB EC               [12]  805 	mov	a,r4
      000BBC 52 02            [12]  806 	anl	ar2,a
      000BBE E9               [12]  807 	mov	a,r1
      000BBF 4A               [12]  808 	orl	a,r2
      000BC0 60 0C            [24]  809 	jz	00106$
                                    810 ;	.\IR.c:145: *socket = i;
      000BC2 8B 04            [24]  811 	mov	ar4,r3
      000BC4 8D 82            [24]  812 	mov	dpl,r5
      000BC6 8E 83            [24]  813 	mov	dph,r6
      000BC8 8F F0            [24]  814 	mov	b,r7
      000BCA EC               [12]  815 	mov	a,r4
      000BCB 12 18 8F         [24]  816 	lcall	__gptrput
      000BCE                        817 00106$:
                                    818 ;	.\IR.c:143: for(int i = 0; i < 8; i++){
      000BCE 0B               [12]  819 	inc	r3
      000BCF 80 CB            [24]  820 	sjmp	00105$
      000BD1                        821 00103$:
                                    822 ;	.\IR.c:149: end();
                                    823 ;	.\IR.c:150: }
      000BD1 02 05 B0         [24]  824 	ljmp	_end
                                    825 ;------------------------------------------------------------
                                    826 ;Allocation info for local variables in function 'process_buff'
                                    827 ;------------------------------------------------------------
                                    828 ;start_idx                 Allocated to registers r7 
                                    829 ;------------------------------------------------------------
                                    830 ;	.\IR.c:152: unsigned char process_buff(unsigned char start_idx){
                                    831 ;	-----------------------------------------
                                    832 ;	 function process_buff
                                    833 ;	-----------------------------------------
      000BD4                        834 _process_buff:
                                    835 ;	.\IR.c:153: if(buffer[start_idx + 0] != ':'){
      000BD4 E5 82            [12]  836 	mov	a,dpl
      000BD6 FF               [12]  837 	mov	r7,a
      000BD7 24 3D            [12]  838 	add	a, #_buffer
      000BD9 F9               [12]  839 	mov	r1,a
      000BDA 87 06            [24]  840 	mov	ar6,@r1
      000BDC BE 3A 02         [24]  841 	cjne	r6,#0x3a,00176$
      000BDF 80 04            [24]  842 	sjmp	00102$
      000BE1                        843 00176$:
                                    844 ;	.\IR.c:154: return 1;
      000BE1 75 82 01         [24]  845 	mov	dpl, #0x01
      000BE4 22               [24]  846 	ret
      000BE5                        847 00102$:
                                    848 ;	.\IR.c:156: if(buffer[start_idx + 1] != '<'){
      000BE5 EF               [12]  849 	mov	a,r7
      000BE6 04               [12]  850 	inc	a
      000BE7 24 3D            [12]  851 	add	a, #_buffer
      000BE9 F9               [12]  852 	mov	r1,a
      000BEA 87 06            [24]  853 	mov	ar6,@r1
      000BEC BE 3C 02         [24]  854 	cjne	r6,#0x3c,00177$
      000BEF 80 04            [24]  855 	sjmp	00104$
      000BF1                        856 00177$:
                                    857 ;	.\IR.c:157: return 2;
      000BF1 75 82 02         [24]  858 	mov	dpl, #0x02
      000BF4 22               [24]  859 	ret
      000BF5                        860 00104$:
                                    861 ;	.\IR.c:159: buffer[start_idx + 1] = '[';
      000BF5 EF               [12]  862 	mov	a,r7
      000BF6 04               [12]  863 	inc	a
      000BF7 24 3D            [12]  864 	add	a, #_buffer
      000BF9 F8               [12]  865 	mov	r0,a
      000BFA 76 5B            [12]  866 	mov	@r0,#0x5b
                                    867 ;	.\IR.c:161: if(buffer[start_idx + 2] < '0' || buffer[start_idx + 2] > '9'){
      000BFC 74 02            [12]  868 	mov	a,#0x02
      000BFE 2F               [12]  869 	add	a, r7
      000BFF 24 3D            [12]  870 	add	a, #_buffer
      000C01 F9               [12]  871 	mov	r1,a
      000C02 87 06            [24]  872 	mov	ar6,@r1
      000C04 BE 30 00         [24]  873 	cjne	r6,#0x30,00178$
      000C07                        874 00178$:
      000C07 40 0B            [24]  875 	jc	00106$
      000C09 74 02            [12]  876 	mov	a,#0x02
      000C0B 2F               [12]  877 	add	a, r7
      000C0C 24 3D            [12]  878 	add	a, #_buffer
      000C0E F9               [12]  879 	mov	r1,a
      000C0F E7               [12]  880 	mov	a,@r1
      000C10 24 C6            [12]  881 	add	a,#0xff - 0x39
      000C12 50 04            [24]  882 	jnc	00107$
      000C14                        883 00106$:
                                    884 ;	.\IR.c:162: return 3;
      000C14 75 82 03         [24]  885 	mov	dpl, #0x03
      000C17 22               [24]  886 	ret
      000C18                        887 00107$:
                                    888 ;	.\IR.c:165: buffer_idx = start_idx + 3;
      000C18 74 03            [12]  889 	mov	a,#0x03
      000C1A 2F               [12]  890 	add	a, r7
      000C1B F5 5A            [12]  891 	mov	_buffer_idx,a
                                    892 ;	.\IR.c:166: while(buffer[buffer_idx] != '>' && buffer_idx < buffer_size){
      000C1D                        893 00114$:
      000C1D E5 5A            [12]  894 	mov	a,_buffer_idx
      000C1F 24 3D            [12]  895 	add	a, #_buffer
      000C21 F9               [12]  896 	mov	r1,a
      000C22 87 07            [24]  897 	mov	ar7,@r1
      000C24 BF 3E 02         [24]  898 	cjne	r7,#0x3e,00181$
      000C27 80 1F            [24]  899 	sjmp	00116$
      000C29                        900 00181$:
      000C29 C3               [12]  901 	clr	c
      000C2A E5 5A            [12]  902 	mov	a,_buffer_idx
      000C2C 95 5B            [12]  903 	subb	a,_buffer_size
      000C2E 50 18            [24]  904 	jnc	00116$
                                    905 ;	.\IR.c:168: if(buffer[buffer_idx] >= 'a' && buffer[buffer_idx] <= 'z'){
      000C30 BF 61 00         [24]  906 	cjne	r7,#0x61,00183$
      000C33                        907 00183$:
      000C33 40 0B            [24]  908 	jc	00110$
      000C35 EF               [12]  909 	mov	a,r7
      000C36 24 85            [12]  910 	add	a,#0xff - 0x7a
      000C38 40 06            [24]  911 	jc	00110$
                                    912 ;	.\IR.c:169: buffer[buffer_idx] -= 32;
      000C3A EF               [12]  913 	mov	a,r7
      000C3B 24 E0            [12]  914 	add	a,#0xe0
      000C3D F7               [12]  915 	mov	@r1,a
      000C3E 80 04            [24]  916 	sjmp	00111$
      000C40                        917 00110$:
                                    918 ;	.\IR.c:171: return 4;
      000C40 75 82 04         [24]  919 	mov	dpl, #0x04
      000C43 22               [24]  920 	ret
      000C44                        921 00111$:
                                    922 ;	.\IR.c:173: buffer_idx++;
      000C44 05 5A            [12]  923 	inc	_buffer_idx
      000C46 80 D5            [24]  924 	sjmp	00114$
      000C48                        925 00116$:
                                    926 ;	.\IR.c:175: if(buffer_idx < buffer_size){
      000C48 C3               [12]  927 	clr	c
      000C49 E5 5A            [12]  928 	mov	a,_buffer_idx
      000C4B 95 5B            [12]  929 	subb	a,_buffer_size
      000C4D 50 09            [24]  930 	jnc	00118$
                                    931 ;	.\IR.c:176: buffer[buffer_idx] = ']';
      000C4F E5 5A            [12]  932 	mov	a,_buffer_idx
      000C51 24 3D            [12]  933 	add	a, #_buffer
      000C53 F8               [12]  934 	mov	r0,a
      000C54 76 5D            [12]  935 	mov	@r0,#0x5d
      000C56 80 04            [24]  936 	sjmp	00119$
      000C58                        937 00118$:
                                    938 ;	.\IR.c:178: return 5;
      000C58 75 82 05         [24]  939 	mov	dpl, #0x05
      000C5B 22               [24]  940 	ret
      000C5C                        941 00119$:
                                    942 ;	.\IR.c:181: return 0;
      000C5C 75 82 00         [24]  943 	mov	dpl, #0x00
                                    944 ;	.\IR.c:182: }
      000C5F 22               [24]  945 	ret
                                    946 	.area CSEG    (CODE)
                                    947 	.area CONST   (CODE)
                                    948 	.area CONST   (CODE)
      001B05                        949 ___str_0:
      001B05 4E 6F 20 3A 20 46 6F   950 	.ascii "No : Found"
             75 6E 64
      001B0F 00                     951 	.db 0x00
                                    952 	.area CSEG    (CODE)
                                    953 	.area CONST   (CODE)
      001B10                        954 ___str_1:
      001B10 49 6E 63 6F 72 72 65   955 	.ascii "Incorrect format: "
             63 74 20 66 6F 72 6D
             61 74 3A 20
      001B22 22                     956 	.db 0x22
      001B23 3A                     957 	.ascii ":"
      001B24 22                     958 	.db 0x22
      001B25 00                     959 	.db 0x00
                                    960 	.area CSEG    (CODE)
                                    961 	.area CONST   (CODE)
      001B26                        962 ___str_2:
      001B26 4E 6F 20 3C 20 66 6F   963 	.ascii "No < found"
             75 6E 64
      001B30 00                     964 	.db 0x00
                                    965 	.area CSEG    (CODE)
                                    966 	.area CONST   (CODE)
      001B31                        967 ___str_3:
      001B31 49 6E 63 6F 72 72 65   968 	.ascii "Incorrect format: "
             63 74 20 66 6F 72 6D
             61 74 3A 20
      001B43 22                     969 	.db 0x22
      001B44 3C                     970 	.ascii "<"
      001B45 22                     971 	.db 0x22
      001B46 00                     972 	.db 0x00
                                    973 	.area CSEG    (CODE)
                                    974 	.area CONST   (CODE)
      001B47                        975 ___str_4:
      001B47 4E 6F 20 52 54 55 20   976 	.ascii "No RTU Number found"
             4E 75 6D 62 65 72 20
             66 6F 75 6E 64
      001B5A 00                     977 	.db 0x00
                                    978 	.area CSEG    (CODE)
                                    979 	.area CONST   (CODE)
      001B5B                        980 ___str_5:
      001B5B 57 72 6F 6E 67 20 52   981 	.ascii "Wrong RTU number"
             54 55 20 6E 75 6D 62
             65 72
      001B6B 00                     982 	.db 0x00
                                    983 	.area CSEG    (CODE)
                                    984 	.area CONST   (CODE)
      001B6C                        985 ___str_6:
      001B6C 45 72 72 6F 72 20 69   986 	.ascii "Error in message format"
             6E 20 6D 65 73 73 61
             67 65 20 66 6F 72 6D
             61 74
      001B83 00                     987 	.db 0x00
                                    988 	.area CSEG    (CODE)
                                    989 	.area CONST   (CODE)
      001B84                        990 ___str_7:
      001B84 4E 6F 20 3E 20 66 6F   991 	.ascii "No > found"
             75 6E 64
      001B8E 00                     992 	.db 0x00
                                    993 	.area CSEG    (CODE)
                                    994 	.area CONST   (CODE)
      001B8F                        995 ___str_8:
      001B8F 49 6E 63 6F 72 72 65   996 	.ascii "Incorrect format: "
             63 74 20 66 6F 72 6D
             61 74 3A 20
      001BA1 22                     997 	.db 0x22
      001BA2 3E                     998 	.ascii ">"
      001BA3 22                     999 	.db 0x22
      001BA4 00                    1000 	.db 0x00
                                   1001 	.area CSEG    (CODE)
                                   1002 	.area CONST   (CODE)
      001BA5                       1003 ___str_9:
      001BA5 0D                    1004 	.db 0x0d
      001BA6 0A                    1005 	.db 0x0a
      001BA7 00                    1006 	.db 0x00
                                   1007 	.area CSEG    (CODE)
                                   1008 	.area XINIT   (CODE)
                                   1009 	.area CABS    (ABS,CODE)
