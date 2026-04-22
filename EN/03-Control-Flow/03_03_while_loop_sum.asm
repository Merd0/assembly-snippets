# ------------------------------------------------------------
# 03_03_while_loop_sum.asm
# Topic: while loop simulation
# Goal: compute sum of 1..N
# ------------------------------------------------------------

.data
msg_n:      .asciiz "N = "
msg_sum:    .asciiz "\nSum of 1..N = "
newline:    .asciiz "\n"

.text
.globl main

main:
    li   $t0, 10             # N
    li   $t1, 1              # i = 1
    li   $t2, 0              # sum = 0

    li   $v0, 4
    la   $a0, msg_n
    syscall

    li   $v0, 1
    move $a0, $t0
    syscall

while_check:
    # while (i <= N)  <=>  !(N < i)
    slt  $t3, $t0, $t1       # N < i ?
    bne  $t3, $zero, while_end

    add  $t2, $t2, $t1       # sum += i
    addi $t1, $t1, 1         # i++
    j    while_check

while_end:
    li   $v0, 4
    la   $a0, msg_sum
    syscall

    li   $v0, 1
    move $a0, $t2
    syscall

    li   $v0, 4
    la   $a0, newline
    syscall

    li   $v0, 10
    syscall
