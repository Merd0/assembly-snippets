# ------------------------------------------------------------
# 05_02_arguments_and_return.asm
# Topic: argument passing ($a0,$a1) and return value ($v0)
# ------------------------------------------------------------

.data
msg_res:    .asciiz "(13 * 4) + 7 = "
newline:    .asciiz "\n"

.text
.globl main

main:
    li   $a0, 13              # x
    li   $a1, 4               # y

    jal  mul_add_seven        # v0 <- (x*y)+7
    move $t1, $v0             # preserve result before syscalls

    li   $v0, 4
    la   $a0, msg_res
    syscall

    move $a0, $t1             # print result
    li   $v0, 1
    syscall

    li   $v0, 4
    la   $a0, newline
    syscall

    li   $v0, 10
    syscall

mul_add_seven:
    mult $a0, $a1             # LO = x*y
    mflo $t0
    addi $v0, $t0, 7          # return (x*y)+7
    jr   $ra
