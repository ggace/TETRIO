.data
	
.text

fibo:
	addi $sp, $sp, -12 # save
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $a1, 8($sp)

	slti $t0, $a0, 2 # compare
	bne $t0, $zero, L1 

	addi $a0, $a0, -1
	jal fibo
	add $a1, $v0, $zero
	sw $a1, 8($sp)
	# lw $a0, 4($sp)
	addi $a0, $a0, -1
	jal fibo
	lw $a1, 8($sp)
	add $v0, $v0, $a1

	j EXIT

L1:
	li $v0, 1 # return 1

EXIT:
	lw $ra, 0($sp) # tmp
	lw $a0, 4($sp)
	lw $a1, 8($sp)
	addi $sp, $sp, 12
	jr $ra

main:
	addi $sp, $sp, -4 # save
	sw $ra, 0($sp)

	li $v0, 5
	syscall
	add $a0, $v0, $zero
	jal fibo
	lw $ra, 0($sp)

	add $a0, $v0, $zero
	li $v0, 1
	syscall

	jr $ra