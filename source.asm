.data
prompt: .asciiz "Enter a number (that is >= 25): "
invalid_msg: .asciiz "Illegal Number!\n"
fib_msg: .asciiz "Fibonacci sequence: \n"
comma: .asciiz ","

.text
.globl main

# Prints a string
print_string:
    li $v0, 4
    syscall
    jr $ra

# Reads an integer from the console
read_int:
    li $v0, 5
    syscall
    jr $ra

# Main program
main:                  # Prompts the user for an input   
    la $a0, prompt
    jal print_string

input_loop:            # Reads integer "N" from user
    jal read_int
    move $t0, $v0

    # Checks if N is legal
    li $t1, 25
    blt $t0, $t1, illegal

    # If N is legal, goes to next step
    j fibonacci_sequence

illegal:			   # Prints error message
    la $a0, invalid_msg
    jal print_string

    la $a0, prompt
    jal print_string

    j input_loop

fibonacci_sequence:   # Prints the first numbers in the Fibonacci sequence
    li $t2, 0
    li $t3, 1
    li $t4, 2

    # Prints 0 and 1 separately
    la $a0, fib_msg
    jal print_string

    li $v0, 1
    move $a0, $t2
    syscall

    la $a0, comma
    jal print_string

    li $v0, 1
    move $a0, $t3
    syscall

fib_loop:
    bge $t4, $t0, end_fib
