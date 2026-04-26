# 06_02_double_precision.asm
# Stage-06 / Example-02
# Purpose: double-precision arithmetic and output

.data
msg_title: .asciiz "[06_02] Double result ((a+b)/c): "
newline:   .asciiz "\n"
a:         .double 10.0      # a
b:         .double 5.5       # b
c:         .double 3.0       # c

.text
.globl main
main:
    # Print title
    li   $v0, 4
    la   $a0, msg_title
    syscall

    # Load double values (each occupies a register pair)
    ldc1 $f0, a              # $f0/$f1 = a
    ldc1 $f2, b              # $f2/$f3 = b
    ldc1 $f4, c              # $f4/$f5 = c

    # Compute: (a + b) / c
    add.d $f6, $f0, $f2      # $f6 = a + b
    div.d $f8, $f6, $f4      # $f8 = (a + b) / c

    # Print double result (syscall 3 expects value in $f12/$f13)
    mov.d $f12, $f8
    li    $v0, 3
    syscall

    # Newline
    li   $v0, 4
    la   $a0, newline
    syscall

    # Exit
    li   $v0, 10
    syscall
