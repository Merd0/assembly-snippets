# 06_03_fpu_compare_and_branch.asm
# Asama-06 / Ornek-03
# Amac: iki float degeri karsilastirip bc1t/bc1f ile dallanmak

.data
msg_less:    .asciiz "[06_03] x, y'den kucuktur\n"
msg_notless: .asciiz "[06_03] x, y'den kucuk DEGIL\n"
x:           .float 3.25
y:           .float 7.00

.text
.globl main
main:
    # Operantlari yukle
    lwc1 $f0, x
    lwc1 $f2, y

    # (x < y) ise FP condition flag set et
    c.lt.s $f0, $f2

    # FP condition true ise dallan
    bc1t less_path

not_less_path:
    li   $v0, 4
    la   $a0, msg_notless
    syscall
    j    done

less_path:
    li   $v0, 4
    la   $a0, msg_less
    syscall

done:
    li   $v0, 10
    syscall
