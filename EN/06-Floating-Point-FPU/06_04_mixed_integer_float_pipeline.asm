# 06_04_mixed_integer_float_pipeline.asm
# Stage-06 / Example-04
# Purpose: convert integer to float and compute average-like expression
# Formula: result = (int_value + float_value) / 2.0

.data
msg_title:   .asciiz "[06_04] Mixed result: "
newline:     .asciiz "\n"
int_value:   .word 9
float_value: .float 4.5
half_const:  .float 2.0

.text
.globl main
main:
    # Print title
    li   $v0, 4
    la   $a0, msg_title
    syscall

    # Load integer into GPR
    lw   $t0, int_value

    # Move integer bits to FPU and convert to float
    mtc1 $t0, $f0            # raw integer bits now in $f0
    cvt.s.w $f0, $f0         # $f0 = float(int_value)

    # Load float inputs
    lwc1 $f2, float_value
    lwc1 $f4, half_const

    # result = (f0 + f2) / f4
    add.s $f6, $f0, $f2
    div.s $f8, $f6, $f4

    # Print float result
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
