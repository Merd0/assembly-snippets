# ------------------------------------------------------------
# 05_04_recursive_factorial.asm
# Konu: Rekursif faktoriyel (stack frame pratigi)
# f(n) = n * f(n-1), f(0)=1
# ------------------------------------------------------------

.data
msg_n:      .asciiz "n = "
msg_res:    .asciiz "\nrecursive factorial = "
newline:    .asciiz "\n"

.text
.globl main

main:
    li   $a0, 5               # n = 5
    move $t0, $a0

    jal  factorial            # v0 = factorial(n)
    move $t1, $v0

    li   $v0, 4
    la   $a0, msg_n
    syscall

    li   $v0, 1
    move $a0, $t0
    syscall

    li   $v0, 4
    la   $a0, msg_res
    syscall

    li   $v0, 1
    move $a0, $t1
    syscall

    li   $v0, 4
    la   $a0, newline
    syscall

    li   $v0, 10
    syscall

factorial:
    addi $sp, $sp, -8
    sw   $ra, 4($sp)
    sw   $a0, 0($sp)          # n saklanir

    beq  $a0, $zero, base_case

    addi $a0, $a0, -1
    jal  factorial            # v0 = factorial(n-1)

    lw   $t2, 0($sp)          # orijinal n
    mult $t2, $v0
    mflo $v0                  # v0 = n * factorial(n-1)
    j    fact_end

base_case:
    li   $v0, 1               # factorial(0) = 1

fact_end:
    lw   $ra, 4($sp)
    addi $sp, $sp, 8
    jr   $ra
