.data
       op1:   .byte 150
       op2:   .byte 100

.text
.globl main
.ent main

main:
       lbu $t0, op1  # 150= 1001 0110 se signed diventa c2 quindi un numero negativo
       lb $t1, op2   # 100= 0110 0100
       add $a0, $t0, $t1

       li $v0, 1
       syscall

       li $v0, 10
       syscall
       .end main
