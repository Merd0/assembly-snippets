# ------------------------------------------------------------
# 04_01_lw_sw_basics.asm
# Topic: word-level memory access with lw/sw
# ------------------------------------------------------------

.data
value_a:    .word 100
value_b:    .word 250
result:     .word 0
msg_res:    .asciiz "value_a + value_b = "
newline:    .asciiz "\n"

.text
.globl main

main:
    lw   $t0, value_a         # t0 = value_a
    lw   $t1, value_b         # t1 = value_b

    add  $t2, $t0, $t1        # t2 = a + b
    sw   $t2, result          # write result to memory

    li   $v0, 4
    la   $a0, msg_res
    syscall

    lw   $a0, result
    li   $v0, 1
    syscall

    li   $v0, 4
    la   $a0, newline
    syscall

    li   $v0, 10
    syscall
