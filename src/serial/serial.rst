                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.4.0 #14620 (MINGW32)
                                      4 ;--------------------------------------------------------
                                      5 	.module serial
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _CY
                                     12 	.globl _AC
                                     13 	.globl _F0
                                     14 	.globl _RS1
                                     15 	.globl _RS0
                                     16 	.globl _OV
                                     17 	.globl _F1
                                     18 	.globl _P
                                     19 	.globl _PS
                                     20 	.globl _PT1
                                     21 	.globl _PX1
                                     22 	.globl _PT0
                                     23 	.globl _PX0
                                     24 	.globl _RD
                                     25 	.globl _WR
                                     26 	.globl _T1
                                     27 	.globl _T0
                                     28 	.globl _INT1
                                     29 	.globl _INT0
                                     30 	.globl _TXD
                                     31 	.globl _RXD
                                     32 	.globl _P3_7
                                     33 	.globl _P3_6
                                     34 	.globl _P3_5
                                     35 	.globl _P3_4
                                     36 	.globl _P3_3
                                     37 	.globl _P3_2
                                     38 	.globl _P3_1
                                     39 	.globl _P3_0
                                     40 	.globl _EA
                                     41 	.globl _ES
                                     42 	.globl _ET1
                                     43 	.globl _EX1
                                     44 	.globl _ET0
                                     45 	.globl _EX0
                                     46 	.globl _P2_7
                                     47 	.globl _P2_6
                                     48 	.globl _P2_5
                                     49 	.globl _P2_4
                                     50 	.globl _P2_3
                                     51 	.globl _P2_2
                                     52 	.globl _P2_1
                                     53 	.globl _P2_0
                                     54 	.globl _SM0
                                     55 	.globl _SM1
                                     56 	.globl _SM2
                                     57 	.globl _REN
                                     58 	.globl _TB8
                                     59 	.globl _RB8
                                     60 	.globl _TI
                                     61 	.globl _RI
                                     62 	.globl _P1_7
                                     63 	.globl _P1_6
                                     64 	.globl _P1_5
                                     65 	.globl _P1_4
                                     66 	.globl _P1_3
                                     67 	.globl _P1_2
                                     68 	.globl _P1_1
                                     69 	.globl _P1_0
                                     70 	.globl _TF1
                                     71 	.globl _TR1
                                     72 	.globl _TF0
                                     73 	.globl _TR0
                                     74 	.globl _IE1
                                     75 	.globl _IT1
                                     76 	.globl _IE0
                                     77 	.globl _IT0
                                     78 	.globl _P0_7
                                     79 	.globl _P0_6
                                     80 	.globl _P0_5
                                     81 	.globl _P0_4
                                     82 	.globl _P0_3
                                     83 	.globl _P0_2
                                     84 	.globl _P0_1
                                     85 	.globl _P0_0
                                     86 	.globl _B
                                     87 	.globl _ACC
                                     88 	.globl _PSW
                                     89 	.globl _IP
                                     90 	.globl _P3
                                     91 	.globl _IE
                                     92 	.globl _P2
                                     93 	.globl _SBUF
                                     94 	.globl _SCON
                                     95 	.globl _P1
                                     96 	.globl _TH1
                                     97 	.globl _TH0
                                     98 	.globl _TL1
                                     99 	.globl _TL0
                                    100 	.globl _TMOD
                                    101 	.globl _TCON
                                    102 	.globl _PCON
                                    103 	.globl _DPH
                                    104 	.globl _DPL
                                    105 	.globl _SP
                                    106 	.globl _P0
                                    107 	.globl _transmit_data
                                    108 	.globl _transmit_int
                                    109 	.globl _receive_data
                                    110 	.globl _transmit_string
                                    111 ;--------------------------------------------------------
                                    112 ; special function registers
                                    113 ;--------------------------------------------------------
                                    114 	.area RSEG    (ABS,DATA)
      000000                        115 	.org 0x0000
                           000080   116 _P0	=	0x0080
                           000081   117 _SP	=	0x0081
                           000082   118 _DPL	=	0x0082
                           000083   119 _DPH	=	0x0083
                           000087   120 _PCON	=	0x0087
                           000088   121 _TCON	=	0x0088
                           000089   122 _TMOD	=	0x0089
                           00008A   123 _TL0	=	0x008a
                           00008B   124 _TL1	=	0x008b
                           00008C   125 _TH0	=	0x008c
                           00008D   126 _TH1	=	0x008d
                           000090   127 _P1	=	0x0090
                           000098   128 _SCON	=	0x0098
                           000099   129 _SBUF	=	0x0099
                           0000A0   130 _P2	=	0x00a0
                           0000A8   131 _IE	=	0x00a8
                           0000B0   132 _P3	=	0x00b0
                           0000B8   133 _IP	=	0x00b8
                           0000D0   134 _PSW	=	0x00d0
                           0000E0   135 _ACC	=	0x00e0
                           0000F0   136 _B	=	0x00f0
                                    137 ;--------------------------------------------------------
                                    138 ; special function bits
                                    139 ;--------------------------------------------------------
                                    140 	.area RSEG    (ABS,DATA)
      000000                        141 	.org 0x0000
                           000080   142 _P0_0	=	0x0080
                           000081   143 _P0_1	=	0x0081
                           000082   144 _P0_2	=	0x0082
                           000083   145 _P0_3	=	0x0083
                           000084   146 _P0_4	=	0x0084
                           000085   147 _P0_5	=	0x0085
                           000086   148 _P0_6	=	0x0086
                           000087   149 _P0_7	=	0x0087
                           000088   150 _IT0	=	0x0088
                           000089   151 _IE0	=	0x0089
                           00008A   152 _IT1	=	0x008a
                           00008B   153 _IE1	=	0x008b
                           00008C   154 _TR0	=	0x008c
                           00008D   155 _TF0	=	0x008d
                           00008E   156 _TR1	=	0x008e
                           00008F   157 _TF1	=	0x008f
                           000090   158 _P1_0	=	0x0090
                           000091   159 _P1_1	=	0x0091
                           000092   160 _P1_2	=	0x0092
                           000093   161 _P1_3	=	0x0093
                           000094   162 _P1_4	=	0x0094
                           000095   163 _P1_5	=	0x0095
                           000096   164 _P1_6	=	0x0096
                           000097   165 _P1_7	=	0x0097
                           000098   166 _RI	=	0x0098
                           000099   167 _TI	=	0x0099
                           00009A   168 _RB8	=	0x009a
                           00009B   169 _TB8	=	0x009b
                           00009C   170 _REN	=	0x009c
                           00009D   171 _SM2	=	0x009d
                           00009E   172 _SM1	=	0x009e
                           00009F   173 _SM0	=	0x009f
                           0000A0   174 _P2_0	=	0x00a0
                           0000A1   175 _P2_1	=	0x00a1
                           0000A2   176 _P2_2	=	0x00a2
                           0000A3   177 _P2_3	=	0x00a3
                           0000A4   178 _P2_4	=	0x00a4
                           0000A5   179 _P2_5	=	0x00a5
                           0000A6   180 _P2_6	=	0x00a6
                           0000A7   181 _P2_7	=	0x00a7
                           0000A8   182 _EX0	=	0x00a8
                           0000A9   183 _ET0	=	0x00a9
                           0000AA   184 _EX1	=	0x00aa
                           0000AB   185 _ET1	=	0x00ab
                           0000AC   186 _ES	=	0x00ac
                           0000AF   187 _EA	=	0x00af
                           0000B0   188 _P3_0	=	0x00b0
                           0000B1   189 _P3_1	=	0x00b1
                           0000B2   190 _P3_2	=	0x00b2
                           0000B3   191 _P3_3	=	0x00b3
                           0000B4   192 _P3_4	=	0x00b4
                           0000B5   193 _P3_5	=	0x00b5
                           0000B6   194 _P3_6	=	0x00b6
                           0000B7   195 _P3_7	=	0x00b7
                           0000B0   196 _RXD	=	0x00b0
                           0000B1   197 _TXD	=	0x00b1
                           0000B2   198 _INT0	=	0x00b2
                           0000B3   199 _INT1	=	0x00b3
                           0000B4   200 _T0	=	0x00b4
                           0000B5   201 _T1	=	0x00b5
                           0000B6   202 _WR	=	0x00b6
                           0000B7   203 _RD	=	0x00b7
                           0000B8   204 _PX0	=	0x00b8
                           0000B9   205 _PT0	=	0x00b9
                           0000BA   206 _PX1	=	0x00ba
                           0000BB   207 _PT1	=	0x00bb
                           0000BC   208 _PS	=	0x00bc
                           0000D0   209 _P	=	0x00d0
                           0000D1   210 _F1	=	0x00d1
                           0000D2   211 _OV	=	0x00d2
                           0000D3   212 _RS0	=	0x00d3
                           0000D4   213 _RS1	=	0x00d4
                           0000D5   214 _F0	=	0x00d5
                           0000D6   215 _AC	=	0x00d6
                           0000D7   216 _CY	=	0x00d7
                                    217 ;--------------------------------------------------------
                                    218 ; overlayable register banks
                                    219 ;--------------------------------------------------------
                                    220 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        221 	.ds 8
                                    222 ;--------------------------------------------------------
                                    223 ; internal ram data
                                    224 ;--------------------------------------------------------
                                    225 	.area DSEG    (DATA)
                                    226 ;--------------------------------------------------------
                                    227 ; overlayable items in internal ram
                                    228 ;--------------------------------------------------------
                                    229 	.area	OSEG    (OVR,DATA)
                                    230 	.area	OSEG    (OVR,DATA)
                                    231 	.area	OSEG    (OVR,DATA)
                                    232 ;--------------------------------------------------------
                                    233 ; indirectly addressable internal ram data
                                    234 ;--------------------------------------------------------
                                    235 	.area ISEG    (DATA)
                                    236 ;--------------------------------------------------------
                                    237 ; absolute internal ram data
                                    238 ;--------------------------------------------------------
                                    239 	.area IABS    (ABS,DATA)
                                    240 	.area IABS    (ABS,DATA)
                                    241 ;--------------------------------------------------------
                                    242 ; bit data
                                    243 ;--------------------------------------------------------
                                    244 	.area BSEG    (BIT)
                                    245 ;--------------------------------------------------------
                                    246 ; paged external ram data
                                    247 ;--------------------------------------------------------
                                    248 	.area PSEG    (PAG,XDATA)
                                    249 ;--------------------------------------------------------
                                    250 ; uninitialized external ram data
                                    251 ;--------------------------------------------------------
                                    252 	.area XSEG    (XDATA)
                                    253 ;--------------------------------------------------------
                                    254 ; absolute external ram data
                                    255 ;--------------------------------------------------------
                                    256 	.area XABS    (ABS,XDATA)
                                    257 ;--------------------------------------------------------
                                    258 ; initialized external ram data
                                    259 ;--------------------------------------------------------
                                    260 	.area XISEG   (XDATA)
                                    261 	.area HOME    (CODE)
                                    262 	.area GSINIT0 (CODE)
                                    263 	.area GSINIT1 (CODE)
                                    264 	.area GSINIT2 (CODE)
                                    265 	.area GSINIT3 (CODE)
                                    266 	.area GSINIT4 (CODE)
                                    267 	.area GSINIT5 (CODE)
                                    268 	.area GSINIT  (CODE)
                                    269 	.area GSFINAL (CODE)
                                    270 	.area CSEG    (CODE)
                                    271 ;--------------------------------------------------------
                                    272 ; global & static initialisations
                                    273 ;--------------------------------------------------------
                                    274 	.area HOME    (CODE)
                                    275 	.area GSINIT  (CODE)
                                    276 	.area GSFINAL (CODE)
                                    277 	.area GSINIT  (CODE)
                                    278 ;--------------------------------------------------------
                                    279 ; Home
                                    280 ;--------------------------------------------------------
                                    281 	.area HOME    (CODE)
                                    282 	.area HOME    (CODE)
                                    283 ;--------------------------------------------------------
                                    284 ; code
                                    285 ;--------------------------------------------------------
                                    286 	.area CSEG    (CODE)
                                    287 ;------------------------------------------------------------
                                    288 ;Allocation info for local variables in function 'transmit_data'
                                    289 ;------------------------------------------------------------
                                    290 ;tx_data                   Allocated to registers r5 r6 r7 
                                    291 ;------------------------------------------------------------
                                    292 ;	.\serial.c:5: void transmit_data(unsigned char *tx_data){
                                    293 ;	-----------------------------------------
                                    294 ;	 function transmit_data
                                    295 ;	-----------------------------------------
      000838                        296 _transmit_data:
                           000007   297 	ar7 = 0x07
                           000006   298 	ar6 = 0x06
                           000005   299 	ar5 = 0x05
                           000004   300 	ar4 = 0x04
                           000003   301 	ar3 = 0x03
                           000002   302 	ar2 = 0x02
                           000001   303 	ar1 = 0x01
                           000000   304 	ar0 = 0x00
                                    305 ;	.\serial.c:6: SBUF = *tx_data;
      000838 12 19 3D         [24]  306 	lcall	__gptrget
      00083B F5 99            [12]  307 	mov	_SBUF,a
                                    308 ;	.\serial.c:8: while(TI == 0);
      00083D                        309 00101$:
                                    310 ;	.\serial.c:9: TI = 0;
                                    311 ;	assignBit
      00083D 10 99 02         [24]  312 	jbc	_TI,00118$
      000840 80 FB            [24]  313 	sjmp	00101$
      000842                        314 00118$:
                                    315 ;	.\serial.c:10: }
      000842 22               [24]  316 	ret
                                    317 ;------------------------------------------------------------
                                    318 ;Allocation info for local variables in function 'transmit_int'
                                    319 ;------------------------------------------------------------
                                    320 ;num                       Allocated to registers 
                                    321 ;------------------------------------------------------------
                                    322 ;	.\serial.c:12: void transmit_int(unsigned char num){
                                    323 ;	-----------------------------------------
                                    324 ;	 function transmit_int
                                    325 ;	-----------------------------------------
      000843                        326 _transmit_int:
      000843 85 82 99         [24]  327 	mov	_SBUF,dpl
                                    328 ;	.\serial.c:14: while(TI == 0);
      000846                        329 00101$:
                                    330 ;	.\serial.c:15: TI = 0;
                                    331 ;	assignBit
      000846 10 99 02         [24]  332 	jbc	_TI,00118$
      000849 80 FB            [24]  333 	sjmp	00101$
      00084B                        334 00118$:
                                    335 ;	.\serial.c:16: }
      00084B 22               [24]  336 	ret
                                    337 ;------------------------------------------------------------
                                    338 ;Allocation info for local variables in function 'receive_data'
                                    339 ;------------------------------------------------------------
                                    340 ;flag                      Allocated to registers r5 r6 r7 
                                    341 ;------------------------------------------------------------
                                    342 ;	.\serial.c:18: void receive_data(unsigned char *flag){
                                    343 ;	-----------------------------------------
                                    344 ;	 function receive_data
                                    345 ;	-----------------------------------------
      00084C                        346 _receive_data:
      00084C AD 82            [24]  347 	mov	r5, dpl
      00084E AE 83            [24]  348 	mov	r6, dph
      000850 AF F0            [24]  349 	mov	r7, b
                                    350 ;	.\serial.c:19: if(RI){
      000852 30 98 14         [24]  351 	jnb	_RI,00102$
                                    352 ;	.\serial.c:20: P1 = 0x00;
      000855 75 90 00         [24]  353 	mov	_P1,#0x00
                                    354 ;	.\serial.c:21: *flag = SBUF;
      000858 8D 82            [24]  355 	mov	dpl,r5
      00085A 8E 83            [24]  356 	mov	dph,r6
      00085C 8F F0            [24]  357 	mov	b,r7
      00085E E5 99            [12]  358 	mov	a,_SBUF
      000860 12 18 8F         [24]  359 	lcall	__gptrput
                                    360 ;	.\serial.c:22: RI = 0;
                                    361 ;	assignBit
      000863 C2 98            [12]  362 	clr	_RI
                                    363 ;	.\serial.c:23: SBUF = 0;
      000865 75 99 00         [24]  364 	mov	_SBUF,#0x00
      000868 22               [24]  365 	ret
      000869                        366 00102$:
                                    367 ;	.\serial.c:26: P1 = 0xFF;
      000869 75 90 FF         [24]  368 	mov	_P1,#0xff
                                    369 ;	.\serial.c:28: }
      00086C 22               [24]  370 	ret
                                    371 ;------------------------------------------------------------
                                    372 ;Allocation info for local variables in function 'transmit_string'
                                    373 ;------------------------------------------------------------
                                    374 ;str                       Allocated to registers r5 r6 r7 
                                    375 ;i                         Allocated to registers r4 
                                    376 ;------------------------------------------------------------
                                    377 ;	.\serial.c:30: void transmit_string(char *str){
                                    378 ;	-----------------------------------------
                                    379 ;	 function transmit_string
                                    380 ;	-----------------------------------------
      00086D                        381 _transmit_string:
      00086D AD 82            [24]  382 	mov	r5, dpl
      00086F AE 83            [24]  383 	mov	r6, dph
      000871 AF F0            [24]  384 	mov	r7, b
                                    385 ;	.\serial.c:32: while(str[i] != '\0'){
      000873 7C 00            [12]  386 	mov	r4,#0x00
      000875                        387 00101$:
      000875 EC               [12]  388 	mov	a,r4
      000876 2D               [12]  389 	add	a, r5
      000877 F9               [12]  390 	mov	r1,a
      000878 E4               [12]  391 	clr	a
      000879 3E               [12]  392 	addc	a, r6
      00087A FA               [12]  393 	mov	r2,a
      00087B 8F 03            [24]  394 	mov	ar3,r7
      00087D 89 82            [24]  395 	mov	dpl,r1
      00087F 8A 83            [24]  396 	mov	dph,r2
      000881 8B F0            [24]  397 	mov	b,r3
      000883 12 19 3D         [24]  398 	lcall	__gptrget
      000886 60 1C            [24]  399 	jz	00104$
                                    400 ;	.\serial.c:33: transmit_data(&str[i]);
      000888 89 82            [24]  401 	mov	dpl, r1
      00088A 8A 83            [24]  402 	mov	dph, r2
      00088C 8B F0            [24]  403 	mov	b, r3
      00088E C0 07            [24]  404 	push	ar7
      000890 C0 06            [24]  405 	push	ar6
      000892 C0 05            [24]  406 	push	ar5
      000894 C0 04            [24]  407 	push	ar4
      000896 12 08 38         [24]  408 	lcall	_transmit_data
      000899 D0 04            [24]  409 	pop	ar4
      00089B D0 05            [24]  410 	pop	ar5
      00089D D0 06            [24]  411 	pop	ar6
      00089F D0 07            [24]  412 	pop	ar7
                                    413 ;	.\serial.c:34: i++;
      0008A1 0C               [12]  414 	inc	r4
      0008A2 80 D1            [24]  415 	sjmp	00101$
      0008A4                        416 00104$:
                                    417 ;	.\serial.c:36: }
      0008A4 22               [24]  418 	ret
                                    419 	.area CSEG    (CODE)
                                    420 	.area CONST   (CODE)
                                    421 	.area XINIT   (CODE)
                                    422 	.area CABS    (ABS,CODE)
