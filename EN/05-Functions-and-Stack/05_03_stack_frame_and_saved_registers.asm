# ------------------------------------------------------------
# 05_03_stack_frame_and_saved_registers.asm
# Topic: stack frame + saving $ra / $s0
# ------------------------------------------------------------

.data
msg_res:    .asciiz "linear expression result = "
newline:    .asciiz "\n"

.text
.globl main

main:
    li   $a0, 6               # x
    li   $a1, 9               # y

    jal  calc_linear          # v0 = 3*x + 2*y + 5
    move $t0, $v0

    li   $v0, 4
    la   $a0, msg_res
    syscall

    li   $v0, 1
    move $a0, $t0
    syscall

    li   $v0, 4
    la   $a0, newline
    syscall

    li   $v0, 10
    syscall

calc_linear:
    addi $sp, $sp, -8         # open stack frame
    sw   $ra, 4($sp)          # save ra
    sw   $s0, 0($sp)          # save s0 (callee-saved)

    move $s0, $a0             # s0 = x (used across function)

    # t0 = 3*x = x + x + x
    add  $t0, $s0, $s0
    add  $t0, $t0, $s0

    # t1 = 2*y
    add  $t1, $a1, $a1

    # v0 = t0 + t1 + 5
    add  $v0, $t0, $t1
    addi $v0, $v0, 5

    lw   $s0, 0($sp)          # restore s0
    lw   $ra, 4($sp)          # restore ra
    addi $sp, $sp, 8          # close frame

    jr   $ra
