# ------------------------------------------------------------
# 05_01_jal_jr_basics.asm
# Konu: jal ve jr ile temel fonksiyon cagrisi
# ------------------------------------------------------------

.data
msg_before: .asciiz "main: fonksiyon cagrilacak\n"
msg_func:   .asciiz "hello_func: merhaba\n"
msg_after:  .asciiz "main: fonksiyondan donuldu\n"

.text
.globl main

main:
    li   $v0, 4
    la   $a0, msg_before
    syscall

    jal  hello_func           # hello_func cagrilir, donus adresi $ra'da

    li   $v0, 4
    la   $a0, msg_after
    syscall

    li   $v0, 10
    syscall

hello_func:
    li   $v0, 4
    la   $a0, msg_func
    syscall

    jr   $ra                  # cagiran noktaya don
