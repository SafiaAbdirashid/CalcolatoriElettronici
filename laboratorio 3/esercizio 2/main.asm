.data 
        msg: .asciiz "\nOverflow\n"


.text
.globl main
.ent main

main:
		add $t1, $0, $0
		li $t2, 0
		li $t3, 10
		
		j input  # salta e va a input
		
		overflow:
		            li $v0, 4  # vogliamo fare una syscall per stampare una stringa
					      la $a0, msg
					      syscall
					      j fine  # salta a fine
					
		checkGreater:
		            bge $t0, '0', printOk  # va a printOk se $t0>='0'
				      	j continue  # salta a continue
					
		printOk:
		        addi $t0, $t0, -48  # converte da ASCII  a valore numerico
				    multu $t2, $t3
			    	mflo $t2  # nel low order mette i 32 bit della moltiplicazione in $t2
				    mfhi $t5  # nel high order mette i 32 bit della molt in $t5
			    	bne $t5, $0, overflow  # va a overflow se $t5!=0
				    add $t1, $t2, $t0  # aggiunge il vaore $t0 a $t2 e li salva in $t1
				    add $t2, $t1, $0  # $t2=$t1+$0
				    j continue
				
		input:
		        li $v0, 12  # legge un char
				    syscall
				    add $t0, $v0, $0  # copia $v0 in $t0
				    ble $t0, '9', checkGreater  # if $t0<='9' va a checkGreater
				    continue:
				        bne $t0, '\n', input  # if $t0!='\n' va a input
						
		li $v0, 1  # stampa int
		add $a0, $t1, $0  # $a0= $t1, $0
		syscall
		
		fine:
		        li $v0, 10
				    syscall
				    .end main
