.data
prompt: .asciiz "Enter a number (that's greater than or equal to 25): "
invalid_msg: .asciiz "Illegal Number!\n"
fib_msg: .asciiz "Fibonacci sequence: \n"
comma: .asciiz ",'

.text
.global main

# Prints a string
print_string:
    li $v0, 4
    syscall
    jr $ra

# Reads an integer from the console
read_int:
    li $v0, 5
