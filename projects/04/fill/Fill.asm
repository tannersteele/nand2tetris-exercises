// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.


//CLEAR + BLACKEN SHOULD BE IN DIFFERENT CONDITIONALS
//could have a color option?

@SCREEN
D=A
@SCREENPOS            // holds position of SCREEN in ram
M=D 
@COLOR
M=0

(LOOPSTART)
	@24575
	D=M
	@OVERFLOWDETECTED
	D;JLT
	@KBD
	D=M
	@KEYPRESSED
	D;JGT
	@SCREEN          // if 16384 has a value != 0, allow it to continue
	D=M
	@LOOPSTART
	D;JEQ
(OVERFLOWDETECTED)
	@KBD
	D=M
	@KEYUNPRESSED    // will only hit here if 16384 is not filled in
	D;JEQ


@LOOPSTART
0;JMP

//TODO: Redundant, combine logic above
(KEYPRESSED)
	@SCREENPOS
	D=M
	@COLOR
	A=D
	M=-1            //paint it black
	@SCREENPOS
	M=D+1
	@LOOPSTART
	0;JMP

(KEYUNPRESSED)
	@SCREENPOS
	D=M
	@COLOR
	A=D
	M=0            //paint it white
	@SCREENPOS
	M=D-1
	@LOOPSTART
	0;JMP