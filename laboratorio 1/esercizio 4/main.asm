.data
var: .word 0x3FFFFFF0

     .text
     .globl main
     .ent main

main:
      #registro in $t1 il doppio del valore di var
      la $t0, var
      lw $t1, ($t0)
      sll $t1, $t1, 1

      #stampo a video
      # li $v0,1
      # lw $a0, ($t0)
      # syscall

      #aggiungo a $t1 il val imm 40, cosa accade? ARITHMETIC OVERFLOW
      #addi $t2, $t1, 40

      #fare stessa cosa,ma porre 40 in $t2 e poi sommare $t1 e $t2
      # li $v0, 1
      # lw $a0, ($t2)
      # syscall

      li $t2, 40
      # utilizzando add c'è ancora overflow, ma se utilizzo addu non c'è più

      addu $a0, $t2, $t1
      li $v0,1
      syscall

      li $v0,10
      syscall
      .end main
