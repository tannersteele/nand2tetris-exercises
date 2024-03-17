// sum=sum+other, then clear 'other' register
@sum
D=M
@other
D=D+M
@sum
M=D
@other
D=0
M=D