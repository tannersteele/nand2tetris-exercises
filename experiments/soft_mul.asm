// R[0] = First number to multiply
// R[1] = Second number to multiply
// R[2] = Result

// Optimization note: @R2 could be used as the sole output buffer, kept 'sum' separate for cleanliness
// This implementation keeps all the registers in their original form, you can avoid temps by overwriting their values.

    @R1
    D=M         // Load value from R1 into D register
    @i
    M=D         // Set iterator register in R1's register

(LOOPBEGIN)
    @i
    D=M         // Load current iterator register value into data register to check if we're done iterating
    @LOOPEND
    D;JEQ
    @R0
    D=M         // Load R0 into current data register to calculate running 'sum'
    @sum
    M=D+M
    @i          // Decrement iterator register by 1
    M=M-1
    @LOOPBEGIN
    D;JMP

(LOOPEND)
    @sum
    D=M 
    @R2
    M=D         // Set R2 register contents to running sum

(END)
    @END
    0;JMP
