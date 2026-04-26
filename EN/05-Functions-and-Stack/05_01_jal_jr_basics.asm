# ------------------------------------------------------------
# 05_01_jal_jr_basics.asm
# Topic: basic function call using jal and jr
# ------------------------------------------------------------

.data
msg_before: .asciiz "main: calling function\n"
msg_func:   .asciiz "hello_func: hello\n"
msg_after:  .asciiz "main: returned from function\n"

.text
.globl main

main:
    li   $v0, 4
    la   $a0, msg_before
    syscall

    jal  hello_func           # call hello_func, return address in $ra

    li   $v0, 4
    la   $a0, msg_after
    syscall

    li   $v0, 10
    syscall

hello_func:
    li   $v0, 4
    la   $a0, msg_func
    syscall

    jr   $ra                  # return to caller
