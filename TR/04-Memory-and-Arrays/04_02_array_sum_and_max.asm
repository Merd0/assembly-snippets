# ------------------------------------------------------------
# 04_02_array_sum_and_max.asm
# Konu: Dizi uzerinde tek geciste sum + max
# ------------------------------------------------------------

.data
arr:        .word 12, 7, 33, 5, 19, 42, 11
arr_len:    .word 7
msg_sum:    .asciiz "Toplam = "
msg_max:    .asciiz "\nMaksimum = "
newline:    .asciiz "\n"

.text
.globl main

main:
    la   $t0, arr             # t0 = arr base
    lw   $t1, arr_len         # t1 = len

    lw   $t2, 0($t0)          # t2 = max = arr[0]
    li   $t3, 0               # t3 = sum
    li   $t4, 0               # t4 = i

loop_check:
    slt  $t5, $t4, $t1        # i < len ?
    beq  $t5, $zero, loop_end

    sll  $t6, $t4, 2          # offset = i * 4
    add  $t7, $t0, $t6        # addr = base + offset
    lw   $t8, 0($t7)          # val = arr[i]

    add  $t3, $t3, $t8        # sum += val

    slt  $t9, $t2, $t8        # max < val ?
    beq  $t9, $zero, skip_max
    move $t2, $t8             # max = val

skip_max:
    addi $t4, $t4, 1
    j    loop_check

loop_end:
    li   $v0, 4
    la   $a0, msg_sum
    syscall

    li   $v0, 1
    move $a0, $t3
    syscall

    li   $v0, 4
    la   $a0, msg_max
    syscall

    li   $v0, 1
    move $a0, $t2
    syscall

    li   $v0, 4
    la   $a0, newline
    syscall

    li   $v0, 10
    syscall
