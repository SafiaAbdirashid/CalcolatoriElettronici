.data
      pari: .asciiz "\nNumero pari\n"
	  dispari: .asciiz "\nNumero dispari\n"
	  

.text
.globl main
.ent main

main:
      li $v0, 5
	  syscall
	  move $t0, $v0
	  
	  sll $t1, $t0, 31  # shifto tutto di 31 bit cosi rimane solo l'ultimo
	  
	  beq $t1, 0, stampaPari # controllo: se l'ultimo è 0 è pari, se è 1 è dispari
	  
	  stampaDispari:
	               li $v0,4
				   la $a0, dispari
				   syscall
				   j fine
				   
	  stampaPari:
	               li $v0,4
				   la $a0, pari
				   syscall
				   
				   
	  fine:
	  
	  li $v0, 10
	  syscall
	  .end main
