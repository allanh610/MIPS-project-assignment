.data
prompt: .asciiz "Enter a number (that is >= 25): "
invalid_msg: .asciiz "Illegal Number!\n"
fib_msg: .asciiz "Fibonacci sequence: \n"
comma: .asciiz ",'

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
