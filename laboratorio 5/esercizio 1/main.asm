.data
    a: .word 3141592653
	
.text
.globl main
.ent main

main:
    la $t0, a
	lw $t0, ($t0)
	
	li $t1, 10
	li $t3, 0
	loop:
		divu $t0, $t1
		mfhi $t2
		mflo $t0
		addi $t3, 1
		addi $sp, $sp, -4
		sw $t2, 0($sp)
		bne $t0, 0, loop
		
	li $t4, 0
	printLoop:
		lw $t0, 0($sp)
		addi $sp, $sp, 4
		addi $t0, $t0, 48
		li $v0, 11
		add $a0, $t0, $0
		syscall
		addi $t4, $t4, 1
		bne $t4, $t3, printLoop
	li $v0, 10
	syscall
	.end main
