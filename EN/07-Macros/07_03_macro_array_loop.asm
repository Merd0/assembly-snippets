# 07_03_macro_array_loop.asm
# Stage-07 / Example-03
# Purpose: macro-assisted loop over an integer array

.data
arr:     .word 5, 10, 15, 20
arr_len: .word 4
title:   .asciiz "[07_03] Array elements:\n"
newline: .asciiz "\n"

.macro PRINT_INT(%reg)
    move $a0, %reg
    li   $v0, 1
    syscall
.end_macro

.macro PRINT_NL
    li $v0, 4
    la $a0, newline
    syscall
.end_macro

.text
.globl main
main:
    li $v0, 4
    la $a0, title
    syscall

    la $t0, arr          # pointer
    lw $t1, arr_len      # count

loop:
    beq $t1, $zero, done
    lw  $t2, 0($t0)
    PRINT_INT($t2)
    PRINT_NL

    addi $t0, $t0, 4
    addi $t1, $t1, -1
    j loop

done:
    li $v0, 10
    syscall
