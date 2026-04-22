# 02-Arithmetic-and-Logic

Bu bölüm, MIPS32'de sayısal düşüncenin temelini atar: toplama/çıkarma, `mult/div` ile LO/HI kullanımı ve bit düzeyinde manipülasyon.

## Bu bölümde ne öğreneceksin?

- `add`, `addi`, `sub` ile tamsayı aritmetiği
- `mult`, `div`, `mflo`, `mfhi` ile çarpma/bölme sonucu yönetimi
- `and`, `or`, `xor`, `nor`, `sll`, `srl`, `sra` ile bit işlemleri
- Syscall ile integer/hex/binary formatta çıktı alma

## Dosyalar

1. `02_01_integer_arithmetic.asm`
   - Temel toplama/çıkarma, sabit ile işlem, sonuç yazdırma
2. `02_02_mult_div_lo_hi.asm`
   - Çarpma ve bölmede LO/HI register akışı
3. `02_03_bitwise_and_shift.asm`
   - Masking, bayrak set/clear/toggle, shift işlemleri
4. `02_04_expression_pipeline.asm`
   - Birden fazla aritmetik+mantık adımını tek akışta birleştiren mini örnek

## Teknik notlar (mühendis gözüyle)

- `add/sub` overflow trap üretebilir; güvenli senaryolarda `addu/subu` da tercih edilebilir.
- `mult` sonucu 64-bit olarak **HI:LO** çiftine yazılır.
- `div` için:
  - bölüm (quotient) → `LO`
  - kalan (remainder) → `HI`
- Shift ile `x * 2^n` ve `x / 2^n` optimizasyonu yapılabilir.

## Çalıştırma

1. MARS'ta ilgili dosyayı aç
2. Assemble (F3)
3. Run (F5)
4. Konsol çıktısını beklenen sonuçlarla karşılaştır

## Sonraki adım

`03-Control-Flow` bölümünde bu işlemleri koşul ve döngülerle birleştireceğiz.
