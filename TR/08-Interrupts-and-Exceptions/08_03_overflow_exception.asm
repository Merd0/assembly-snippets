# 08_03_overflow_exception.asm
# Asama-08 / Ornek-03
# Amac: aritmetik overflow exception yakalama akisini gostermek

.data
msg_ok:   .asciiz "[08_03] Overflow exception handler tarafindan yakalandi.\n"
msg_fail: .asciiz "[08_03] Overflow handler bayragi gorulemedi.\n"

.text
.globl main
main:
    li   $s1, 0              # handler overflow olunca 1 yapacak

    li   $t0, 2147483647     # INT_MAX
    li   $t1, 1
    add  $t2, $t0, $t1       # signed overflow -> exception

    # Buraya gelinirse handler 'add' komutunu atlatarak donmustur
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
    addiu $k0, $k0, 4        # hata veren komutu atla
    mtc0 $k0, $14

    li   $s1, 1
    eret
