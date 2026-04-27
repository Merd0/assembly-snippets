# 07_02_macro_print_int.asm
# Asama-07 / Ornek-02
# Amac: integer cikti makrolariyla cagirilan kodu sade tutmak

.data
title:   .asciiz "[07_02] Degerler: "
newline: .asciiz "\n"

.macro PRINT_INT(%reg)
    move $a0, %reg
    li   $v0, 1
    syscall
.end_macro

.macro PRINT_NL
    li $v0, 4
    la $a0, newline
    syscall
.end_macro

.text
.globl main
main:
    li $v0, 4
    la $a0, title
    syscall

    li $t0, 21
    li $t1, 34

    PRINT_INT($t0)
    PRINT_NL
    PRINT_INT($t1)
    PRINT_NL

    li $v0, 10
    syscall
