.data
wVett:   .word 5, 7, 3, 4  # vettore di interi
wResult: .space 4       # variabile risultato

.text
main:
	la $t0, wVett       # carico l'indirizzo base del vettore in un registro
	lw $t1, 0($t0)      # carico il primo elemento del vettore
	
	lw $t2, 4($t0)      # carico il secondo elemento del vettore
	add $t1, $t1, $t2   # aggiungo il primo e il secondo elemento all'accumulatore
	
	lw $t2, 8($t0)      # carico il terzo elemento del vettore
	add $t1, $t1, $t2   # aggiungo il terzo elemento all'accumulatore
	
	lw $t2, 12($t0)     # carico il quarto elemento del vettore
	add $t1, $t1, $t2   # aggiungo il quarto elemento all'accumulatore
	
	sw $t1, wResult     # memorizzo il risultato in wResult
	
	li $v0, 10          # carico valore immediato 10 per uscire dal programma
	syscall             # faccio una chiamata al sistema per uscire dal programma
