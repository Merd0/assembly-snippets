# 07_04_macro_stack_frame_helpers.asm
# Stage-07 / Example-04
# Purpose: function prologue/epilogue helpers via macros

.data
msg:     .asciiz "[07_04] square(7) = "
newline: .asciiz "\n"

.macro FUNC_ENTER
    addi $sp, $sp, -8
    sw   $ra, 4($sp)
    sw   $s0, 0($sp)
.end_macro

.macro FUNC_EXIT
    lw   $s0, 0($sp)
    lw   $ra, 4($sp)
    addi $sp, $sp, 8
    jr   $ra
.end_macro

.text
.globl main
main:
    li $v0, 4
    la $a0, msg
    syscall

    li   $a0, 7
    jal  square

    move $a0, $v0
    li   $v0, 1
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
    syscall

square:
    FUNC_ENTER
    move $s0, $a0
    mul  $v0, $s0, $s0
    FUNC_EXIT
