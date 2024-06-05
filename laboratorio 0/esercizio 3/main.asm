.data
wOpd1: .word 10
wOpd2: .word 24
wResult: .space 4

.text
main:
    lw $t0, wOpd1
	lw $t1, wOpd2
	
	add $t2, $t0, $t1
	sw $t2, wResult
	
	li $v0, 10
	syscall
