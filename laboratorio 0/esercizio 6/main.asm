.data
     dim = 5
     vector: .space 20
     scritta: .asciiz "Inserire numeri\n"

.text
.globl main
.ent main

main:
    li $v0, 4                 # syscall code per printare una stringa
	  la $a0, scritta           # carico l'indirizzo della scritta in $a0
	  syscall
	
	  la $t0, vector            # salvo in $t0 l'indirizzo del primo elemento del vettore
	  and $t1, $0, $0           # $t1=indice
	
    input:
          li $v0, 5           # codice per il syscall: Get Integer
		      syscall            
		      sw $v0, ($t0)       # scrivo nella cella i-esima il valore che è stato inserito nella console
		      addi $t0, $t0, 4    # passo alla prossima cella
		      addi $t1, $t1, 1    # incremento indice
		      bne $t1, 5, input   # se t1 è minore di 5, torno a input
	
	la $t0, vector
	and $t1, $0, $0
	
	output:
	       li $v0, 1           # codice per syscall: print_integer
		     lw $a0, ($t0)       # scrivo in $a0 il contenuto della cella i-esima del vettore
		     syscall
		     addi $t0, $t0, 4    # vado nella cella successiva
		     addi $t1, $t1, 1    # incremento indice
		     bne $t1, 5, output  # se t1 è minore di 5, torno a output
	
	
	li $v0, 10
	syscall
	.end main
