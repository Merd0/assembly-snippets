# 08_01_cp0_snapshot.asm
# Stage-08 / Example-01
# Purpose: read CP0 Status/Cause/EPC and print raw integer values

.data
msg_status: .asciiz "[08_01] Status: "
msg_cause:  .asciiz "\n[08_01] Cause : "
msg_epc:    .asciiz "\n[08_01] EPC   : "
newline:    .asciiz "\n"

.text
.globl main
main:
    mfc0 $t0, $12            # Status
    mfc0 $t1, $13            # Cause
    mfc0 $t2, $14            # EPC

    li   $v0, 4
    la   $a0, msg_status
    syscall
    move $a0, $t0
    li   $v0, 1
    syscall

    li   $v0, 4
    la   $a0, msg_cause
    syscall
    move $a0, $t1
    li   $v0, 1
    syscall

    li   $v0, 4
    la   $a0, msg_epc
    syscall
    move $a0, $t2
    li   $v0, 1
    syscall

    li   $v0, 4
    la   $a0, newline
    syscall

    li   $v0, 10
    syscall
