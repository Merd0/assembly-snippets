# 05-Functions-and-Stack

Bu bölümde MIPS32'de profesyonel fonksiyon yazımını öğrenirsin: `jal/jr`, argüman/sonuç register düzeni, `$ra` koruma ve stack frame yönetimi.

## Bu bölümde ne öğreneceksin?

- `jal` ile fonksiyon çağırma, `jr $ra` ile geri dönme
- `$a0-$a3` ile parametre geçirme, `$v0` ile sonuç döndürme
- Caller-saved / callee-saved register yaklaşımı
- `$sp` ile stack kullanımı ve temel frame düzeni
- Rekürsif çağrılarda `$ra` + local state koruma

## Dosyalar

1. `05_01_jal_jr_basics.asm`
   - En temel fonksiyon çağrı/geri dönüş akışı
2. `05_02_arguments_and_return.asm`
   - 2 parametre alan ve sonuç döndüren fonksiyon
3. `05_03_stack_frame_and_saved_registers.asm`
   - Stack frame, `$ra`, `$s0` saklama/geri yükleme
4. `05_04_recursive_factorial.asm`
   - Rekürsif faktöriyel ile gerçek stack davranışı

## Teknik notlar

- `jal` dönüş adresini `$ra`'ya yazar; nested çağrılarda `$ra` saklanmalıdır.
- Callee-saved register'lar (`$s0-$s7`) fonksiyon içinde değişecekse stack'e kaydedilip geri yüklenmelidir.
- Rekürsiyon = çoklu frame; her frame kendi local state'ini taşır.
- Stack tipik olarak aşağı büyür: `addi $sp, $sp, -N` ile yer açılır.

## Çalıştırma

1. MARS/QtSPIM'de dosyayı aç
2. Assemble (F3)
3. Run (F5)
4. Çıktıyı yorum satırındaki beklenen akışla doğrula

## Sonraki adım

`06-Floating-Point-FPU` bölümünde Coprocessor 1 ve float/double işlemlerine geçeceğiz.
