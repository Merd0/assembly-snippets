# ------------------------------------------------------------
# 01_hello_world.asm
# Amaç: MIPS32'de .data/.text segmentleri, temel register'lar
#       ve syscall kullanımıyla ilk programı çalıştırmak.
# Uyum: MARS ve SPIM
# ------------------------------------------------------------

.data                           # Veri segmenti başlangıcı
hello_msg: .asciiz "Merhaba MIPS32 dunyasi!\n"   # Yazdırılacak metin (null-terminated)
number_msg: .asciiz "Ornek sayi: "                # Sayıdan önceki metin
sample_num: .word 42                              # Bellekte tutulan 32-bit tamsayı

.text                           # Kod segmenti başlangıcı
.globl main                     # Linker/simülatör için giriş etiketini görünür yap

main:
    li   $v0, 4                 # Syscall kodu 4: string yazdır
    la   $a0, hello_msg         # $a0 <- yazdırılacak string'in adresi
    syscall                     # İşletim sistemi servisini çağır

    li   $v0, 4                 # Syscall kodu 4: string yazdır
    la   $a0, number_msg        # $a0 <- "Ornek sayi: " metninin adresi
    syscall                     # Metni konsola yaz

    lw   $a0, sample_num        # $a0 <- sample_num değerini bellekten yükle (42)
    li   $v0, 1                 # Syscall kodu 1: integer yazdır
    syscall                     # 42 değerini konsola yaz

    li   $a0, 10                # ASCII 10 = '\n' (yeni satır)
    li   $v0, 11                # Syscall kodu 11: tek karakter yazdır
    syscall                     # Satır sonu karakterini yaz

    li   $v0, 10                # Syscall kodu 10: programdan çıkış
    syscall                     # Programı güvenli şekilde sonlandır
