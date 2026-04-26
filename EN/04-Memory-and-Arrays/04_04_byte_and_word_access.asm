# ------------------------------------------------------------
# 04_04_byte_and_word_access.asm
# Topic: demonstrating byte and word access together
# ------------------------------------------------------------

.data
bytes:      .byte 65, 66, 67, 68      # A B C D
word_val:   .word 0x11223344
msg_b0:     .asciiz "bytes[0] ASCII = "
msg_b2:     .asciiz "\nbytes[2] ASCII = "
msg_w:      .asciiz "\nword_val (hex) = 0x"
newline:    .asciiz "\n"

.text
.globl main

main:
    la   $t0, bytes

    lb   $t1, 0($t0)          # 'A' = 65
    lb   $t2, 2($t0)          # 'C' = 67

    li   $v0, 4
    la   $a0, msg_b0
    syscall

    li   $v0, 1
    move $a0, $t1
    syscall

    li   $v0, 4
    la   $a0, msg_b2
    syscall

    li   $v0, 1
    move $a0, $t2
    syscall

    lw   $t3, word_val

    li   $v0, 4
    la   $a0, msg_w
    syscall

    li   $v0, 34              # MARS: print hex
    move $a0, $t3
    syscall

    li   $v0, 4
    la   $a0, newline
    syscall

    li   $v0, 10
    syscall
