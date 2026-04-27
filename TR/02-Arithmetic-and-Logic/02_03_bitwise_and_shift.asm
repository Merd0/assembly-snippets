# ------------------------------------------------------------
# 02_03_bitwise_and_shift.asm
# Konu: AND/OR/XOR/NOR ve shift islemleri
# Not: MARS syscall 34 -> hex, 35 -> binary
# ------------------------------------------------------------

.data
msg_val:   .asciiz "Deger (hex): 0x"
msg_mask:  .asciiz "\nMask  (hex): 0x"
msg_and:   .asciiz "\nAND   (hex): 0x"
msg_or:    .asciiz "\nOR    (hex): 0x"
msg_xor:   .asciiz "\nXOR   (hex): 0x"
msg_nor:   .asciiz "\nNOR   (hex): 0x"
msg_sll:   .asciiz "\nSLL<<2 (dec): "
msg_srl:   .asciiz "\nSRL>>2 (dec): "
msg_sra:   .asciiz "\nSRA>>2 (dec): "
newline:   .asciiz "\n"

.text
.globl main

main:
    li   $t0, 0x5A            # 0101 1010
    li   $t1, 0x0F            # 0000 1111

    # value (hex)
    li   $v0, 4
    la   $a0, msg_val
    syscall
    li   $v0, 34              # print int in hex (MARS)
    move $a0, $t0
    syscall

    # mask (hex)
    li   $v0, 4
    la   $a0, msg_mask
    syscall
    li   $v0, 34
    move $a0, $t1
    syscall

    # and
    and  $t2, $t0, $t1
    li   $v0, 4
    la   $a0, msg_and
    syscall
    li   $v0, 34
    move $a0, $t2
    syscall

    # or
    or   $t3, $t0, $t1
    li   $v0, 4
    la   $a0, msg_or
    syscall
    li   $v0, 34
    move $a0, $t3
    syscall

    # xor
    xor  $t4, $t0, $t1
    li   $v0, 4
    la   $a0, msg_xor
    syscall
    li   $v0, 34
    move $a0, $t4
    syscall

    # nor
    nor  $t8, $t0, $t1
    li   $v0, 4
    la   $a0, msg_nor
    syscall
    li   $v0, 34
    move $a0, $t8
    syscall

    # shift örnekleri
    sll  $t5, $t0, 2          # x4
    srl  $t6, $t0, 2          # unsigned sağa kaydır
    sra  $t7, $t0, 2          # signed sağa kaydır

    li   $v0, 4
    la   $a0, msg_sll
    syscall
    li   $v0, 1
    move $a0, $t5
    syscall

    li   $v0, 4
    la   $a0, msg_srl
    syscall
    li   $v0, 1
    move $a0, $t6
    syscall

    li   $v0, 4
    la   $a0, msg_sra
    syscall
    li   $v0, 1
    move $a0, $t7
    syscall

    li   $v0, 4
    la   $a0, newline
    syscall

    li   $v0, 10
    syscall
