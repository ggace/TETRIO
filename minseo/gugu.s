.data

.text


main:
    li $s0, 9
    li $t0, 1
DAN:
    li $t1, 1

    GUGU:
        li $t2, 0
        li $a0, 0
        MUL:
            add $a0, $a0, $t0
            addi $t2, $t2, 1
            blt $t2, $t1, MUL
        li $v0, 1
        syscall
        li $a0, 32
        li $v0, 11
        syscall

        addi $t1, $t1, 1
        
        bgt $t1, $s0, EXIT
        
        j GUGU
        
    EXIT:
        li $a0, 10
        li $v0, 11
        syscall
        addi $t0, $t0, 1


        bgt $t0, $s0, END

        j DAN

END:
    jr $ra
# 프로그램의 끝
