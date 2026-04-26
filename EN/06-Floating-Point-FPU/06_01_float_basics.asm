# 06_01_float_basics.asm
# Stage-06 / Example-01
# Purpose: single-precision arithmetic on Coprocessor 1 (FPU)

.data
msg_title: .asciiz "[06_01] Float result (x * y + z): "
newline:   .asciiz "\n"
x:         .float 1.5        # x
y:         .float 2.0        # y
z:         .float 4.25       # z

.text
.globl main
main:
    # Print title
    li   $v0, 4
    la   $a0, msg_title
    syscall

    # Load x, y, z into FPU registers
    lwc1 $f0, x              # $f0 = x
    lwc1 $f2, y              # $f2 = y
    lwc1 $f4, z              # $f4 = z

    # Compute: (x * y) + z
    mul.s $f6, $f0, $f2      # $f6 = x * y
    add.s $f8, $f6, $f4      # $f8 = (x * y) + z

    # Print float result (syscall 2 expects value in $f12)
    mov.s $f12, $f8
    li    $v0, 2
    syscall

    # Newline
    li   $v0, 4
    la   $a0, newline
    syscall

    # Exit
    li   $v0, 10
    syscall
