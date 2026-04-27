# 08_04_mmio_keyboard_echo.asm
# Asama-08 / Ornek-04
# Amac: MARS MMIO klavyeyi poll edip karakteri ekrana echo etmek
# Cikis kosulu: Enter tusu (ASCII 10)

.data
msg: .asciiz "[08_04] Karakter yaz. Cikmak icin Enter'a bas.\n"
bye: .asciiz "\n[08_04] Echo sonlandi.\n"

.text
.globl main
main:
    li   $v0, 4
    la   $a0, msg
    syscall

    li   $t0, 0xFFFF0000     # Receiver control
    li   $t1, 0xFFFF0004     # Receiver data
    li   $t2, 0xFFFF0008     # Transmitter control
    li   $t3, 0xFFFF000C     # Transmitter data

poll_key:
    lw   $t4, 0($t0)
    andi $t4, $t4, 1
    beq  $t4, $zero, poll_key

    lb   $t5, 0($t1)         # girilen karakteri oku

wait_tx_ready:
    lw   $t6, 0($t2)
    andi $t6, $t6, 1
    beq  $t6, $zero, wait_tx_ready

    sb   $t5, 0($t3)         # karakteri ekrana geri yansit

    li   $t7, 10             # '\n'
    bne  $t5, $t7, poll_key

    li   $v0, 4
    la   $a0, bye
    syscall

    li   $v0, 10
    syscall
