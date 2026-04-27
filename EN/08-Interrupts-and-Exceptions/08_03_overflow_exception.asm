# 08_03_overflow_exception.asm
# Stage-08 / Example-03
# Purpose: demonstrate arithmetic overflow exception handling

.data
msg_ok:   .asciiz "[08_03] Overflow exception captured by handler.\n"
msg_fail: .asciiz "[08_03] Overflow handler flag missing.\n"

.text
.globl main
main:
    li   $s1, 0              # handler writes 1 on overflow

    li   $t0, 2147483647     # INT_MAX
    li   $t1, 1
    add  $t2, $t0, $t1       # signed overflow -> exception

    # If execution reaches here, handler already returned past the add
    beq  $s1, 1, handled

not_handled:
    li   $v0, 4
    la   $a0, msg_fail
    syscall
    j    done

handled:
    li   $v0, 4
    la   $a0, msg_ok
    syscall

done:
    li   $v0, 10
    syscall

.ktext 0x80000180
overflow_handler:
    mfc0 $k0, $14            # EPC
    addiu $k0, $k0, 4        # skip faulting instruction
    mtc0 $k0, $14

    li   $s1, 1
    eret
