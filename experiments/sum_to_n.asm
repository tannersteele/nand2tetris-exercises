//R0 = n (in series: 1 + 2 + 3 + ... + n)
//R1 = output register

	@R0
	D=M
	@dec
	M=D
	@inc
	M=1
	@sum
	M=0
(LOOP_START)
	@LOOP_END
	D;JEQ
	@inc
	D=M
	@sum
	M=M+D
	@inc
	M=M+1
	@dec
	M=M-1
	D=M
	@LOOP_START
	0;JMP
(LOOP_END)
	@sum
	D=M
	@R1
	M=D
(STOP)
	@STOP
	0;JMP
