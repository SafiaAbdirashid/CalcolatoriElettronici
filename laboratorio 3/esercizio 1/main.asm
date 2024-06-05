.data
    msg: .asciiz "\nCifra\n"
	
.text
.globl main
.ent main

main:
	j input # salta a funzione input
	
	checkGreater:
	                bge $t0, '0', printOk  # va a printOk se il valore in $t0>=0 (num)
					        j continue # salta a funzione continue
	printOk:
	        li $v0, 4 # stampa stringa
			    la $a0, msg #load address del messaggio in $a0
			    syscall # syscall per stampare la stringa in $a0
			    j continue
			
			
	input:
	        li $v0, 12 # leggo carattere da tastiera
		     	syscall
			    add $t0, $v0, $0 # copia valore in $v0 e lo salva in $t0
			    ble $t0, '9', checkGreater # va a checkGreater se $t0<=9 (è una cifra)
			    continue:
			    bne $t0, '\n',input # va a input se $t0!='\n'
					
	li $v0, 10
	syscall
	.end main
