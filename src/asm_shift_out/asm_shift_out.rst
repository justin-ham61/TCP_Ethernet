ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Intel 8051)               Page 1
Hexadecimal [24-Bits]



      0000A6                          1 asm_shift_out:
      0000A6 74 00            [12]    2     MOV A, #0        ; Initialize 'data' (A register) to 0
      0000A8 78 08            [12]    3     MOV R0, #8       ; Loop counter (8 iterations for 8 bits)
                                      4     
      0000AA                          5 SHIFT_LOOP:
      0000AA 33               [12]    6     RLC A            ; Rotate left through carry (equivalent to <<= 1)
      0000AB D2 A7            [12]    7     SETB P2.7        ; Set P2.7 to 1
      0000AD 45 A4            [12]    8     ORL A, P2.4      ; Bitwise OR A with P2.4 (data |= P2_4)
      0000AF C2 A7            [12]    9     CLR P2.7         ; Clear P2.7 (set to 0)
      0000B1 D8 F7            [24]   10     DJNZ R0, SHIFT_LOOP   ; Decrement R0 and jump to SHIFT_LOOP if R0 != 0
                                     11     
      0000B3 22               [24]   12     RET               ; Return from the function
