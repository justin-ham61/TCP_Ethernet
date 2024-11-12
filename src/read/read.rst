                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.4.0 #14620 (MINGW32)
                                      4 ;--------------------------------------------------------
                                      5 	.module read
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _get_2
                                     12 	.globl _send_2
                                     13 	.globl _send_1
                                     14 	.globl _end
                                     15 	.globl _begin
                                     16 	.globl _asm_shift_in_2
                                     17 	.globl _asm_shift_out_2
                                     18 	.globl _shift_out
                                     19 	.globl _CY
                                     20 	.globl _AC
                                     21 	.globl _F0
                                     22 	.globl _RS1
                                     23 	.globl _RS0
                                     24 	.globl _OV
                                     25 	.globl _F1
                                     26 	.globl _P
                                     27 	.globl _PS
                                     28 	.globl _PT1
                                     29 	.globl _PX1
                                     30 	.globl _PT0
                                     31 	.globl _PX0
                                     32 	.globl _RD
                                     33 	.globl _WR
                                     34 	.globl _T1
                                     35 	.globl _T0
                                     36 	.globl _INT1
                                     37 	.globl _INT0
                                     38 	.globl _TXD
                                     39 	.globl _RXD
                                     40 	.globl _P3_7
                                     41 	.globl _P3_6
                                     42 	.globl _P3_5
                                     43 	.globl _P3_4
                                     44 	.globl _P3_3
                                     45 	.globl _P3_2
                                     46 	.globl _P3_1
                                     47 	.globl _P3_0
                                     48 	.globl _EA
                                     49 	.globl _ES
                                     50 	.globl _ET1
                                     51 	.globl _EX1
                                     52 	.globl _ET0
                                     53 	.globl _EX0
                                     54 	.globl _P2_7
                                     55 	.globl _P2_6
                                     56 	.globl _P2_5
                                     57 	.globl _P2_4
                                     58 	.globl _P2_3
                                     59 	.globl _P2_2
                                     60 	.globl _P2_1
                                     61 	.globl _P2_0
                                     62 	.globl _SM0
                                     63 	.globl _SM1
                                     64 	.globl _SM2
                                     65 	.globl _REN
                                     66 	.globl _TB8
                                     67 	.globl _RB8
                                     68 	.globl _TI
                                     69 	.globl _RI
                                     70 	.globl _P1_7
                                     71 	.globl _P1_6
                                     72 	.globl _P1_5
                                     73 	.globl _P1_4
                                     74 	.globl _P1_3
                                     75 	.globl _P1_2
                                     76 	.globl _P1_1
                                     77 	.globl _P1_0
                                     78 	.globl _TF1
                                     79 	.globl _TR1
                                     80 	.globl _TF0
                                     81 	.globl _TR0
                                     82 	.globl _IE1
                                     83 	.globl _IT1
                                     84 	.globl _IE0
                                     85 	.globl _IT0
                                     86 	.globl _P0_7
                                     87 	.globl _P0_6
                                     88 	.globl _P0_5
                                     89 	.globl _P0_4
                                     90 	.globl _P0_3
                                     91 	.globl _P0_2
                                     92 	.globl _P0_1
                                     93 	.globl _P0_0
                                     94 	.globl _B
                                     95 	.globl _ACC
                                     96 	.globl _PSW
                                     97 	.globl _IP
                                     98 	.globl _P3
                                     99 	.globl _IE
                                    100 	.globl _P2
                                    101 	.globl _SBUF
                                    102 	.globl _SCON
                                    103 	.globl _P1
                                    104 	.globl _TH1
                                    105 	.globl _TH0
                                    106 	.globl _TL1
                                    107 	.globl _TL0
                                    108 	.globl _TMOD
                                    109 	.globl _TCON
                                    110 	.globl _PCON
                                    111 	.globl _DPH
                                    112 	.globl _DPL
                                    113 	.globl _SP
                                    114 	.globl _P0
                                    115 	.globl _read_RX_buffer
                                    116 ;--------------------------------------------------------
                                    117 ; special function registers
                                    118 ;--------------------------------------------------------
                                    119 	.area RSEG    (ABS,DATA)
      000000                        120 	.org 0x0000
                           000080   121 _P0	=	0x0080
                           000081   122 _SP	=	0x0081
                           000082   123 _DPL	=	0x0082
                           000083   124 _DPH	=	0x0083
                           000087   125 _PCON	=	0x0087
                           000088   126 _TCON	=	0x0088
                           000089   127 _TMOD	=	0x0089
                           00008A   128 _TL0	=	0x008a
                           00008B   129 _TL1	=	0x008b
                           00008C   130 _TH0	=	0x008c
                           00008D   131 _TH1	=	0x008d
                           000090   132 _P1	=	0x0090
                           000098   133 _SCON	=	0x0098
                           000099   134 _SBUF	=	0x0099
                           0000A0   135 _P2	=	0x00a0
                           0000A8   136 _IE	=	0x00a8
                           0000B0   137 _P3	=	0x00b0
                           0000B8   138 _IP	=	0x00b8
                           0000D0   139 _PSW	=	0x00d0
                           0000E0   140 _ACC	=	0x00e0
                           0000F0   141 _B	=	0x00f0
                                    142 ;--------------------------------------------------------
                                    143 ; special function bits
                                    144 ;--------------------------------------------------------
                                    145 	.area RSEG    (ABS,DATA)
      000000                        146 	.org 0x0000
                           000080   147 _P0_0	=	0x0080
                           000081   148 _P0_1	=	0x0081
                           000082   149 _P0_2	=	0x0082
                           000083   150 _P0_3	=	0x0083
                           000084   151 _P0_4	=	0x0084
                           000085   152 _P0_5	=	0x0085
                           000086   153 _P0_6	=	0x0086
                           000087   154 _P0_7	=	0x0087
                           000088   155 _IT0	=	0x0088
                           000089   156 _IE0	=	0x0089
                           00008A   157 _IT1	=	0x008a
                           00008B   158 _IE1	=	0x008b
                           00008C   159 _TR0	=	0x008c
                           00008D   160 _TF0	=	0x008d
                           00008E   161 _TR1	=	0x008e
                           00008F   162 _TF1	=	0x008f
                           000090   163 _P1_0	=	0x0090
                           000091   164 _P1_1	=	0x0091
                           000092   165 _P1_2	=	0x0092
                           000093   166 _P1_3	=	0x0093
                           000094   167 _P1_4	=	0x0094
                           000095   168 _P1_5	=	0x0095
                           000096   169 _P1_6	=	0x0096
                           000097   170 _P1_7	=	0x0097
                           000098   171 _RI	=	0x0098
                           000099   172 _TI	=	0x0099
                           00009A   173 _RB8	=	0x009a
                           00009B   174 _TB8	=	0x009b
                           00009C   175 _REN	=	0x009c
                           00009D   176 _SM2	=	0x009d
                           00009E   177 _SM1	=	0x009e
                           00009F   178 _SM0	=	0x009f
                           0000A0   179 _P2_0	=	0x00a0
                           0000A1   180 _P2_1	=	0x00a1
                           0000A2   181 _P2_2	=	0x00a2
                           0000A3   182 _P2_3	=	0x00a3
                           0000A4   183 _P2_4	=	0x00a4
                           0000A5   184 _P2_5	=	0x00a5
                           0000A6   185 _P2_6	=	0x00a6
                           0000A7   186 _P2_7	=	0x00a7
                           0000A8   187 _EX0	=	0x00a8
                           0000A9   188 _ET0	=	0x00a9
                           0000AA   189 _EX1	=	0x00aa
                           0000AB   190 _ET1	=	0x00ab
                           0000AC   191 _ES	=	0x00ac
                           0000AF   192 _EA	=	0x00af
                           0000B0   193 _P3_0	=	0x00b0
                           0000B1   194 _P3_1	=	0x00b1
                           0000B2   195 _P3_2	=	0x00b2
                           0000B3   196 _P3_3	=	0x00b3
                           0000B4   197 _P3_4	=	0x00b4
                           0000B5   198 _P3_5	=	0x00b5
                           0000B6   199 _P3_6	=	0x00b6
                           0000B7   200 _P3_7	=	0x00b7
                           0000B0   201 _RXD	=	0x00b0
                           0000B1   202 _TXD	=	0x00b1
                           0000B2   203 _INT0	=	0x00b2
                           0000B3   204 _INT1	=	0x00b3
                           0000B4   205 _T0	=	0x00b4
                           0000B5   206 _T1	=	0x00b5
                           0000B6   207 _WR	=	0x00b6
                           0000B7   208 _RD	=	0x00b7
                           0000B8   209 _PX0	=	0x00b8
                           0000B9   210 _PT0	=	0x00b9
                           0000BA   211 _PX1	=	0x00ba
                           0000BB   212 _PT1	=	0x00bb
                           0000BC   213 _PS	=	0x00bc
                           0000D0   214 _P	=	0x00d0
                           0000D1   215 _F1	=	0x00d1
                           0000D2   216 _OV	=	0x00d2
                           0000D3   217 _RS0	=	0x00d3
                           0000D4   218 _RS1	=	0x00d4
                           0000D5   219 _F0	=	0x00d5
                           0000D6   220 _AC	=	0x00d6
                           0000D7   221 _CY	=	0x00d7
                                    222 ;--------------------------------------------------------
                                    223 ; overlayable register banks
                                    224 ;--------------------------------------------------------
                                    225 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        226 	.ds 8
                                    227 ;--------------------------------------------------------
                                    228 ; internal ram data
                                    229 ;--------------------------------------------------------
                                    230 	.area DSEG    (DATA)
      000033                        231 _read_RX_buffer_socket_10000_21:
      000033                        232 	.ds 3
      000036                        233 _read_RX_buffer_p1_20001_28:
      000036                        234 	.ds 2
      000038                        235 _read_RX_buffer_i_30001_29:
      000038                        236 	.ds 2
                                    237 ;--------------------------------------------------------
                                    238 ; overlayable items in internal ram
                                    239 ;--------------------------------------------------------
                                    240 ;--------------------------------------------------------
                                    241 ; indirectly addressable internal ram data
                                    242 ;--------------------------------------------------------
                                    243 	.area ISEG    (DATA)
                                    244 ;--------------------------------------------------------
                                    245 ; absolute internal ram data
                                    246 ;--------------------------------------------------------
                                    247 	.area IABS    (ABS,DATA)
                                    248 	.area IABS    (ABS,DATA)
                                    249 ;--------------------------------------------------------
                                    250 ; bit data
                                    251 ;--------------------------------------------------------
                                    252 	.area BSEG    (BIT)
                                    253 ;--------------------------------------------------------
                                    254 ; paged external ram data
                                    255 ;--------------------------------------------------------
                                    256 	.area PSEG    (PAG,XDATA)
                                    257 ;--------------------------------------------------------
                                    258 ; uninitialized external ram data
                                    259 ;--------------------------------------------------------
                                    260 	.area XSEG    (XDATA)
                                    261 ;--------------------------------------------------------
                                    262 ; absolute external ram data
                                    263 ;--------------------------------------------------------
                                    264 	.area XABS    (ABS,XDATA)
                                    265 ;--------------------------------------------------------
                                    266 ; initialized external ram data
                                    267 ;--------------------------------------------------------
                                    268 	.area XISEG   (XDATA)
                                    269 	.area HOME    (CODE)
                                    270 	.area GSINIT0 (CODE)
                                    271 	.area GSINIT1 (CODE)
                                    272 	.area GSINIT2 (CODE)
                                    273 	.area GSINIT3 (CODE)
                                    274 	.area GSINIT4 (CODE)
                                    275 	.area GSINIT5 (CODE)
                                    276 	.area GSINIT  (CODE)
                                    277 	.area GSFINAL (CODE)
                                    278 	.area CSEG    (CODE)
                                    279 ;--------------------------------------------------------
                                    280 ; global & static initialisations
                                    281 ;--------------------------------------------------------
                                    282 	.area HOME    (CODE)
                                    283 	.area GSINIT  (CODE)
                                    284 	.area GSFINAL (CODE)
                                    285 	.area GSINIT  (CODE)
                                    286 ;--------------------------------------------------------
                                    287 ; Home
                                    288 ;--------------------------------------------------------
                                    289 	.area HOME    (CODE)
                                    290 	.area HOME    (CODE)
                                    291 ;--------------------------------------------------------
                                    292 ; code
                                    293 ;--------------------------------------------------------
                                    294 	.area CSEG    (CODE)
                                    295 ;------------------------------------------------------------
                                    296 ;Allocation info for local variables in function 'read_RX_buffer'
                                    297 ;------------------------------------------------------------
                                    298 ;socket                    Allocated with name '_read_RX_buffer_socket_10000_21'
                                    299 ;ret                       Allocated to registers r4 
                                    300 ;i                         Allocated to registers r3 
                                    301 ;p1                        Allocated with name '_read_RX_buffer_p1_20001_28'
                                    302 ;i                         Allocated with name '_read_RX_buffer_i_30001_29'
                                    303 ;i                         Allocated to registers r6 r7 
                                    304 ;------------------------------------------------------------
                                    305 ;	.\read.c:8: unsigned char read_RX_buffer(unsigned char *socket){
                                    306 ;	-----------------------------------------
                                    307 ;	 function read_RX_buffer
                                    308 ;	-----------------------------------------
      000C60                        309 _read_RX_buffer:
                           000007   310 	ar7 = 0x07
                           000006   311 	ar6 = 0x06
                           000005   312 	ar5 = 0x05
                           000004   313 	ar4 = 0x04
                           000003   314 	ar3 = 0x03
                           000002   315 	ar2 = 0x02
                           000001   316 	ar1 = 0x01
                           000000   317 	ar0 = 0x00
                                    318 ;	.\read.c:9: unsigned char ret = 0;
                                    319 ;	.\read.c:11: switch (*socket)
      000C60 85 82 33         [24]  320 	mov	_read_RX_buffer_socket_10000_21,dpl
      000C63 85 83 34         [24]  321 	mov	(_read_RX_buffer_socket_10000_21 + 1),dph
      000C66 85 F0 35         [24]  322 	mov	(_read_RX_buffer_socket_10000_21 + 2),b
      000C69 7C 00            [12]  323 	mov	r4,#0x00
      000C6B 12 19 3D         [24]  324 	lcall	__gptrget
      000C6E FB               [12]  325 	mov	r3,a
      000C6F 60 05            [24]  326 	jz	00101$
                                    327 ;	.\read.c:13: case 0:
      000C71 BB 01 54         [24]  328 	cjne	r3,#0x01,00104$
      000C74 80 2A            [24]  329 	sjmp	00102$
      000C76                        330 00101$:
                                    331 ;	.\read.c:14: rw_ptr = get_2(0x0028, 0x08);
      000C76 75 21 08         [24]  332 	mov	_get_2_PARM_2,#0x08
      000C79 75 22 00         [24]  333 	mov	(_get_2_PARM_2 + 1),#0x00
      000C7C 90 00 28         [24]  334 	mov	dptr,#0x0028
      000C7F C0 04            [24]  335 	push	ar4
      000C81 12 04 E2         [24]  336 	lcall	_get_2
      000C84 85 82 62         [24]  337 	mov	_rw_ptr,dpl
      000C87 85 83 63         [24]  338 	mov	(_rw_ptr + 1),dph
                                    339 ;	.\read.c:15: rw_size = get_2(0x0026, 0x08);
      000C8A 75 21 08         [24]  340 	mov	_get_2_PARM_2,#0x08
      000C8D 75 22 00         [24]  341 	mov	(_get_2_PARM_2 + 1),#0x00
      000C90 90 00 26         [24]  342 	mov	dptr,#0x0026
      000C93 12 04 E2         [24]  343 	lcall	_get_2
      000C96 85 82 64         [24]  344 	mov	_rw_size,dpl
      000C99 85 83 65         [24]  345 	mov	(_rw_size + 1),dph
      000C9C D0 04            [24]  346 	pop	ar4
                                    347 ;	.\read.c:16: break;
                                    348 ;	.\read.c:17: case 1:
      000C9E 80 28            [24]  349 	sjmp	00104$
      000CA0                        350 00102$:
                                    351 ;	.\read.c:18: rw_ptr = get_2(0x0028, 0x28);
      000CA0 75 21 28         [24]  352 	mov	_get_2_PARM_2,#0x28
      000CA3 75 22 00         [24]  353 	mov	(_get_2_PARM_2 + 1),#0x00
      000CA6 90 00 28         [24]  354 	mov	dptr,#0x0028
      000CA9 C0 04            [24]  355 	push	ar4
      000CAB 12 04 E2         [24]  356 	lcall	_get_2
      000CAE 85 82 62         [24]  357 	mov	_rw_ptr,dpl
      000CB1 85 83 63         [24]  358 	mov	(_rw_ptr + 1),dph
                                    359 ;	.\read.c:19: rw_size = get_2(0x0026, 0x28);
      000CB4 75 21 28         [24]  360 	mov	_get_2_PARM_2,#0x28
      000CB7 75 22 00         [24]  361 	mov	(_get_2_PARM_2 + 1),#0x00
      000CBA 90 00 26         [24]  362 	mov	dptr,#0x0026
      000CBD 12 04 E2         [24]  363 	lcall	_get_2
      000CC0 85 82 64         [24]  364 	mov	_rw_size,dpl
      000CC3 85 83 65         [24]  365 	mov	(_rw_size + 1),dph
      000CC6 D0 04            [24]  366 	pop	ar4
                                    367 ;	.\read.c:23: }
      000CC8                        368 00104$:
                                    369 ;	.\read.c:25: begin();
      000CC8 C0 04            [24]  370 	push	ar4
      000CCA 12 05 AD         [24]  371 	lcall	_begin
                                    372 ;	.\read.c:26: asm_shift_in_2(GET_HIGH_BITS(rw_ptr));
      000CCD 85 63 82         [24]  373 	mov	dpl,(_rw_ptr + 1)
      000CD0 12 05 B3         [24]  374 	lcall	_asm_shift_in_2
                                    375 ;	.\read.c:27: asm_shift_in_2(GET_LOW_BITS(rw_ptr));
      000CD3 85 62 82         [24]  376 	mov	dpl,_rw_ptr
      000CD6 12 05 B3         [24]  377 	lcall	_asm_shift_in_2
      000CD9 D0 04            [24]  378 	pop	ar4
                                    379 ;	.\read.c:29: switch (*socket)
      000CDB 85 33 82         [24]  380 	mov	dpl,_read_RX_buffer_socket_10000_21
      000CDE 85 34 83         [24]  381 	mov	dph,(_read_RX_buffer_socket_10000_21 + 1)
      000CE1 85 35 F0         [24]  382 	mov	b,(_read_RX_buffer_socket_10000_21 + 2)
      000CE4 12 19 3D         [24]  383 	lcall	__gptrget
      000CE7 FB               [12]  384 	mov	r3,a
      000CE8 60 05            [24]  385 	jz	00105$
                                    386 ;	.\read.c:31: case 0:
      000CEA BB 01 18         [24]  387 	cjne	r3,#0x01,00108$
      000CED 80 0C            [24]  388 	sjmp	00106$
      000CEF                        389 00105$:
                                    390 ;	.\read.c:33: asm_shift_in_2(0x18);
      000CEF 75 82 18         [24]  391 	mov	dpl, #0x18
      000CF2 C0 04            [24]  392 	push	ar4
      000CF4 12 05 B3         [24]  393 	lcall	_asm_shift_in_2
      000CF7 D0 04            [24]  394 	pop	ar4
                                    395 ;	.\read.c:34: break;
                                    396 ;	.\read.c:35: case 1: 
      000CF9 80 0A            [24]  397 	sjmp	00108$
      000CFB                        398 00106$:
                                    399 ;	.\read.c:37: asm_shift_in_2(0x38);
      000CFB 75 82 38         [24]  400 	mov	dpl, #0x38
      000CFE C0 04            [24]  401 	push	ar4
      000D00 12 05 B3         [24]  402 	lcall	_asm_shift_in_2
      000D03 D0 04            [24]  403 	pop	ar4
                                    404 ;	.\read.c:41: }
      000D05                        405 00108$:
                                    406 ;	.\read.c:43: switch (*socket){
      000D05 85 33 82         [24]  407 	mov	dpl,_read_RX_buffer_socket_10000_21
      000D08 85 34 83         [24]  408 	mov	dph,(_read_RX_buffer_socket_10000_21 + 1)
      000D0B 85 35 F0         [24]  409 	mov	b,(_read_RX_buffer_socket_10000_21 + 2)
      000D0E 12 19 3D         [24]  410 	lcall	__gptrget
      000D11 FB               [12]  411 	mov	r3,a
      000D12 60 09            [24]  412 	jz	00142$
      000D14 BB 01 03         [24]  413 	cjne	r3,#0x01,00255$
      000D17 02 0D 98         [24]  414 	ljmp	00114$
      000D1A                        415 00255$:
      000D1A 02 0D E3         [24]  416 	ljmp	00119$
                                    417 ;	.\read.c:45: for(int i = 0; i < 6; i++){
      000D1D                        418 00142$:
      000D1D 7B 00            [12]  419 	mov	r3,#0x00
      000D1F                        420 00125$:
      000D1F BB 06 00         [24]  421 	cjne	r3,#0x06,00256$
      000D22                        422 00256$:
      000D22 50 0A            [24]  423 	jnc	00110$
                                    424 ;	.\read.c:46: shift_out();
      000D24 C0 03            [24]  425 	push	ar3
      000D26 12 07 C8         [24]  426 	lcall	_shift_out
      000D29 D0 03            [24]  427 	pop	ar3
                                    428 ;	.\read.c:45: for(int i = 0; i < 6; i++){
      000D2B 0B               [12]  429 	inc	r3
      000D2C 80 F1            [24]  430 	sjmp	00125$
      000D2E                        431 00110$:
                                    432 ;	.\read.c:50: int p1 = asm_shift_out_2();
      000D2E 12 06 8D         [24]  433 	lcall	_asm_shift_out_2
      000D31 AB 82            [24]  434 	mov	r3, dpl
      000D33 7A 00            [12]  435 	mov	r2,#0x00
                                    436 ;	.\read.c:51: p1 <<= 8;
      000D35 8B 37            [24]  437 	mov	(_read_RX_buffer_p1_20001_28 + 1),r3
      000D37 8A 36            [24]  438 	mov	_read_RX_buffer_p1_20001_28,r2
                                    439 ;	.\read.c:53: p1 |= asm_shift_out_2();
      000D39 12 06 8D         [24]  440 	lcall	_asm_shift_out_2
      000D3C AB 82            [24]  441 	mov	r3, dpl
      000D3E 7A 00            [12]  442 	mov	r2,#0x00
      000D40 E5 37            [12]  443 	mov	a,(_read_RX_buffer_p1_20001_28 + 1)
      000D42 42 02            [12]  444 	orl	ar2,a
                                    445 ;	.\read.c:55: P2_1 = 0;
                                    446 ;	assignBit
      000D44 C2 A1            [12]  447 	clr	_P2_1
                                    448 ;	.\read.c:56: for(int i = 0; i < p1; i++){
      000D46 E4               [12]  449 	clr	a
      000D47 F5 38            [12]  450 	mov	_read_RX_buffer_i_30001_29,a
      000D49 F5 39            [12]  451 	mov	(_read_RX_buffer_i_30001_29 + 1),a
      000D4B                        452 00128$:
      000D4B C3               [12]  453 	clr	c
      000D4C E5 38            [12]  454 	mov	a,_read_RX_buffer_i_30001_29
      000D4E 9B               [12]  455 	subb	a,r3
      000D4F E5 39            [12]  456 	mov	a,(_read_RX_buffer_i_30001_29 + 1)
      000D51 64 80            [12]  457 	xrl	a,#0x80
      000D53 8A F0            [24]  458 	mov	b,r2
      000D55 63 F0 80         [24]  459 	xrl	b,#0x80
      000D58 95 F0            [12]  460 	subb	a,b
      000D5A 50 36            [24]  461 	jnc	00113$
                                    462 ;	.\read.c:58: buffer[i] = asm_shift_out_2();
      000D5C E5 38            [12]  463 	mov	a,_read_RX_buffer_i_30001_29
      000D5E 24 3D            [12]  464 	add	a, #_buffer
      000D60 F9               [12]  465 	mov	r1,a
      000D61 C0 03            [24]  466 	push	ar3
      000D63 C0 02            [24]  467 	push	ar2
      000D65 C0 01            [24]  468 	push	ar1
      000D67 12 06 8D         [24]  469 	lcall	_asm_shift_out_2
      000D6A E5 82            [12]  470 	mov	a, dpl
      000D6C D0 01            [24]  471 	pop	ar1
      000D6E D0 02            [24]  472 	pop	ar2
      000D70 D0 03            [24]  473 	pop	ar3
      000D72 F7               [12]  474 	mov	@r1,a
                                    475 ;	.\read.c:59: if(i >= buffer_size){
      000D73 AD 5B            [24]  476 	mov	r5,_buffer_size
      000D75 7F 00            [12]  477 	mov	r7,#0x00
      000D77 C3               [12]  478 	clr	c
      000D78 E5 38            [12]  479 	mov	a,_read_RX_buffer_i_30001_29
      000D7A 9D               [12]  480 	subb	a,r5
      000D7B E5 39            [12]  481 	mov	a,(_read_RX_buffer_i_30001_29 + 1)
      000D7D 64 80            [12]  482 	xrl	a,#0x80
      000D7F 8F F0            [24]  483 	mov	b,r7
      000D81 63 F0 80         [24]  484 	xrl	b,#0x80
      000D84 95 F0            [12]  485 	subb	a,b
      000D86 50 0A            [24]  486 	jnc	00113$
                                    487 ;	.\read.c:56: for(int i = 0; i < p1; i++){
      000D88 05 38            [12]  488 	inc	_read_RX_buffer_i_30001_29
      000D8A E4               [12]  489 	clr	a
      000D8B B5 38 BD         [24]  490 	cjne	a,_read_RX_buffer_i_30001_29,00128$
      000D8E 05 39            [12]  491 	inc	(_read_RX_buffer_i_30001_29 + 1)
      000D90 80 B9            [24]  492 	sjmp	00128$
      000D92                        493 00113$:
                                    494 ;	.\read.c:63: P2_1 = 1;
                                    495 ;	assignBit
      000D92 D2 A1            [12]  496 	setb	_P2_1
                                    497 ;	.\read.c:64: ret = p1;
      000D94 8B 04            [24]  498 	mov	ar4,r3
                                    499 ;	.\read.c:65: break;
                                    500 ;	.\read.c:66: case 1:
      000D96 80 4B            [24]  501 	sjmp	00119$
      000D98                        502 00114$:
                                    503 ;	.\read.c:67: P2_1 = 0;
                                    504 ;	assignBit
      000D98 C2 A1            [12]  505 	clr	_P2_1
                                    506 ;	.\read.c:68: for(int i = 0; i < rw_size; i++){
      000D9A 7E 00            [12]  507 	mov	r6,#0x00
      000D9C 7F 00            [12]  508 	mov	r7,#0x00
      000D9E                        509 00131$:
      000D9E C3               [12]  510 	clr	c
      000D9F EE               [12]  511 	mov	a,r6
      000DA0 95 64            [12]  512 	subb	a,_rw_size
      000DA2 EF               [12]  513 	mov	a,r7
      000DA3 64 80            [12]  514 	xrl	a,#0x80
      000DA5 85 65 F0         [24]  515 	mov	b,(_rw_size + 1)
      000DA8 63 F0 80         [24]  516 	xrl	b,#0x80
      000DAB 95 F0            [12]  517 	subb	a,b
      000DAD 50 30            [24]  518 	jnc	00117$
                                    519 ;	.\read.c:70: buffer[i] = asm_shift_out_2();
      000DAF EE               [12]  520 	mov	a,r6
      000DB0 24 3D            [12]  521 	add	a, #_buffer
      000DB2 F9               [12]  522 	mov	r1,a
      000DB3 C0 07            [24]  523 	push	ar7
      000DB5 C0 06            [24]  524 	push	ar6
      000DB7 C0 01            [24]  525 	push	ar1
      000DB9 12 06 8D         [24]  526 	lcall	_asm_shift_out_2
      000DBC E5 82            [12]  527 	mov	a, dpl
      000DBE D0 01            [24]  528 	pop	ar1
      000DC0 D0 06            [24]  529 	pop	ar6
      000DC2 D0 07            [24]  530 	pop	ar7
      000DC4 F7               [12]  531 	mov	@r1,a
                                    532 ;	.\read.c:71: if(i >= buffer_size){
      000DC5 AB 5B            [24]  533 	mov	r3,_buffer_size
      000DC7 7D 00            [12]  534 	mov	r5,#0x00
      000DC9 C3               [12]  535 	clr	c
      000DCA EE               [12]  536 	mov	a,r6
      000DCB 9B               [12]  537 	subb	a,r3
      000DCC EF               [12]  538 	mov	a,r7
      000DCD 64 80            [12]  539 	xrl	a,#0x80
      000DCF 8D F0            [24]  540 	mov	b,r5
      000DD1 63 F0 80         [24]  541 	xrl	b,#0x80
      000DD4 95 F0            [12]  542 	subb	a,b
      000DD6 50 07            [24]  543 	jnc	00117$
                                    544 ;	.\read.c:68: for(int i = 0; i < rw_size; i++){
      000DD8 0E               [12]  545 	inc	r6
      000DD9 BE 00 C2         [24]  546 	cjne	r6,#0x00,00131$
      000DDC 0F               [12]  547 	inc	r7
      000DDD 80 BF            [24]  548 	sjmp	00131$
      000DDF                        549 00117$:
                                    550 ;	.\read.c:75: P2_1 = 1;
                                    551 ;	assignBit
      000DDF D2 A1            [12]  552 	setb	_P2_1
                                    553 ;	.\read.c:76: ret = rw_size;
      000DE1 AC 64            [24]  554 	mov	r4,_rw_size
                                    555 ;	.\read.c:80: }
      000DE3                        556 00119$:
                                    557 ;	.\read.c:81: end();
      000DE3 C0 04            [24]  558 	push	ar4
      000DE5 12 05 B0         [24]  559 	lcall	_end
      000DE8 D0 04            [24]  560 	pop	ar4
                                    561 ;	.\read.c:83: rw_ptr += rw_size;
      000DEA E5 64            [12]  562 	mov	a,_rw_size
      000DEC 25 62            [12]  563 	add	a, _rw_ptr
      000DEE F5 62            [12]  564 	mov	_rw_ptr,a
      000DF0 E5 65            [12]  565 	mov	a,(_rw_size + 1)
      000DF2 35 63            [12]  566 	addc	a, (_rw_ptr + 1)
      000DF4 F5 63            [12]  567 	mov	(_rw_ptr + 1),a
                                    568 ;	.\read.c:85: switch (*socket)
      000DF6 85 33 82         [24]  569 	mov	dpl,_read_RX_buffer_socket_10000_21
      000DF9 85 34 83         [24]  570 	mov	dph,(_read_RX_buffer_socket_10000_21 + 1)
      000DFC 85 35 F0         [24]  571 	mov	b,(_read_RX_buffer_socket_10000_21 + 2)
      000DFF 12 19 3D         [24]  572 	lcall	__gptrget
      000E02 FF               [12]  573 	mov	r7,a
      000E03 60 05            [24]  574 	jz	00120$
                                    575 ;	.\read.c:87: case 0:
      000E05 BF 01 66         [24]  576 	cjne	r7,#0x01,00123$
      000E08 80 33            [24]  577 	sjmp	00121$
      000E0A                        578 00120$:
                                    579 ;	.\read.c:88: send_2(0x0028, 0x0C, GET_HIGH_BITS(rw_ptr), GET_LOW_BITS(rw_ptr));
      000E0A E5 63            [12]  580 	mov	a,(_rw_ptr + 1)
      000E0C F5 13            [12]  581 	mov	_send_2_PARM_3,a
      000E0E 33               [12]  582 	rlc	a
      000E0F 95 E0            [12]  583 	subb	a,acc
      000E11 F5 14            [12]  584 	mov	(_send_2_PARM_3 + 1),a
      000E13 85 62 15         [24]  585 	mov	_send_2_PARM_4,_rw_ptr
      000E16 75 16 00         [24]  586 	mov	(_send_2_PARM_4 + 1),#0x00
      000E19 75 11 0C         [24]  587 	mov	_send_2_PARM_2,#0x0c
      000E1C 75 12 00         [24]  588 	mov	(_send_2_PARM_2 + 1),#0x00
      000E1F 90 00 28         [24]  589 	mov	dptr,#0x0028
      000E22 C0 04            [24]  590 	push	ar4
      000E24 12 04 6A         [24]  591 	lcall	_send_2
                                    592 ;	.\read.c:89: send_1(0x0001, 0x0C, 0x40);
      000E27 75 0D 0C         [24]  593 	mov	_send_1_PARM_2,#0x0c
      000E2A 75 0E 00         [24]  594 	mov	(_send_1_PARM_2 + 1),#0x00
      000E2D 75 0F 40         [24]  595 	mov	_send_1_PARM_3,#0x40
      000E30 75 10 00         [24]  596 	mov	(_send_1_PARM_3 + 1),#0x00
      000E33 90 00 01         [24]  597 	mov	dptr,#0x0001
      000E36 12 04 3A         [24]  598 	lcall	_send_1
      000E39 D0 04            [24]  599 	pop	ar4
                                    600 ;	.\read.c:90: break;
                                    601 ;	.\read.c:91: case 1: 
      000E3B 80 31            [24]  602 	sjmp	00123$
      000E3D                        603 00121$:
                                    604 ;	.\read.c:92: send_2(0x0028, 0x2C, GET_HIGH_BITS(rw_ptr), GET_LOW_BITS(rw_ptr));
      000E3D E5 63            [12]  605 	mov	a,(_rw_ptr + 1)
      000E3F F5 13            [12]  606 	mov	_send_2_PARM_3,a
      000E41 33               [12]  607 	rlc	a
      000E42 95 E0            [12]  608 	subb	a,acc
      000E44 F5 14            [12]  609 	mov	(_send_2_PARM_3 + 1),a
      000E46 85 62 15         [24]  610 	mov	_send_2_PARM_4,_rw_ptr
      000E49 75 16 00         [24]  611 	mov	(_send_2_PARM_4 + 1),#0x00
      000E4C 75 11 2C         [24]  612 	mov	_send_2_PARM_2,#0x2c
      000E4F 75 12 00         [24]  613 	mov	(_send_2_PARM_2 + 1),#0x00
      000E52 90 00 28         [24]  614 	mov	dptr,#0x0028
      000E55 C0 04            [24]  615 	push	ar4
      000E57 12 04 6A         [24]  616 	lcall	_send_2
                                    617 ;	.\read.c:93: send_1(0x0001, 0x2C, 0x40);
      000E5A 75 0D 2C         [24]  618 	mov	_send_1_PARM_2,#0x2c
      000E5D 75 0E 00         [24]  619 	mov	(_send_1_PARM_2 + 1),#0x00
      000E60 75 0F 40         [24]  620 	mov	_send_1_PARM_3,#0x40
      000E63 75 10 00         [24]  621 	mov	(_send_1_PARM_3 + 1),#0x00
      000E66 90 00 01         [24]  622 	mov	dptr,#0x0001
      000E69 12 04 3A         [24]  623 	lcall	_send_1
      000E6C D0 04            [24]  624 	pop	ar4
                                    625 ;	.\read.c:97: }
      000E6E                        626 00123$:
                                    627 ;	.\read.c:99: return ret;
      000E6E 8C 82            [24]  628 	mov	dpl, r4
                                    629 ;	.\read.c:100: }
      000E70 22               [24]  630 	ret
                                    631 	.area CSEG    (CODE)
                                    632 	.area CONST   (CODE)
                                    633 	.area XINIT   (CODE)
                                    634 	.area CABS    (ABS,CODE)
