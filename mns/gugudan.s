.data
	values: .word 1, 10
.text

main:
	la $t0, values
	lw $s0, 0($t0) # now
	lw $s1, 4($t0) # maxdan
L3:
	li $v0, 11       # syscall 11: print_char
	li $a0, 10       # ASCII 10 = '\n'
	syscall
	addi $s0, $s0, 1
	beq $s0, $s1, L1

	add $s2, $s0, $zero # n
	li $s3, 0 # i
	li $s4, 0 # sum
	li $s5, 10 # k
	L2:
		addi $s3, $s3, 1
		beq $s3, $s5, L3
		add $s4, $s4, $s2
		li $v0, 1
		add $a0, $s4, $zero
		syscall
		li $v0, 11
		li $a0, 32
		syscall
		j L2
L1:
	jr $ra