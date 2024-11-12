                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.4.0 #14620 (MINGW32)
                                      4 ;--------------------------------------------------------
                                      5 	.module write
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _get_2
                                     12 	.globl _send_2
                                     13 	.globl _end
                                     14 	.globl _begin
                                     15 	.globl _asm_shift_in_2
                                     16 	.globl _shift_in
                                     17 	.globl _CY
                                     18 	.globl _AC
                                     19 	.globl _F0
                                     20 	.globl _RS1
                                     21 	.globl _RS0
                                     22 	.globl _OV
                                     23 	.globl _F1
                                     24 	.globl _P
                                     25 	.globl _PS
                                     26 	.globl _PT1
                                     27 	.globl _PX1
                                     28 	.globl _PT0
                                     29 	.globl _PX0
                                     30 	.globl _RD
                                     31 	.globl _WR
                                     32 	.globl _T1
                                     33 	.globl _T0
                                     34 	.globl _INT1
                                     35 	.globl _INT0
                                     36 	.globl _TXD
                                     37 	.globl _RXD
                                     38 	.globl _P3_7
                                     39 	.globl _P3_6
                                     40 	.globl _P3_5
                                     41 	.globl _P3_4
                                     42 	.globl _P3_3
                                     43 	.globl _P3_2
                                     44 	.globl _P3_1
                                     45 	.globl _P3_0
                                     46 	.globl _EA
                                     47 	.globl _ES
                                     48 	.globl _ET1
                                     49 	.globl _EX1
                                     50 	.globl _ET0
                                     51 	.globl _EX0
                                     52 	.globl _P2_7
                                     53 	.globl _P2_6
                                     54 	.globl _P2_5
                                     55 	.globl _P2_4
                                     56 	.globl _P2_3
                                     57 	.globl _P2_2
                                     58 	.globl _P2_1
                                     59 	.globl _P2_0
                                     60 	.globl _SM0
                                     61 	.globl _SM1
                                     62 	.globl _SM2
                                     63 	.globl _REN
                                     64 	.globl _TB8
                                     65 	.globl _RB8
                                     66 	.globl _TI
                                     67 	.globl _RI
                                     68 	.globl _P1_7
                                     69 	.globl _P1_6
                                     70 	.globl _P1_5
                                     71 	.globl _P1_4
                                     72 	.globl _P1_3
                                     73 	.globl _P1_2
                                     74 	.globl _P1_1
                                     75 	.globl _P1_0
                                     76 	.globl _TF1
                                     77 	.globl _TR1
                                     78 	.globl _TF0
                                     79 	.globl _TR0
                                     80 	.globl _IE1
                                     81 	.globl _IT1
                                     82 	.globl _IE0
                                     83 	.globl _IT0
                                     84 	.globl _P0_7
                                     85 	.globl _P0_6
                                     86 	.globl _P0_5
                                     87 	.globl _P0_4
                                     88 	.globl _P0_3
                                     89 	.globl _P0_2
                                     90 	.globl _P0_1
                                     91 	.globl _P0_0
                                     92 	.globl _B
                                     93 	.globl _ACC
                                     94 	.globl _PSW
                                     95 	.globl _IP
                                     96 	.globl _P3
                                     97 	.globl _IE
                                     98 	.globl _P2
                                     99 	.globl _SBUF
                                    100 	.globl _SCON
                                    101 	.globl _P1
                                    102 	.globl _TH1
                                    103 	.globl _TH0
                                    104 	.globl _TL1
                                    105 	.globl _TL0
                                    106 	.globl _TMOD
                                    107 	.globl _TCON
                                    108 	.globl _PCON
                                    109 	.globl _DPH
                                    110 	.globl _DPL
                                    111 	.globl _SP
                                    112 	.globl _P0
                                    113 	.globl _write_to_buffer_PARM_2
                                    114 	.globl _write_to_buffer
                                    115 ;--------------------------------------------------------
                                    116 ; special function registers
                                    117 ;--------------------------------------------------------
                                    118 	.area RSEG    (ABS,DATA)
      000000                        119 	.org 0x0000
                           000080   120 _P0	=	0x0080
                           000081   121 _SP	=	0x0081
                           000082   122 _DPL	=	0x0082
                           000083   123 _DPH	=	0x0083
                           000087   124 _PCON	=	0x0087
                           000088   125 _TCON	=	0x0088
                           000089   126 _TMOD	=	0x0089
                           00008A   127 _TL0	=	0x008a
                           00008B   128 _TL1	=	0x008b
                           00008C   129 _TH0	=	0x008c
                           00008D   130 _TH1	=	0x008d
                           000090   131 _P1	=	0x0090
                           000098   132 _SCON	=	0x0098
                           000099   133 _SBUF	=	0x0099
                           0000A0   134 _P2	=	0x00a0
                           0000A8   135 _IE	=	0x00a8
                           0000B0   136 _P3	=	0x00b0
                           0000B8   137 _IP	=	0x00b8
                           0000D0   138 _PSW	=	0x00d0
                           0000E0   139 _ACC	=	0x00e0
                           0000F0   140 _B	=	0x00f0
                                    141 ;--------------------------------------------------------
                                    142 ; special function bits
                                    143 ;--------------------------------------------------------
                                    144 	.area RSEG    (ABS,DATA)
      000000                        145 	.org 0x0000
                           000080   146 _P0_0	=	0x0080
                           000081   147 _P0_1	=	0x0081
                           000082   148 _P0_2	=	0x0082
                           000083   149 _P0_3	=	0x0083
                           000084   150 _P0_4	=	0x0084
                           000085   151 _P0_5	=	0x0085
                           000086   152 _P0_6	=	0x0086
                           000087   153 _P0_7	=	0x0087
                           000088   154 _IT0	=	0x0088
                           000089   155 _IE0	=	0x0089
                           00008A   156 _IT1	=	0x008a
                           00008B   157 _IE1	=	0x008b
                           00008C   158 _TR0	=	0x008c
                           00008D   159 _TF0	=	0x008d
                           00008E   160 _TR1	=	0x008e
                           00008F   161 _TF1	=	0x008f
                           000090   162 _P1_0	=	0x0090
                           000091   163 _P1_1	=	0x0091
                           000092   164 _P1_2	=	0x0092
                           000093   165 _P1_3	=	0x0093
                           000094   166 _P1_4	=	0x0094
                           000095   167 _P1_5	=	0x0095
                           000096   168 _P1_6	=	0x0096
                           000097   169 _P1_7	=	0x0097
                           000098   170 _RI	=	0x0098
                           000099   171 _TI	=	0x0099
                           00009A   172 _RB8	=	0x009a
                           00009B   173 _TB8	=	0x009b
                           00009C   174 _REN	=	0x009c
                           00009D   175 _SM2	=	0x009d
                           00009E   176 _SM1	=	0x009e
                           00009F   177 _SM0	=	0x009f
                           0000A0   178 _P2_0	=	0x00a0
                           0000A1   179 _P2_1	=	0x00a1
                           0000A2   180 _P2_2	=	0x00a2
                           0000A3   181 _P2_3	=	0x00a3
                           0000A4   182 _P2_4	=	0x00a4
                           0000A5   183 _P2_5	=	0x00a5
                           0000A6   184 _P2_6	=	0x00a6
                           0000A7   185 _P2_7	=	0x00a7
                           0000A8   186 _EX0	=	0x00a8
                           0000A9   187 _ET0	=	0x00a9
                           0000AA   188 _EX1	=	0x00aa
                           0000AB   189 _ET1	=	0x00ab
                           0000AC   190 _ES	=	0x00ac
                           0000AF   191 _EA	=	0x00af
                           0000B0   192 _P3_0	=	0x00b0
                           0000B1   193 _P3_1	=	0x00b1
                           0000B2   194 _P3_2	=	0x00b2
                           0000B3   195 _P3_3	=	0x00b3
                           0000B4   196 _P3_4	=	0x00b4
                           0000B5   197 _P3_5	=	0x00b5
                           0000B6   198 _P3_6	=	0x00b6
                           0000B7   199 _P3_7	=	0x00b7
                           0000B0   200 _RXD	=	0x00b0
                           0000B1   201 _TXD	=	0x00b1
                           0000B2   202 _INT0	=	0x00b2
                           0000B3   203 _INT1	=	0x00b3
                           0000B4   204 _T0	=	0x00b4
                           0000B5   205 _T1	=	0x00b5
                           0000B6   206 _WR	=	0x00b6
                           0000B7   207 _RD	=	0x00b7
                           0000B8   208 _PX0	=	0x00b8
                           0000B9   209 _PT0	=	0x00b9
                           0000BA   210 _PX1	=	0x00ba
                           0000BB   211 _PT1	=	0x00bb
                           0000BC   212 _PS	=	0x00bc
                           0000D0   213 _P	=	0x00d0
                           0000D1   214 _F1	=	0x00d1
                           0000D2   215 _OV	=	0x00d2
                           0000D3   216 _RS0	=	0x00d3
                           0000D4   217 _RS1	=	0x00d4
                           0000D5   218 _F0	=	0x00d5
                           0000D6   219 _AC	=	0x00d6
                           0000D7   220 _CY	=	0x00d7
                                    221 ;--------------------------------------------------------
                                    222 ; overlayable register banks
                                    223 ;--------------------------------------------------------
                                    224 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        225 	.ds 8
                                    226 ;--------------------------------------------------------
                                    227 ; internal ram data
                                    228 ;--------------------------------------------------------
                                    229 	.area DSEG    (DATA)
      00003A                        230 _write_to_buffer_PARM_2:
      00003A                        231 	.ds 3
                                    232 ;--------------------------------------------------------
                                    233 ; overlayable items in internal ram
                                    234 ;--------------------------------------------------------
                                    235 ;--------------------------------------------------------
                                    236 ; indirectly addressable internal ram data
                                    237 ;--------------------------------------------------------
                                    238 	.area ISEG    (DATA)
                                    239 ;--------------------------------------------------------
                                    240 ; absolute internal ram data
                                    241 ;--------------------------------------------------------
                                    242 	.area IABS    (ABS,DATA)
                                    243 	.area IABS    (ABS,DATA)
                                    244 ;--------------------------------------------------------
                                    245 ; bit data
                                    246 ;--------------------------------------------------------
                                    247 	.area BSEG    (BIT)
                                    248 ;--------------------------------------------------------
                                    249 ; paged external ram data
                                    250 ;--------------------------------------------------------
                                    251 	.area PSEG    (PAG,XDATA)
                                    252 ;--------------------------------------------------------
                                    253 ; uninitialized external ram data
                                    254 ;--------------------------------------------------------
                                    255 	.area XSEG    (XDATA)
                                    256 ;--------------------------------------------------------
                                    257 ; absolute external ram data
                                    258 ;--------------------------------------------------------
                                    259 	.area XABS    (ABS,XDATA)
                                    260 ;--------------------------------------------------------
                                    261 ; initialized external ram data
                                    262 ;--------------------------------------------------------
                                    263 	.area XISEG   (XDATA)
                                    264 	.area HOME    (CODE)
                                    265 	.area GSINIT0 (CODE)
                                    266 	.area GSINIT1 (CODE)
                                    267 	.area GSINIT2 (CODE)
                                    268 	.area GSINIT3 (CODE)
                                    269 	.area GSINIT4 (CODE)
                                    270 	.area GSINIT5 (CODE)
                                    271 	.area GSINIT  (CODE)
                                    272 	.area GSFINAL (CODE)
                                    273 	.area CSEG    (CODE)
                                    274 ;--------------------------------------------------------
                                    275 ; global & static initialisations
                                    276 ;--------------------------------------------------------
                                    277 	.area HOME    (CODE)
                                    278 	.area GSINIT  (CODE)
                                    279 	.area GSFINAL (CODE)
                                    280 	.area GSINIT  (CODE)
                                    281 ;--------------------------------------------------------
                                    282 ; Home
                                    283 ;--------------------------------------------------------
                                    284 	.area HOME    (CODE)
                                    285 	.area HOME    (CODE)
                                    286 ;--------------------------------------------------------
                                    287 ; code
                                    288 ;--------------------------------------------------------
                                    289 	.area CSEG    (CODE)
                                    290 ;------------------------------------------------------------
                                    291 ;Allocation info for local variables in function 'write_to_buffer'
                                    292 ;------------------------------------------------------------
                                    293 ;str                       Allocated with name '_write_to_buffer_PARM_2'
                                    294 ;socket                    Allocated to registers r7 
                                    295 ;i                         Allocated to registers r5 
                                    296 ;------------------------------------------------------------
                                    297 ;	.\write.c:8: void write_to_buffer(unsigned char socket, char* str){
                                    298 ;	-----------------------------------------
                                    299 ;	 function write_to_buffer
                                    300 ;	-----------------------------------------
      000E71                        301 _write_to_buffer:
                           000007   302 	ar7 = 0x07
                           000006   303 	ar6 = 0x06
                           000005   304 	ar5 = 0x05
                           000004   305 	ar4 = 0x04
                           000003   306 	ar3 = 0x03
                           000002   307 	ar2 = 0x02
                           000001   308 	ar1 = 0x01
                           000000   309 	ar0 = 0x00
      000E71 AF 82            [24]  310 	mov	r7, dpl
                                    311 ;	.\write.c:10: switch (socket)
      000E73 E4               [12]  312 	clr	a
      000E74 BF 00 01         [24]  313 	cjne	r7,#0x00,00167$
      000E77 04               [12]  314 	inc	a
      000E78                        315 00167$:
      000E78 FE               [12]  316 	mov	r6,a
      000E79 70 05            [24]  317 	jnz	00101$
                                    318 ;	.\write.c:12: case 0:
      000E7B BF 01 3A         [24]  319 	cjne	r7,#0x01,00103$
      000E7E 80 1C            [24]  320 	sjmp	00102$
      000E80                        321 00101$:
                                    322 ;	.\write.c:13: rw_ptr = get_2(0x0024, 0x08);
      000E80 75 21 08         [24]  323 	mov	_get_2_PARM_2,#0x08
      000E83 75 22 00         [24]  324 	mov	(_get_2_PARM_2 + 1),#0x00
      000E86 90 00 24         [24]  325 	mov	dptr,#0x0024
      000E89 C0 07            [24]  326 	push	ar7
      000E8B C0 06            [24]  327 	push	ar6
      000E8D 12 04 E2         [24]  328 	lcall	_get_2
      000E90 85 82 62         [24]  329 	mov	_rw_ptr,dpl
      000E93 85 83 63         [24]  330 	mov	(_rw_ptr + 1),dph
      000E96 D0 06            [24]  331 	pop	ar6
      000E98 D0 07            [24]  332 	pop	ar7
                                    333 ;	.\write.c:14: break;
                                    334 ;	.\write.c:15: case 1: 
      000E9A 80 21            [24]  335 	sjmp	00104$
      000E9C                        336 00102$:
                                    337 ;	.\write.c:16: rw_ptr = get_2(0x0024, 0x28);
      000E9C 75 21 28         [24]  338 	mov	_get_2_PARM_2,#0x28
      000E9F 75 22 00         [24]  339 	mov	(_get_2_PARM_2 + 1),#0x00
      000EA2 90 00 24         [24]  340 	mov	dptr,#0x0024
      000EA5 C0 07            [24]  341 	push	ar7
      000EA7 C0 06            [24]  342 	push	ar6
      000EA9 12 04 E2         [24]  343 	lcall	_get_2
      000EAC 85 82 62         [24]  344 	mov	_rw_ptr,dpl
      000EAF 85 83 63         [24]  345 	mov	(_rw_ptr + 1),dph
      000EB2 D0 06            [24]  346 	pop	ar6
      000EB4 D0 07            [24]  347 	pop	ar7
                                    348 ;	.\write.c:17: break;
                                    349 ;	.\write.c:18: default:
      000EB6 80 05            [24]  350 	sjmp	00104$
      000EB8                        351 00103$:
                                    352 ;	.\write.c:19: rw_ptr = 0;
      000EB8 E4               [12]  353 	clr	a
      000EB9 F5 62            [12]  354 	mov	_rw_ptr,a
      000EBB F5 63            [12]  355 	mov	(_rw_ptr + 1),a
                                    356 ;	.\write.c:21: }
      000EBD                        357 00104$:
                                    358 ;	.\write.c:22: begin();
      000EBD C0 07            [24]  359 	push	ar7
      000EBF C0 06            [24]  360 	push	ar6
      000EC1 12 05 AD         [24]  361 	lcall	_begin
                                    362 ;	.\write.c:23: asm_shift_in_2(GET_HIGH_BITS(rw_ptr));
      000EC4 85 63 82         [24]  363 	mov	dpl,(_rw_ptr + 1)
      000EC7 12 05 B3         [24]  364 	lcall	_asm_shift_in_2
                                    365 ;	.\write.c:25: asm_shift_in_2(GET_LOW_BITS(rw_ptr));
      000ECA 85 62 82         [24]  366 	mov	dpl,_rw_ptr
      000ECD 12 05 B3         [24]  367 	lcall	_asm_shift_in_2
      000ED0 D0 06            [24]  368 	pop	ar6
      000ED2 D0 07            [24]  369 	pop	ar7
                                    370 ;	.\write.c:27: switch (socket)
      000ED4 EE               [12]  371 	mov	a,r6
      000ED5 70 05            [24]  372 	jnz	00105$
                                    373 ;	.\write.c:29: case 0:
      000ED7 BF 01 20         [24]  374 	cjne	r7,#0x01,00108$
      000EDA 80 10            [24]  375 	sjmp	00106$
      000EDC                        376 00105$:
                                    377 ;	.\write.c:30: shift_in(0x14);
      000EDC 75 82 14         [24]  378 	mov	dpl, #0x14
      000EDF C0 07            [24]  379 	push	ar7
      000EE1 C0 06            [24]  380 	push	ar6
      000EE3 12 07 4D         [24]  381 	lcall	_shift_in
      000EE6 D0 06            [24]  382 	pop	ar6
      000EE8 D0 07            [24]  383 	pop	ar7
                                    384 ;	.\write.c:31: break;
                                    385 ;	.\write.c:32: case 1: 
      000EEA 80 0E            [24]  386 	sjmp	00108$
      000EEC                        387 00106$:
                                    388 ;	.\write.c:33: shift_in(0x34);
      000EEC 75 82 34         [24]  389 	mov	dpl, #0x34
      000EEF C0 07            [24]  390 	push	ar7
      000EF1 C0 06            [24]  391 	push	ar6
      000EF3 12 07 4D         [24]  392 	lcall	_shift_in
      000EF6 D0 06            [24]  393 	pop	ar6
      000EF8 D0 07            [24]  394 	pop	ar7
                                    395 ;	.\write.c:36: }
      000EFA                        396 00108$:
                                    397 ;	.\write.c:38: P2_0 = 0;
                                    398 ;	assignBit
      000EFA C2 A0            [12]  399 	clr	_P2_0
                                    400 ;	.\write.c:39: while(str[i] != '\0'){
      000EFC 7D 00            [12]  401 	mov	r5,#0x00
      000EFE                        402 00109$:
      000EFE ED               [12]  403 	mov	a,r5
      000EFF 25 3A            [12]  404 	add	a, _write_to_buffer_PARM_2
      000F01 FA               [12]  405 	mov	r2,a
      000F02 E4               [12]  406 	clr	a
      000F03 35 3B            [12]  407 	addc	a, (_write_to_buffer_PARM_2 + 1)
      000F05 FB               [12]  408 	mov	r3,a
      000F06 AC 3C            [24]  409 	mov	r4,(_write_to_buffer_PARM_2 + 2)
      000F08 8A 82            [24]  410 	mov	dpl,r2
      000F0A 8B 83            [24]  411 	mov	dph,r3
      000F0C 8C F0            [24]  412 	mov	b,r4
      000F0E 12 19 3D         [24]  413 	lcall	__gptrget
      000F11 FC               [12]  414 	mov	r4,a
      000F12 60 14            [24]  415 	jz	00111$
                                    416 ;	.\write.c:40: asm_shift_in_2(str[i]);
      000F14 8C 82            [24]  417 	mov	dpl, r4
      000F16 C0 07            [24]  418 	push	ar7
      000F18 C0 06            [24]  419 	push	ar6
      000F1A C0 05            [24]  420 	push	ar5
      000F1C 12 05 B3         [24]  421 	lcall	_asm_shift_in_2
      000F1F D0 05            [24]  422 	pop	ar5
      000F21 D0 06            [24]  423 	pop	ar6
      000F23 D0 07            [24]  424 	pop	ar7
                                    425 ;	.\write.c:42: i++;
      000F25 0D               [12]  426 	inc	r5
      000F26 80 D6            [24]  427 	sjmp	00109$
      000F28                        428 00111$:
                                    429 ;	.\write.c:44: P2_0 = 1;
                                    430 ;	assignBit
      000F28 D2 A0            [12]  431 	setb	_P2_0
                                    432 ;	.\write.c:46: rw_ptr += i;
      000F2A 7C 00            [12]  433 	mov	r4,#0x00
      000F2C ED               [12]  434 	mov	a,r5
      000F2D 25 62            [12]  435 	add	a, _rw_ptr
      000F2F F5 62            [12]  436 	mov	_rw_ptr,a
      000F31 EC               [12]  437 	mov	a,r4
      000F32 35 63            [12]  438 	addc	a, (_rw_ptr + 1)
      000F34 F5 63            [12]  439 	mov	(_rw_ptr + 1),a
                                    440 ;	.\write.c:47: end();
      000F36 C0 07            [24]  441 	push	ar7
      000F38 C0 06            [24]  442 	push	ar6
      000F3A 12 05 B0         [24]  443 	lcall	_end
      000F3D D0 06            [24]  444 	pop	ar6
      000F3F D0 07            [24]  445 	pop	ar7
                                    446 ;	.\write.c:50: switch (socket)
      000F41 EE               [12]  447 	mov	a,r6
      000F42 70 05            [24]  448 	jnz	00112$
                                    449 ;	.\write.c:52: case 0:
      000F44 BF 01 38         [24]  450 	cjne	r7,#0x01,00116$
      000F47 80 1B            [24]  451 	sjmp	00113$
      000F49                        452 00112$:
                                    453 ;	.\write.c:53: send_2(0x0024, 0x0C, GET_HIGH_BITS(rw_ptr), GET_LOW_BITS(rw_ptr));
      000F49 E5 63            [12]  454 	mov	a,(_rw_ptr + 1)
      000F4B F5 13            [12]  455 	mov	_send_2_PARM_3,a
      000F4D 33               [12]  456 	rlc	a
      000F4E 95 E0            [12]  457 	subb	a,acc
      000F50 F5 14            [12]  458 	mov	(_send_2_PARM_3 + 1),a
      000F52 85 62 15         [24]  459 	mov	_send_2_PARM_4,_rw_ptr
      000F55 75 16 00         [24]  460 	mov	(_send_2_PARM_4 + 1),#0x00
      000F58 75 11 0C         [24]  461 	mov	_send_2_PARM_2,#0x0c
      000F5B 75 12 00         [24]  462 	mov	(_send_2_PARM_2 + 1),#0x00
      000F5E 90 00 24         [24]  463 	mov	dptr,#0x0024
                                    464 ;	.\write.c:54: break;
                                    465 ;	.\write.c:55: case 1:
      000F61 02 04 6A         [24]  466 	ljmp	_send_2
      000F64                        467 00113$:
                                    468 ;	.\write.c:56: send_2(0x0024, 0x2C, GET_HIGH_BITS(rw_ptr), GET_LOW_BITS(rw_ptr));
      000F64 E5 63            [12]  469 	mov	a,(_rw_ptr + 1)
      000F66 F5 13            [12]  470 	mov	_send_2_PARM_3,a
      000F68 33               [12]  471 	rlc	a
      000F69 95 E0            [12]  472 	subb	a,acc
      000F6B F5 14            [12]  473 	mov	(_send_2_PARM_3 + 1),a
      000F6D 85 62 15         [24]  474 	mov	_send_2_PARM_4,_rw_ptr
      000F70 75 16 00         [24]  475 	mov	(_send_2_PARM_4 + 1),#0x00
      000F73 75 11 2C         [24]  476 	mov	_send_2_PARM_2,#0x2c
      000F76 75 12 00         [24]  477 	mov	(_send_2_PARM_2 + 1),#0x00
      000F79 90 00 24         [24]  478 	mov	dptr,#0x0024
                                    479 ;	.\write.c:60: }
                                    480 ;	.\write.c:62: }
      000F7C 02 04 6A         [24]  481 	ljmp	_send_2
      000F7F                        482 00116$:
      000F7F 22               [24]  483 	ret
                                    484 	.area CSEG    (CODE)
                                    485 	.area CONST   (CODE)
                                    486 	.area XINIT   (CODE)
                                    487 	.area CABS    (ABS,CODE)
