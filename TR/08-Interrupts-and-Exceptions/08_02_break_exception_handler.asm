# 08_02_break_exception_handler.asm
# Asama-08 / Ornek-02
# Amac: BREAK exception tetikleyip .ktext handler ile devam etmek

.data
msg_ok:   .asciiz "[08_02] BREAK exception basariyla yakalandi.\n"
msg_fail: .asciiz "[08_02] Handler bayragi set edilmedi.\n"

.text
.globl main
main:
    li   $s0, 0              # handler bunu 1 yapacak
    break 0                  # exception tetikle

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
    # Hata veren komutu atla ki tekrar exception'a girmeyelim
    mfc0 $k0, $14            # EPC
    addiu $k0, $k0, 4
    mtc0 $k0, $14

    li   $s0, 1              # user alanda kontrol edilecek bayrak
    eret
