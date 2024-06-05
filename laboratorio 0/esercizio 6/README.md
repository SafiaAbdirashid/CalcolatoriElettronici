- Lettura da tastiera e visualizzazione a video di un vettore di 5 caratteri
- Registri
– $t0. Indirizzo Vettore
– $t1. Contatore
– Syscall ($v0=1).Print integer($a0 = integer)
– Syscall ($v0=4).Print string ($a0 = string)
– Syscall ($v0=5).Get integer ($v0 = integer)
- Tipo asciiz - NULL terminated ASCII string
– .asciiz "Inserire numeri\n"
- Il NULL è un carattere ASCII non stampabile e viene utilizzato per contrassegnare la fine della stringa. La terminazione NULL è standard ed è richiesta dal servizio di sistema della stringa di stampa (per funzionare correttamente).
- Get Integer, si chiude con un ENTER
- Non viene eseguito nessun controllo su tipo di carattere inserito ( ovvero se corrisponde ad una cifra numerica)
– li $v0, 5
– syscall #(result in $v0)
– sw $v0, ($t0)
