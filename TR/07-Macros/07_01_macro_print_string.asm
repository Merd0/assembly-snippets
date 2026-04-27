# 07_01_macro_print_string.asm
# Asama-07 / Ornek-01
# Amac: basit bir string yazdirma makrosu tanimlayip tekrar kullanmak

.data
msg_a: .asciiz "[07_01] Makro cagrisi A\n"
msg_b: .asciiz "[07_01] Makro cagrisi B\n"

.macro PRINT_STR(%label)
    li $v0, 4
    la $a0, %label
    syscall
.end_macro

.text
.globl main
main:
    PRINT_STR(msg_a)
    PRINT_STR(msg_b)

    li $v0, 10
    syscall
