// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

// NOTE: In this implementation, the computer will be locked populating the screen with either color until the entire
//       screen is either black or white.

(OUTERLOOP)
	@SCREEN
	D=A
	@SCREENPTR
	M=D
	@PIXELCOLOR
	M=0
	
	@KBD
	D=M
	
	@SETBLACK
	D;JNE
	
	@INNERLOOP
	0;JMP
//(OUTERLOOP)


(INNERLOOP)
	@PIXELCOLOR
	D=M         // set D-register to pixel color we're using 0 or -1
	
	@SCREENPTR
	A=M         // set A-register to the current value inside the screenptr
	M=D         // set that register's buffer to contain the pixel color (0 or -1)
	
	@SCREENPTR
	M=M+1       // increment the screen pointer so we can point to next register in screen buffer
	D=M
	
	@24575      // fetch constant for the LAST register in the screen buffer, and ensure SCREENPTR-24575 is <= 0 to continue
	D=D-A
	@OUTERLOOP
	D;JGT
@INNERLOOP
0;JMP


(SETBLACK)
	@PIXELCOLOR
	M=-1
	@INNERLOOP
	0;JMP
//(SETBLACK)