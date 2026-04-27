# 07_01_macro_print_string.asm
# Stage-07 / Example-01
# Purpose: define and reuse a simple string-print macro

.data
msg_a: .asciiz "[07_01] Macro call A\n"
msg_b: .asciiz "[07_01] Macro call B\n"

.macro PRINT_STR(%label)
    li $v0, 4
    la $a0, %label
    syscall
.end_macro

.text
.globl main
main:
    PRINT_STR(msg_a)
    PRINT_STR(msg_b)

    li $v0, 10
    syscall
