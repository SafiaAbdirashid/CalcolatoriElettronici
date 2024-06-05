.data
.text
.globl main

main:
	  li $v0, 5          # syscall 5 is get integer. example: t1=5
	  syscall
	  move $t1, $v0      # I save in $t1
	  
	  li $v0, 5          # syscall 5 is get integer. example: t2=3
	  syscall
	  move $t2, $v0      # I save in $t2
	  
	  add $t1, $t1, $t2  # t1= t1+t2= 5+3= 8
	  sub $t2, $t1, $t2  # t2= t1-t2= 8-3= 5
	  sub $t1, $t1, $t2  # t1= t1-t2= 8-5= 3

      li $v0, 10
	  syscall
	  .end main 
