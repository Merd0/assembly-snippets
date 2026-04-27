# ------------------------------------------------------------
# 04_03_string_length.asm
# Konu: Null-terminated string uzunlugu (strlen mantigi)
# ------------------------------------------------------------

.data
text:       .asciiz "MIPS32 bellek ve string pratigi"
msg_text:   .asciiz "Metin: "
msg_len:    .asciiz "\nUzunluk = "
newline:    .asciiz "\n"

.text
.globl main

main:
    li   $v0, 4
    la   $a0, msg_text
    syscall

    li   $v0, 4
    la   $a0, text
    syscall

    la   $t0, text            # ptr
    li   $t1, 0               # len

len_loop:
    lb   $t2, 0($t0)          # byte oku
    beq  $t2, $zero, len_done # '\0' gorulurse bitir

    addi $t1, $t1, 1          # len++
    addi $t0, $t0, 1          # ptr++
    j    len_loop

len_done:
    li   $v0, 4
    la   $a0, msg_len
    syscall

    li   $v0, 1
    move $a0, $t1
    syscall

    li   $v0, 4
    la   $a0, newline
    syscall

    li   $v0, 10
    syscall
