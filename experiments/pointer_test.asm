// R0 = n
// Occupy memory from RAM[1] -> RAM[n] where it's register value is the corresponding memory address
// ie. RAM[1] = 1

// A={POSITIVE INT} will act as an array indexer here.

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
	A=D        // pointer magic, 'k' acts like a proxy that 'points' to the new register (A) we'll be populating (value of 'counter')
	M=D        // nothing special here, just setting that newly selected register's value to the counter as well to ensure that: RAM[n] = n
	@counter
	M=M+1
	@n
	M=M-1
	@LOOPBEGIN
0;JMP
(LOOPEND)
(STOP)
	@STOP
	0;JMP

