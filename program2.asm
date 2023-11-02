.data
prompt1: .asciiz "Main Menu\n(1) Get letter grade\n(2) Exit Program\n\nEnter '1' or '2' for your selection: "
prompt2: .asciiz "Please enter a score as an integer value: "
gradePrompt: .asciiz "The grade is: "
prompt3: .asciiz "\n---------------------------------------\n\nWould you like to enter a new score?\n(Y) Yes   (N) No\n"

.text
.globl main

main:
    # Call the intro function
    jal intro

    # Exit program
    li $v0, 10             # Load system call code for program exit
    syscall

intro:
    # Print the main menu
    li $v0, 4               # Load system call code for printing string
    la $a0, prompt1         # Load address of the main menu prompt
    syscall

    # Get user input
    li $v0, 5               # Load system call code for reading integer
    syscall
    move $t0, $v0           # Store user input in $t0

    # Branch based on user input
    beq $t0, 1, getGrade    # If user input is 1, call getGrade function
    beq $t0, 2, exitProgram # If user input is 2, exit the program
    j invalidInput          # If user input is neither 1 nor 2, handle as invalid input

getGrade:
    # Prompt user for score
    li $v0, 4               # Load system call code for printing string
    la $a0, prompt2         # Load address of the score prompt
    syscall

    # Get user input for score
    li $v0, 5               # Load system call code for reading integer
    syscall
    move $t1, $v0           # Store user input score in $t1

    # Determine grade based on the score
    li $t2, 90              # Load 90 into $t2 for comparison
    li $t3, 80              # Load 80 into $t3 for comparison
    li $t4, 70              # Load 70 into $t4 for comparison
    li $t5, 60              # Load 60 into $t5 for comparison

    bge $t1, $t2, gradeA    # If score >= 90, assign grade A
    bge $t1, $t3, gradeB    # If score >= 80, assign grade B
    bge $t1, $t4, gradeC    # If score >= 70, assign grade C
    bge $t1, $t5, gradeD    # If score >= 60, assign grade D
    j gradeF                # If score < 60, assign grade F

gradeA:
    li $v0, 4               # Load system call code for printing string
    la $a0, gradePrompt     # Load address of the grade prompt
    syscall
    li $v0, 4               # Load system call code for printing string
    la $a0, "A\n"           # Load address of the grade A message
    syscall
    j continuePrompt

gradeB:
    li $v0, 4               # Load system call code for printing string
    la $a0, gradePrompt     # Load address of the grade prompt
    syscall
    li $v0, 4               # Load system call code for printing string
    la $a0, "B\n"           # Load address of the grade B message
    syscall
    j continuePrompt

gradeC:
    li $v0, 4               # Load system call code for printing string
    la $a0, gradePrompt     # Load address of the grade prompt
    syscall
    li $v0, 4               # Load system call code for printing string
    la $a0, "C\n"           # Load address of the grade C message
    syscall
    j continuePrompt

gradeD:
    li $v0, 4               # Load system call code for printing string
    la $a0, gradePrompt     # Load address of the grade prompt
    syscall
    li $v0, 4               # Load system call code for printing string
    la $a0, "D\n"           # Load address of the grade D message
    syscall
    j continuePrompt

gradeF:
    li $v0, 4               # Load system call code for printing string
    la $a0, gradePrompt     # Load address of the grade prompt
    syscall
    li $v0, 4               # Load system call code for printing string
    la $a0, "F\n"           # Load address of the grade F message
    syscall

continuePrompt:
    # Prompt user to continue
    li $v0, 4               # Load system call code for printing string
    la $a0, prompt3         # Load address of the continue prompt
    syscall

    # Get user choice
    li $v0, 8               # Load system call code for reading string
    la $a0, 10              # Load address to store the user choice (10 characters)
    syscall

    # Check user choice
    lb $t6, 0($a0)          # Load the first character of user input
    li $t7, 'Y'             # Load ASCII value for 'Y'
    beq $t6, $t7, getGrade  # If user chooses 'Y', call getGrade function
    j intro                 # If user chooses 'N', return to the main menu

invalidInput:
    # Print invalid input message
    li $v0, 4               # Load system call code for printing string
    la $a0, "Invalid input, please enter '1' or '2'.\n" # Load address of the invalid input
