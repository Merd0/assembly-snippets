# 06_03_fpu_compare_and_branch.asm
# Stage-06 / Example-03
# Purpose: compare two float values and branch with bc1t/bc1f

.data
msg_less:    .asciiz "[06_03] x is less than y\n"
msg_notless: .asciiz "[06_03] x is NOT less than y\n"
x:           .float 3.25
y:           .float 7.00

.text
.globl main
main:
    # Load operands
    lwc1 $f0, x
    lwc1 $f2, y

    # Set FP condition flag if (x < y)
    c.lt.s $f0, $f2

    # Branch on FP condition true
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
