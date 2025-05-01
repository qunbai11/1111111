@R0
D=M           // Load the value from R0 into D

@POSITIVE
D;JGE         // If D is positive or zero, jump to POSITIVE

@R2
M=1           // Negative number → set R2 to 1 to mark negative
D=-D          // Make D positive by flipping the sign

@OVERFLOW
D;JLT         // If D is still negative after flipping, jump to OVERFLOW

@R1
M=D           // Store the positive value into R1

@R4
M=0           // Reset R4 to keep memory clean

@R3
M=0           // Set R3 to 0 to indicate no overflow

@END
0;JMP         // Jump to END

(OVERFLOW)
@R3
M=1           // Overflow occurred → set R3 to 1

@R0
D=M           // Load the original negative value from R0

@R4
M=D           // Store the original value into R4 for later reference

@R1
M=D           // Store the original negative value into R1

@END
0;JMP         // Jump to END

(POSITIVE)
@R1
M=D           // Positive number → store into R1

@R2
M=0           // Set R2 to 0 to mark as not negative

@R4
M=D           // Store the positive value into R4 for consistency

@R3
M=0           // Set R3 to 0 → no overflow

(END)
@END
0;JMP         // Infinite loop → program completed