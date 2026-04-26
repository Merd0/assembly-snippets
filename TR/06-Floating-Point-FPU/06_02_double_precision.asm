# 06_02_double_precision.asm
# Asama-06 / Ornek-02
# Amac: double-precision aritmetik ve cikti

.data
msg_title: .asciiz "[06_02] Double sonuc ((a+b)/c): "
newline:   .asciiz "\n"
a:         .double 10.0      # a
b:         .double 5.5       # b
c:         .double 3.0       # c

.text
.globl main
main:
    # Baslik yazdir
    li   $v0, 4
    la   $a0, msg_title
    syscall

    # Double degerleri yukle (her biri register ciftini kullanir)
    ldc1 $f0, a              # $f0/$f1 = a
    ldc1 $f2, b              # $f2/$f3 = b
    ldc1 $f4, c              # $f4/$f5 = c

    # Hesap: (a + b) / c
    add.d $f6, $f0, $f2      # $f6 = a + b
    div.d $f8, $f6, $f4      # $f8 = (a + b) / c

    # Double sonucu yazdir (syscall 3 degeri $f12/$f13'te bekler)
    mov.d $f12, $f8
    li    $v0, 3
    syscall

    # Yeni satir
    li   $v0, 4
    la   $a0, newline
    syscall

    # Cikis
    li   $v0, 10
    syscall
