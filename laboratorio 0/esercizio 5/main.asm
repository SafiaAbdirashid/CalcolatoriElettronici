.data
wVett: .word 5, 7, 3, 4
wResult: .space 4

.text
main:
    li $t1, 0
	la $t0, wVett
	li $t3, 4
	
loop:
    lw $t2, 0($t0)
    add $t1, $t1, $t2
	addi $t0, $t0, 4
	addi $t3, $t3, -1
	bnez $t3, loop
	sw $t1, wResult
	
	li $v0, 10
	syscall
