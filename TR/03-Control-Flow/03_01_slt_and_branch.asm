# ------------------------------------------------------------
# 03_01_slt_and_branch.asm
# Konu: slt + beq/bne ile temel karar mekanizmasi
# ------------------------------------------------------------

.data
msg_x:      .asciiz "x = "
msg_y:      .asciiz ", y = "
msg_less:   .asciiz "\nSonuc: x < y\n"
msg_not:    .asciiz "\nSonuc: x >= y\n"

.text
.globl main

main:
    li   $t0, 14             # x
    li   $t1, 20             # y

    # x ve y degerlerini yazdir
    li   $v0, 4
    la   $a0, msg_x
    syscall

    li   $v0, 1
    move $a0, $t0
    syscall

    li   $v0, 4
    la   $a0, msg_y
    syscall

    li   $v0, 1
    move $a0, $t1
    syscall

    # t2 = (x < y) ? 1 : 0
    slt  $t2, $t0, $t1

    # eger t2 == 0 ise x<y degil
    beq  $t2, $zero, not_less

less_case:
    li   $v0, 4
    la   $a0, msg_less
    syscall
    j    done

not_less:
    li   $v0, 4
    la   $a0, msg_not
    syscall

done:
    li   $v0, 10
    syscall
