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

(CHECKINPUT)
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
	
	@FILLSCREEN
	0;JMP
//(CHECKINPUT)


(SETBLACK)      // this JMP is a bit redundant, but helps illustrate how "scope" isn't a concept here
	@PIXELCOLOR
	M=-1
	@FILLSCREEN
	0;JMP
//(SETBLACK)


(FILLSCREEN)
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
	@CHECKINPUT
	D;JGT
@FILLSCREEN
0;JMP