- La system call 1 scrive in output un numero intero con segno, compreso fra -231 e 231 - 1.
- Volendo stampare un intero unsigned su 32 bit, non è possibile utilizzare tale system call
– Che valore è visualizzato se il numero è un intero senza segno compreso fra 232 e 232 – 1?
- Data una variabile di tipo word in memoria inizializzata a 3141592653, si realizzi un programma che ne stampi il valore in output.
- Il programma deve scrivere le singole cifre tramite la system call 11.

Implementazione

- Si utilizza un algoritmo in due passi:
    1. Scomposizione del numero nelle sue cifre tramite divisioni successive per 10, salvando i resti e
       ripetendo l’operazione sul quoziente sino a che questo è diverso da zero
    2. Visualizzazione dei resti in ordine inverso a quello di generazione, utilizzando lo stack
- N.B.: le cifre devono essere convertite in caratteri ASCII prima della stampa.
