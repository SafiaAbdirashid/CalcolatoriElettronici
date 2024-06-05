.data
	msgPalindromo: .asciiz "palindromo: si\n"
	msgNonPalindromo: .ascii "palindromo: no\n"
	msgNoInput: .asciiz "no input\n"
	
.text
.globl main
.ent main

main:
	li $t1, -1
	
	inputLoop:
		li $v0, 12
		syscall
		add $t0, $v0, $0
		addi $sp, $sp, -4
		addi $t1, $t1, 1
		sw $t0, ($sp)
		bne $t0, '\n', inputLoop
	beq $t1, 0, noInput
	beq $t1, 1, siPalindromo
	li $t2, 0
	li $t4, 0
	addi $sp, $sp, 4
	sll $t3, $t1, 2
	srl $t1, $t1, 1
	addi $t3, $t3, -4
	add $t5, $t3, $0
	ifPalindromo:
		lw $t0, ($sp)
		
		sub $sp, $sp, $t2
		add $sp, $sp, $t5
		lw $t6, ($sp)
		
		bne $t0, $t6, noPalindromo
		
		sub $sp, $sp, $t5
		addi $t5, $t5, -4
		addi $t2, $t2, 4
		add $sp, $sp, $t2
		
		addi $t4, $t4, 1
		
		bne $t4, $t1, ifPalindromo
	siPalindromo:
		li $v0, 4
		la $a0, msgPalindromo
		syscall
		j fine
		
	noInput:
		li $v0, 4
		la $a0, msgNoInput
		syscall
		j fine
		
	noPalindromo:
		li $v0, 4
		la $a0, msgNonPalindromo
		syscall
		j fine
		
	fine:
		li $v0, 10
		syscall
		.end main
