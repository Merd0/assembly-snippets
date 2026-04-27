# 08_02_break_exception_handler.asm
# Stage-08 / Example-02
# Purpose: trigger BREAK, handle exception in .ktext, then continue

.data
msg_ok:   .asciiz "[08_02] BREAK exception handled successfully.\n"
msg_fail: .asciiz "[08_02] Handler flag was not set.\n"

.text
.globl main
main:
    li   $s0, 0              # handler will set this to 1
    break 0                  # force exception

    beq  $s0, 1, handled

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
exception_handler:
    # Skip the faulting instruction so we do not re-enter exception
    mfc0 $k0, $14            # EPC
    addiu $k0, $k0, 4
    mtc0 $k0, $14

    li   $s0, 1              # visible to user code after return
    eret
