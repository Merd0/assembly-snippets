# 06_04_mixed_integer_float_pipeline.asm
# Asama-06 / Ornek-04
# Amac: integer'i float'a cevirip karma bir ifade hesaplamak
# Formul: sonuc = (int_value + float_value) / 2.0

.data
msg_title:   .asciiz "[06_04] Karma sonuc: "
newline:     .asciiz "\n"
int_value:   .word 9
float_value: .float 4.5
half_const:  .float 2.0

.text
.globl main
main:
    # Baslik yazdir
    li   $v0, 4
    la   $a0, msg_title
    syscall

    # Integer degeri GPR'a yukle
    lw   $t0, int_value

    # Integer bitlerini FPU'ya tasi ve float'a donustur
    mtc1 $t0, $f0            # ham integer bitleri $f0'da
    cvt.s.w $f0, $f0         # $f0 = float(int_value)

    # Float girdileri yukle
    lwc1 $f2, float_value
    lwc1 $f4, half_const

    # sonuc = (f0 + f2) / f4
    add.s $f6, $f0, $f2
    div.s $f8, $f6, $f4

    # Float sonucu yazdir
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
