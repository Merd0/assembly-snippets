# ------------------------------------------------------------
# 05_03_stack_frame_and_saved_registers.asm
# Konu: Stack frame + $ra / $s0 saklama
# ------------------------------------------------------------

.data
msg_res:    .asciiz "lineer ifade sonucu = "
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
    addi $sp, $sp, -8         # stack frame ac
    sw   $ra, 4($sp)          # ra sakla
    sw   $s0, 0($sp)          # s0 sakla (callee-saved)

    move $s0, $a0             # s0 = x (fonksiyon boyunca kullan)

    # t0 = 3*x = x + x + x
    add  $t0, $s0, $s0
    add  $t0, $t0, $s0

    # t1 = 2*y
    add  $t1, $a1, $a1

    # v0 = t0 + t1 + 5
    add  $v0, $t0, $t1
    addi $v0, $v0, 5

    lw   $s0, 0($sp)          # s0 geri yukle
    lw   $ra, 4($sp)          # ra geri yukle
    addi $sp, $sp, 8          # frame kapat

    jr   $ra
