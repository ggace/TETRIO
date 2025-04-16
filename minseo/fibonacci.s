.data
    
.text

func:

    #프롤로그
    addi $sp, $sp, -16
    sw $a0, 0($sp)
    sw $ra, 4($sp)
    
    # a0 < 2
    slti $t0, $a0, 2
    bne $t0, $zero, BREAK

    #func(a0-1)
    addi $a0, $a0, -1
    jal func
    
    # t0=  func(a0-1)
    sw $v0, 8($sp)

    #원상복귀
    lw $a0, 0($sp)

    #func(a0-2)
    addi $a0, $a0, -2
    jal func

    #원상복귀
    lw $a0, 0($sp)

    # t1 = func(a0-2)
    sw $v0, 12($sp)

    # t0 = t0 + t1
    lw $t0, 8($sp)
    lw $t1, 12($sp)
    add $v0, $t0, $t1

    lw $ra, 4($sp)

    j EXIT

BREAK: 
    li $v0, 1
EXIT:
    addi $sp, $sp, 16
    jr $ra

main:
    #프롤로그
    addi $sp, $sp, -8
    sw $ra, 4($sp)

    li $v0, 5
    syscall

    add $a0, $zero, $v0
    jal func

    add $a0, $v0, $zero
    li $v0, 1
    syscall
    li $v0, 11
    li $a0, 10
    syscall
	
    lw $ra, 4($sp)
	addi $sp, $sp, 8
    jr $ra


# 프로그램의 끝
