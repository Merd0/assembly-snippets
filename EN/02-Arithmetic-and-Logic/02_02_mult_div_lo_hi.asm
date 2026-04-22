# ------------------------------------------------------------
# 02_02_mult_div_lo_hi.asm
# Topic: mult/div and HI-LO registers
# ------------------------------------------------------------

.data
msg_mul:     .asciiz "27 * 13 = "
msg_hi:      .asciiz " (HI = "
msg_div_q:   .asciiz ")\n100 / 9 quotient = "
msg_div_r:   .asciiz ", remainder = "
msg_end:     .asciiz "\n"

.text
.globl main

main:
    # -----------------------------
    # Multiplication: 27 * 13
    # -----------------------------
    li   $t0, 27
    li   $t1, 13
    mult $t0, $t1            # 64-bit result written to HI:LO

    mflo $t2                 # LO -> lower 32 bits (low part)
    mfhi $t3                 # HI -> upper 32 bits

    li   $v0, 4
    la   $a0, msg_mul
    syscall

    li   $v0, 1
    move $a0, $t2            # product value
    syscall

    li   $v0, 4
    la   $a0, msg_hi
    syscall

    li   $v0, 1
    move $a0, $t3            # HI value
    syscall

    # -----------------------------
    # Division: 100 / 9
    # -----------------------------
    li   $t4, 100
    li   $t5, 9
    div  $t4, $t5            # LO=quotient, HI=remainder

    mflo $t6                 # quotient
    mfhi $t7                 # remainder

    li   $v0, 4
    la   $a0, msg_div_q
    syscall

    li   $v0, 1
    move $a0, $t6
    syscall

    li   $v0, 4
    la   $a0, msg_div_r
    syscall

    li   $v0, 1
    move $a0, $t7
    syscall

    li   $v0, 4
    la   $a0, msg_end
    syscall

    li   $v0, 10
    syscall
