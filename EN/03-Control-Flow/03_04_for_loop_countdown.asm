# ------------------------------------------------------------
# 03_04_for_loop_countdown.asm
# Topic: for loop simulation
# Goal: countdown from 5 to 1
# ------------------------------------------------------------

.data
msg_title:  .asciiz "Countdown (for): "
msg_space:  .asciiz " "
msg_done:   .asciiz "\nDone.\n"

.text
.globl main

main:
    li   $v0, 4
    la   $a0, msg_title
    syscall

    # for (i=5; i>0; i--)
    li   $t0, 5              # i = 5

for_check:
    slt  $t1, $zero, $t0     # 0 < i ?
    beq  $t1, $zero, for_end

    li   $v0, 1
    move $a0, $t0
    syscall

    li   $v0, 4
    la   $a0, msg_space
    syscall

    addi $t0, $t0, -1        # i--
    j    for_check

for_end:
    li   $v0, 4
    la   $a0, msg_done
    syscall

    li   $v0, 10
    syscall
