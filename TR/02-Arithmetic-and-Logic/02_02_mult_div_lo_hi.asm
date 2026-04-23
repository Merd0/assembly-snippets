# ------------------------------------------------------------
# 02_02_mult_div_lo_hi.asm
# Konu: mult/div ve HI-LO register'ları
# ------------------------------------------------------------

.data
msg_mul:     .asciiz "27 * 13 = "
msg_hi:      .asciiz " (HI = "
msg_div_q:   .asciiz ")\n100 / 9 bolum = "
msg_div_r:   .asciiz ", kalan = "
msg_end:     .asciiz "\n"

.text
.globl main

main:
    # -----------------------------
    # Carpma: 27 * 13
    # -----------------------------
    li   $t0, 27
    li   $t1, 13
    mult $t0, $t1            # 64-bit sonuc HI:LO'ya gider

    mflo $t2                 # LO -> alt 32-bit (sonucun düşük kısmı)
    mfhi $t3                 # HI -> üst 32-bit

    li   $v0, 4
    la   $a0, msg_mul
    syscall

    li   $v0, 1
    move $a0, $t2            # carpim sonucu
    syscall

    li   $v0, 4
    la   $a0, msg_hi
    syscall

    li   $v0, 1
    move $a0, $t3            # HI degeri
    syscall

    # -----------------------------
    # Bolme: 100 / 9
    # -----------------------------
    li   $t4, 100
    li   $t5, 9
    div  $t4, $t5            # LO=bolum, HI=kalan

    mflo $t6                 # bolum
    mfhi $t7                 # kalan

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
