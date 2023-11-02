#pracrticing arrays hehe
# include:
#     display message
#     $s0 for base address$t0 for current element
#     loop counter
#     main,exit,loop label


.data
array: .word 1,2,3,4,5
display: .asciiz "traverse array: "


.text
main:
# $s0 for base address

la $s0, array

#load word of current element
lw $t1,  0($s0)
addi $s0, $s0, 4


#loop counter
li $v0, 1 #print int

move $a0, $t1

syscall 

#add condition
#while counter < 5 increment counter by 1 or 4 bytes

li $t1, 0



j loop

