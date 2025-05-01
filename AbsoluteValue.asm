@R0
D=M           // Load R0 value into D

@POSITIVE
D;JGE         // If D >= 0, jump to POSITIVE

@R2
M=1           // Negative number → mark R2 = 1
D=-D          // Make D positive

@OVERFLOW
D;JLT         // If still negative → jump to OVERFLOW (overflow case)

@R1
M=D           // No overflow → store positive number in R1

@R4
M=0           // Clear R4 (optional, to avoid garbage)

@R3
M=0           // Mark R3 = 0 → no overflow

@END
0;JMP         // Jump to END

(OVERFLOW)
@R3
M=1           // Overflow happened → mark R3 = 1
@R0
D=M

@R4
M=D           // Store original value in R4 (optional copy, useful for debugging)

@R1
M=D           // Store original negative number into R1

@END
0;JMP         // Jump to END

(POSITIVE)
@R1
M=D           // Positive number → store in R1
@R2
M=0           // Not negative → mark R2 = 0

@R4
M=D           // Store positive value in R4 (optional copy)

@R3
M=0           // No overflow → mark R3 = 0

(END)
@END
0;JMP         // Infinite loop → program ends here