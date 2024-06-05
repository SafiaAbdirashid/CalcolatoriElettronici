.data
        risultato: .space 4
		    g: .byte 255
		    h: .byte 255
		    m: .byte 255
		
.text
.globl main
.ent main

main:
        lbu $t0, g
		    mul $t1, $t0, 24
		    lbu $t0, h
		    addu $t1, $t1, $t0
		    mul $t1, $t1, 60
		    lbu $t0, m
		    addu $t1, $t1, $t0
		
		sw $t1, risultato
		
		li $v0, 10
		syscall
		.end main
		# non si può avere overflow se vengono utilizzati lbu/addu etc.
