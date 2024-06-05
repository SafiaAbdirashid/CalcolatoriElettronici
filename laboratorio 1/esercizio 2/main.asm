.data

var1:  .byte 'm'
var2:  .byte 'i'
var3:  .byte 'p'
var4:  .byte 's'
var5:  .byte 0

       .text
       .globl main
       .ent main

main:  
       li $t0, 'A'
       li $t1, 'a'
       sub $t0, $t0, $t1

       # prima variabile
       lb $t1, var1
       add $t1, $t1, $t0
       sb $t1, var1

       # seconda variabile
       lb $t2, var2
       add $t2, $t2, $t0
       sb $t2, var2

       # terza variabile
       lb $t3, var3
       add $t3, $t3, $t0
       sb $t3, var3

       # quarta variabile
       lb $t4, var4
       add $t4, $t4, $t0
       sb $t4, var4

       lb $t5, var5 # per capire la fine della stringa

       # stampo stringa usando system call 4
       li $v0, 4
       la $a0, var1
       syscall

       li $v0, 10
       syscall
       .end main
