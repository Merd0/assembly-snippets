# ------------------------------------------------------------
# 02_01_integer_arithmetic.asm
# Konu: Temel tamsayı aritmetiği (add, addi, sub)
# Uyum: MARS / SPIM
# ------------------------------------------------------------

.data
msg_a:      .asciiz "a = "
msg_b:      .asciiz ", b = "
msg_sum:    .asciiz "\na + b = "
msg_diff:   .asciiz "\na - b = "
msg_plus10: .asciiz "\na + 10 = "
newline:    .asciiz "\n"

.text
.globl main

main:
    li   $t0, 25             # a = 25
    li   $t1, 7              # b = 7

    # a yazdır
    li   $v0, 4
    la   $a0, msg_a
    syscall

    li   $v0, 1
    move $a0, $t0
    syscall

    # b yazdır
    li   $v0, 4
    la   $a0, msg_b
    syscall

    li   $v0, 1
    move $a0, $t1
    syscall

    # sum = a + b
    add  $t2, $t0, $t1
    li   $v0, 4
    la   $a0, msg_sum
    syscall

    li   $v0, 1
    move $a0, $t2
    syscall

    # diff = a - b
    sub  $t3, $t0, $t1
    li   $v0, 4
    la   $a0, msg_diff
    syscall

    li   $v0, 1
    move $a0, $t3
    syscall

    # plus10 = a + 10 (immediate)
    addi $t4, $t0, 10
    li   $v0, 4
    la   $a0, msg_plus10
    syscall

    li   $v0, 1
    move $a0, $t4
    syscall

    li   $v0, 4
    la   $a0, newline
    syscall

    li   $v0, 10
    syscall
