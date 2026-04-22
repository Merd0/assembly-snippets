# ------------------------------------------------------------
# 03_02_if_else.asm
# Konu: if-else yapisi (beq, bne, j)
# Senaryo: skor >= 50 ise GECTI, degilse KALDI
# ------------------------------------------------------------

.data
msg_score:  .asciiz "Skor: "
msg_pass:   .asciiz " -> GECTI\n"
msg_fail:   .asciiz " -> KALDI\n"

.text
.globl main

main:
    li   $t0, 47             # skor
    li   $t1, 50             # esik

    li   $v0, 4
    la   $a0, msg_score
    syscall

    li   $v0, 1
    move $a0, $t0
    syscall

    # t2 = (skor < esik)
    slt  $t2, $t0, $t1

    # t2 == 1 ise fail'e git
    bne  $t2, $zero, else_fail

if_pass:
    li   $v0, 4
    la   $a0, msg_pass
    syscall
    j    end_if

else_fail:
    li   $v0, 4
    la   $a0, msg_fail
    syscall

end_if:
    li   $v0, 10
    syscall
