# ------------------------------------------------------------
# 03_02_if_else.asm
# Topic: if-else structure (beq, bne, j)
# Scenario: if score >= 50 => PASS, else => FAIL
# ------------------------------------------------------------

.data
msg_score:  .asciiz "Score: "
msg_pass:   .asciiz " -> PASS\n"
msg_fail:   .asciiz " -> FAIL\n"

.text
.globl main

main:
    li   $t0, 47             # score
    li   $t1, 50             # threshold

    li   $v0, 4
    la   $a0, msg_score
    syscall

    li   $v0, 1
    move $a0, $t0
    syscall

    # t2 = (score < threshold)
    slt  $t2, $t0, $t1

    # if t2 == 1 then go fail branch
    bne  $t2, $zero, else_fail

if_pass:
    li   $v0, 4
    la   $a0, msg_pass
    syscall
    j    end_if

else_fail:
    li   $v0, 4
    la   $a0, msg_fail
    syscall

end_if:
    li   $v0, 10
    syscall
