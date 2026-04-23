# ------------------------------------------------------------
# 04_03_string_length.asm
# Topic: null-terminated string length (strlen idea)
# ------------------------------------------------------------

.data
text:       .asciiz "MIPS32 memory and string practice"
msg_text:   .asciiz "Text: "
msg_len:    .asciiz "\nLength = "
newline:    .asciiz "\n"

.text
.globl main

main:
    li   $v0, 4
    la   $a0, msg_text
    syscall

    li   $v0, 4
    la   $a0, text
    syscall

    la   $t0, text            # ptr
    li   $t1, 0               # len

len_loop:
    lb   $t2, 0($t0)          # read byte
    beq  $t2, $zero, len_done # stop on '\0'

    addi $t1, $t1, 1          # len++
    addi $t0, $t0, 1          # ptr++
    j    len_loop

len_done:
    li   $v0, 4
    la   $a0, msg_len
    syscall

    li   $v0, 1
    move $a0, $t1
    syscall

    li   $v0, 4
    la   $a0, newline
    syscall

    li   $v0, 10
    syscall
