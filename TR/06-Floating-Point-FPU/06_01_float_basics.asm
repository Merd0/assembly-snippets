# 06_01_float_basics.asm
# Asama-06 / Ornek-01
# Amac: Coprocessor 1 (FPU) ile single-precision aritmetik

.data
msg_title: .asciiz "[06_01] Float sonuc (x * y + z): "
newline:   .asciiz "\n"
x:         .float 1.5        # x
y:         .float 2.0        # y
z:         .float 4.25       # z

.text
.globl main
main:
    # Baslik yazdir
    li   $v0, 4
    la   $a0, msg_title
    syscall

    # x, y, z degerlerini FPU register'larina yukle
    lwc1 $f0, x              # $f0 = x
    lwc1 $f2, y              # $f2 = y
    lwc1 $f4, z              # $f4 = z

    # Hesap: (x * y) + z
    mul.s $f6, $f0, $f2      # $f6 = x * y
    add.s $f8, $f6, $f4      # $f8 = (x * y) + z

    # Float sonucu yazdir (syscall 2 degeri $f12'de bekler)
    mov.s $f12, $f8
    li    $v0, 2
    syscall

    # Yeni satir
    li   $v0, 4
    la   $a0, newline
    syscall

    # Cikis
    li   $v0, 10
    syscall
