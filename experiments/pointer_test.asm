// R0 = n
// Occupy memory from RAM[1] -> RAM[n] where it's register value is the corresponding memory address
// ie. RAM[1] = 1

@R0
D=M
@n
M=D
@k
M=0
@counter
M=1

(LOOPBEGIN)
@n
D=M
@LOOPEND
D;JEQ
@counter
D=M
@k
A=D+M
M=D

@counter
M=M+1

@n
M=M-1



@LOOPBEGIN
0;JMP



(LOOPEND)

