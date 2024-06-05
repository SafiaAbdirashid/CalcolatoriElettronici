.data
               DIM = 4
wVet:	        .space 20
wRes:         .space 4
message_in:   .asciiz "Inserire numeri:\n"
message_out:  .ascii "Valore minimo: "


              .text
              .globl main
              .ent main


main: 
              la $t0, wVet
			        li $t1, 0
			   
			        la $a0, message_in
     			    li $v0, 4
			        syscall
uno:           
              li $v0, 5
              syscall
			        sw $v0, ($t0)
			        beq $t1, DIM, calc
			        add $t1, $t1, 1
			        add $t0, $t0, 4
			        j uno
calc:
             la $t0, wVet
			       li $t1, 0
			       lw $t2, ($t0)
loop_min:
             beq $t1, DIM, print_num
			       lw $t3, ($t0)
			       blt $t3, $t2, change_min
			       add $t1, $t1, 1
			       add $t0, $t0, 4
			       j loop_min
change_min:
             lw $t2, ($t0)
			       j loop_min
			   
print_num:
             la $a0, message_out
			       li $v0, 4
			       syscall
			   
			       li $v0,1
			       move $a0, $t2
			       syscall
fine:
             nop
			   
			       li $v0, 10
			       syscall
			       .end main
