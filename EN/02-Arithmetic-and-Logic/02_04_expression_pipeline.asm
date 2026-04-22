# ------------------------------------------------------------
# 02_04_expression_pipeline.asm
# Topic: Combining arithmetic + bit logic in one pipeline
# Target expression:
#   y = ((x + 3) * 5) ^ 0x0F
# ------------------------------------------------------------

.data
msg_x:   .asciiz "x = "
msg_y:   .asciiz "\ny = ((x + 3) * 5) ^ 0x0F = "
msg_hex: .asciiz "\nhex(y) = 0x"
endl:    .asciiz "\n"

.text
.globl main

main:
    li   $t0, 9              # x = 9

    # print x
    li   $v0, 4
    la   $a0, msg_x
    syscall
    li   $v0, 1
    move $a0, $t0
    syscall

    # t1 = x + 3
    addi $t1, $t0, 3

    # t2 = t1 * 5  => (t1 << 2) + t1
    sll  $t2, $t1, 2
    add  $t2, $t2, $t1

    # y = t2 ^ 0x0F
    xori $t3, $t2, 0x0F

    # decimal y
    li   $v0, 4
    la   $a0, msg_y
    syscall
    li   $v0, 1
    move $a0, $t3
    syscall

    # hex y (MARS)
    li   $v0, 4
    la   $a0, msg_hex
    syscall
    li   $v0, 34
    move $a0, $t3
    syscall

    li   $v0, 4
    la   $a0, endl
    syscall

    li   $v0, 10
    syscall
