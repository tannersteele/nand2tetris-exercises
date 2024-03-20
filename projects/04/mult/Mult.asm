// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

// Optimization note: @R2 could be used as the sole output buffer, kept 'sum' separate for cleanliness
// This implementation keeps all the registers in their original form, you can avoid temps by overwriting their values.

    @R1
    D=M         // Load value from R1 into D register
    @i
    M=D         // Set iterator register in R1's register
    @R2
    M=0         // Clear the R2 register
    @sum
    M=0         // Clear the sum register

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
    @END        // Loop forever to avoid encountering downstream instructions
    0;JMP