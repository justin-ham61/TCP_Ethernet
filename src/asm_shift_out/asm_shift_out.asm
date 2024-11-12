.gloabl asm_shift_out:
    MOV A, #0        ; Initialize 'data' (A register) to 0
    MOV R0, #8       ; Loop counter (8 iterations for 8 bits)
    
SHIFT_LOOP:
    RLC A            ; Rotate left through carry (equivalent to <<= 1)
    SETB P2.7        ; Set P2.7 to 1
    ORL A, P2.4      ; Bitwise OR A with P2.4 (data |= P2_4)
    CLR P2.7         ; Clear P2.7 (set to 0)
    DJNZ R0, SHIFT_LOOP   ; Decrement R0 and jump to SHIFT_LOOP if R0 != 0
    
    RET               ; Return from the function