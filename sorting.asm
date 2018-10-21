.data
num: .word 9, 7, 6, 5
.text
main:
	add $t0, $0, $0    #outerloop counter
	la $t1, num
	addi $t2, $0, 4
	outerloop:
		beq $t2, $t0, end
		add $t3, $zero, $zero   #innerloop counter
		addi $t0, $t0, 1  #updating outerloop_counter 
		la $t1, num
		j innerloop
	
	innerloop:
		beq $t3, 3, outerloop 
		addi $t3, $t3, 1  #updating innerloop_counter
		lw $s1, 0($t1)
		lw $s2, 4($t1)
		
		slt $s3, $s2, $s1
		beq $s3, 1, swap
		add $t1, $t1, 4 #update t1
		j innerloop
		
		
	swap:
		sw $s2, 0($t1)
		sw $s1, 4($t1)
		add $t1, $t1, 4 #update t1
		j innerloop
		
end:
