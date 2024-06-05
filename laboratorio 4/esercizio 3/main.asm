.data
        v0: .word 1, 2, 3, 4
        v1: .word 1, 2, 4, 45
				res: .space 64
				newLine: .asciiz "\n"
				space: .asciiz " "
		
.text
.globl main
.ent main

main:
    la $t0, v0
		la $t1, v1
		la $t2, res
		
		li $t3, 0
		li $t4, 0
		
		add $t5, $t0, $0
		add $t6, $t1, $0
		
		loop0:
		        lw $t7, ($t5)
						loop1:
				        lw $t8, ($t6)
								mul $t8, $t8, $t7
						
								mul $t9, $t3, 16
								mul $s0, $t4, 4
								add $t9, $t9, $s0
								add $t9, $t9, $t2
						
								li $v0, 1
								add $a0, $t8, $0
								syscall
								li $v0, 4
								la $a0, space
								syscall
						
								sw $t8, ($t9)
						
								addi $t4, $t4, 1
								addi $t6, $t6, 4
						
								bne $t4, 4, loop1
				
						li $v0, 4
						la $a0, newLine
						syscall
				
						li $t4, 0
						add $t6, $t1, $0
				
						addi $t3, $t3, 1
						addi $t5, $t5, 4
						bne $t3, 4, loop0
				
		li $t3, 0
		li $t4, 0
		
		printLoop1:
		        printLoop2:
				        mul $t9, $t3, 16
								mul $s0, $t4, 4
								add $t9, $t9, $s0
								add $t9, $t9, $t2
						
								lw $t0, ($t9)
						
								li $v0, 1
								add $a0, $t0, $0
								syscall
								li $v0, 4
								la $a0, space
								syscall
						
								addi $t4, $t4, 1
								bne $t4, 4, printLoop2
				
				li $v0, 4
				la $a0, newLine
				syscall
				addi $t3, $t3, 1
				li $t4, 0
				bne $t3, 4, printLoop1
				
		li $v0, 10
		syscall
		.end main
