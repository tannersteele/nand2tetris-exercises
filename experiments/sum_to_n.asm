//input: put a value >= i in RAM[0]
    // i = 1
    @i          //declare 'i' register, will be some random register
    M=1         //load 1 into that register

    // sum = 0
    @sum        //declare 'sum' register, will be some random register
    M=0         //load 0 into that register

(LOOP)
    // if (i > R0) goto STOP
    @i
    D=M
    @R0
    D=D-M
    @STOP
    D;JGT

    //sum = sum + i
    @sum
    D=M
    @i
    D=D+M
    @sum
    M=D

    //i = i + 1
    @i
    M=M+1

    //goto loop
    @LOOP
    0;JMP

(STOP)
    //R1 = sum
    @sum
    D=M
    @R1
    M=D

(END)
    @END
    0;JMP