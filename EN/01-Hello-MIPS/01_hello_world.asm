# ------------------------------------------------------------
# 01_hello_world.asm
# Goal: Run a first MIPS32 program using .data/.text segments,
#       core registers, and basic syscalls.
# Compatibility: MARS and SPIM
# ------------------------------------------------------------

.data                           # Begin data segment
hello_msg: .asciiz "Hello MIPS32 world!\n"       # Text to print (null-terminated)
number_msg: .asciiz "Sample number: "             # Prefix text before integer output
sample_num: .word 42                              # 32-bit integer stored in memory

.text                           # Begin code segment
.globl main                     # Export entry label for simulator/linker

main:
    li   $v0, 4                 # Syscall 4: print string
    la   $a0, hello_msg         # $a0 <- address of string to print
    syscall                     # Invoke OS service

    li   $v0, 4                 # Syscall 4: print string
    la   $a0, number_msg        # $a0 <- address of "Sample number: "
    syscall                     # Print the prefix text

    lw   $a0, sample_num        # $a0 <- load sample_num value from memory (42)
    li   $v0, 1                 # Syscall 1: print integer
    syscall                     # Print integer value

    li   $a0, 10                # ASCII 10 = '\n' newline character
    li   $v0, 11                # Syscall 11: print character
    syscall                     # Print newline

    li   $v0, 10                # Syscall 10: exit program
    syscall                     # Terminate cleanly
