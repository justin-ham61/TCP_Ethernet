ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Intel 8051)               Page 1
Hexadecimal [24-Bits]



                                      1 
      000020                          2 asm_shift_in:     
                                      3     ; Shift in the first bit
      000020 E8               [12]    4     MOV A, R0            ; Load the data into accumulator
      000021 54 80            [12]    5     ANL A, #0x80          ; Mask out all but the most significant bit (0x80)
      000023 60 04            [24]    6     JZ CLEAR_BIT         ; If the MSB is 0, skip setting P2.5 to 1
      000025 D2 A5            [12]    7     SETB P2.5            ; Set P2.5 to 1 (MSB is 1)
      000027 80 02            [24]    8     SJMP BIT_DONE        ; Skip the clearing part
                                      9 
      000029                         10 CLEAR_BIT:
      000029 C2 A5            [12]   11     CLR P2.5             ; Clear P2.5 to 0
                                     12 
      00002B                         13 BIT_DONE:
      00002B D2 A7            [12]   14     SETB P2.7            ; Set P2.7 to 1
      00002D C2 A7            [12]   15     CLR P2.7             ; Clear P2.7 to 0
      00002F C2 A5            [12]   16     CLR P2.5             ; Clear P2.5 after the pulse
      000031 C4               [12]   17     SWAP A               ; Rotate the accumulator to the left
      000032 F8               [12]   18     MOV R0, A            ; Store the result back to R0 (shifting left)
                                     19 
                                     20     ; Repeat the same operation for the next 7 bits, similar to your C code:
      000033 E8               [12]   21     MOV A, R0            ; Load the updated data back into accumulator
      000034 54 80            [12]   22     ANL A, #0x80          ; Mask out all but the most significant bit (0x80)
      000036 60 04            [24]   23     JZ CLEAR_BIT2
      000038 D2 A5            [12]   24     SETB P2.5
      00003A 80 02            [24]   25     SJMP BIT_DONE2
                                     26 
      00003C                         27 CLEAR_BIT2:
      00003C C2 A5            [12]   28     CLR P2.5
                                     29 
      00003E                         30 BIT_DONE2:
      00003E D2 A7            [12]   31     SETB P2.7
      000040 C2 A7            [12]   32     CLR P2.7
      000042 C2 A5            [12]   33     CLR P2.5
      000044 C4               [12]   34     SWAP A
      000045 F8               [12]   35     MOV R0, A
                                     36 
      000046 E8               [12]   37     MOV A, R0
      000047 54 80            [12]   38     ANL A, #0x80          ; Mask out all but the most significant bit (0x80)
      000049 60 04            [24]   39     JZ CLEAR_BIT3
      00004B D2 A5            [12]   40     SETB P2.5
      00004D 80 02            [24]   41     SJMP BIT_DONE3
                                     42 
      00004F                         43 CLEAR_BIT3:
      00004F C2 A5            [12]   44     CLR P2.5
                                     45 
      000051                         46 BIT_DONE3:
      000051 D2 A7            [12]   47     SETB P2.7
      000053 C2 A7            [12]   48     CLR P2.7
      000055 C2 A5            [12]   49     CLR P2.5
      000057 C4               [12]   50     SWAP A
      000058 F8               [12]   51     MOV R0, A
                                     52 
      000059 E8               [12]   53     MOV A, R0
      00005A 54 80            [12]   54     ANL A, #0x80          ; Mask out all but the most significant bit (0x80)
      00005C 60 04            [24]   55     JZ CLEAR_BIT4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Intel 8051)               Page 2
Hexadecimal [24-Bits]



      00005E D2 A5            [12]   56     SETB P2.5
      000060 80 02            [24]   57     SJMP BIT_DONE4
                                     58 
      000062                         59 CLEAR_BIT4:
      000062 C2 A5            [12]   60     CLR P2.5
                                     61 
      000064                         62 BIT_DONE4:
      000064 D2 A7            [12]   63     SETB P2.7
      000066 C2 A7            [12]   64     CLR P2.7
      000068 C2 A5            [12]   65     CLR P2.5
      00006A C4               [12]   66     SWAP A
      00006B F8               [12]   67     MOV R0, A
                                     68 
      00006C E8               [12]   69     MOV A, R0
      00006D 54 80            [12]   70     ANL A, #0x80          ; Mask out all but the most significant bit (0x80)
      00006F 60 04            [24]   71     JZ CLEAR_BIT5
      000071 D2 A5            [12]   72     SETB P2.5
      000073 80 02            [24]   73     SJMP BIT_DONE5
                                     74 
      000075                         75 CLEAR_BIT5:
      000075 C2 A5            [12]   76     CLR P2.5
                                     77 
      000077                         78 BIT_DONE5:
      000077 D2 A7            [12]   79     SETB P2.7
      000079 C2 A7            [12]   80     CLR P2.7
      00007B C2 A5            [12]   81     CLR P2.5
      00007D C4               [12]   82     SWAP A
      00007E F8               [12]   83     MOV R0, A
                                     84 
      00007F E8               [12]   85     MOV A, R0
      000080 54 80            [12]   86     ANL A, #0x80          ; Mask out all but the most significant bit (0x80)
      000082 60 04            [24]   87     JZ CLEAR_BIT6
      000084 D2 A5            [12]   88     SETB P2.5
      000086 80 02            [24]   89     SJMP BIT_DONE6
                                     90 
      000088                         91 CLEAR_BIT6:
      000088 C2 A5            [12]   92     CLR P2.5
                                     93 
      00008A                         94 BIT_DONE6:
      00008A D2 A7            [12]   95     SETB P2.7
      00008C C2 A7            [12]   96     CLR P2.7
      00008E C2 A5            [12]   97     CLR P2.5
      000090 C4               [12]   98     SWAP A
      000091 F8               [12]   99     MOV R0, A
                                    100 
      000092 E8               [12]  101     MOV A, R0
      000093 54 80            [12]  102     ANL A, #0x80          ; Mask out all but the most significant bit (0x80)
      000095 60 04            [24]  103     JZ CLEAR_BIT7
      000097 D2 A5            [12]  104     SETB P2.5
      000099 80 02            [24]  105     SJMP BIT_DONE7
                                    106 
      00009B                        107 CLEAR_BIT7:
      00009B C2 A5            [12]  108     CLR P2.5
                                    109 
      00009D                        110 BIT_DONE7:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Intel 8051)               Page 3
Hexadecimal [24-Bits]



      00009D D2 A7            [12]  111     SETB P2.7
      00009F C2 A7            [12]  112     CLR P2.7
      0000A1 C2 A5            [12]  113     CLR P2.5
      0000A3 C4               [12]  114     SWAP A
      0000A4 F8               [12]  115     MOV R0, A
                                    116 
      0000A5 22               [24]  117     RET
