// Starting at base address R0, set first R1 words to -1

	@n
	M=0
	@R1
	D=M
	@x
	M=D+1

(LOOP)
	//if (n == x) goto END
	@n
	D=M
	@x
	D=D-M
	@END
	D;JEQ
	// *(R0 + n) = -1
	@R0
	D=M
	@n
	A=D+M
	M=-1
	// n = n + 1
	@n
	M=M+1
	// goto LOOP
	@LOOP
	0;JMP
	
(END)
	@END
	0;JMP