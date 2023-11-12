.data
menuPrompt: .asciiz "Main Menu\n(1) Get Letter Grade\n(2) Advanced Math: x^y\n(3) Exit Program\n\nEnter your choice: "
prompt1: .asciiz "Enter your score (0-100): "
resultMessage1: .asciiz "Your letter grade is: "
prompt2: .asciiz "Enter two integers (x and y) for x^y calculation:\nx: "
resultMessage2: .asciiz "Result of x^y is: "
promptY: .asciiz "y: "
invalidChoiceMessage: .asciiz "Invalid choice. Please enter 1, 2, or 3.\n"
 

.text


.globl main

main:
    # Display user menu
    j userMenu

userMenu:
    # Display menu options
    li $v0, 4               # Load system call code for printing string
    la $a0, menuPrompt

    syscall

    # Get user choice
    li $v0, 5               # Load system call code for reading integer
    syscall
    move $t0, $v0           # Store user choice in $t0

    # Branch based on user choice
    beq $t0, 1, getLetterGrade
    beq $t0, 2, advancedMath
    beq $t0, 3, exitProgram
    j invalidChoice

getLetterGrade:
    # Code for Task 1 (same as before)

advancedMath:
    # Prompt user for x
    li $v0, 4               # Load system call code for printing string
    la $a0, prompt2         # Load address of the prompt for x
    syscall

    # Get user input for x
    li $v0, 5               # Load system call code for reading integer
    syscall
    move $t1, $v0           # Store user input for x in $t1

    # Prompt user for y
    li $v0, 4               # Load system call code for printing string
    la $a0, promptY         # Prompt for y
    syscall

    # Get user input for y
    li $v0, 5               # Load system call code for reading integer
    syscall
    move $t2, $v0           # Store user input for y in $t2

    # Initialize result to 1
    li $t3, 1

    # Calculate x^y
    powLoop:
        # Check if loop counter exceeds y
        bge $t3, $t2, powResult

        # Multiply result by x
        mul $t1, $t1, $t1     # Square x
        mul $t3, $t3, $t1     # Multiply result by x

        # Increment loop counter
        addi $t3, $t3, 1

        # Repeat the loop
        j powLoop

    powResult:
    # Display the result of x^y
    li $v0, 4               # Load system call code for printing string
    la $a0, resultMessage2  # Load address of the result message for x^y
    syscall
    li $v0, 1               # Load system call code for printing integer
    move $a0, $t3           # Load result of x^y to be printed
    syscall

    j userMenu

exitProgram:
    # Exit program
    li $v0, 10              # Load system call code for program exit
    syscall

invalidChoice:
    # Display invalid choice message
    li $v0, 4               # Load system call code for printing string
    la $a0, invalidChoiceMessage  # Load address of the message for an invalid choice

    syscall
    j userMenu
