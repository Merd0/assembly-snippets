# 06-Floating-Point-FPU

Bu aşamada tamsayı ALU işlemlerinden Coprocessor 1 (FPU) ile ondalıklı sayı hesaplamaya geçiyoruz. Hedef; single/double precision, FPU register kullanımı ve karşılaştırma/dallanma akışını doğru şekilde oturtmak.

## Bu bölümde ne öğreneceksin?

- `.float` / `.double` veri tanımlama ve yükleme
- FPU komutlarıyla aritmetik (`add.s`, `mul.s`, `add.d`, `div.d`)
- Syscall ile ondalıklı değer yazdırma (`$v0=2` ve `$v0=3`)
- Ondalıklı karşılaştırma (`c.lt.s`, `c.eq.s`) ve `bc1t/bc1f` dallanması
- `mtc1 + cvt.s.w` ile integer değeri float'a çevirme

## Dosyalar

1. `06_01_float_basics.asm`
   - Single-precision (`.float`) yükleme, hesaplama ve çıktı akışı
2. `06_02_double_precision.asm`
   - Double-precision (`.double`) aritmetik ve yazdırma
3. `06_03_fpu_compare_and_branch.asm`
   - FPU compare komutları + `bc1t/bc1f` dallanma
4. `06_04_mixed_integer_float_pipeline.asm`
   - Int → float dönüşümü ve karma pipeline örneği

## Teknik notlar

- FPU register'ları `$f0-$f31`; double-precision komutlar register çiftleriyle çalışır.
- Single için `lwc1/swc1`, double için `ldc1/sdc1` kullanılır.
- FPU karşılaştırmaları Coprocessor 1 condition flag üretir; branch için `bc1t`/`bc1f` kullanılır.
- Integer ve float register dosyaları ayrıdır; `mtc1/mfc1` ile bit taşıyıp sonra format dönüşümü (`cvt.s.w`, `cvt.w.s` vb.) yapılır.

## Çalıştırma

1. MARS/QtSPIM'de `.asm` dosyasını aç
2. Assemble (F3)
3. Run (F5)
4. Konsol çıktısını yorum satırlarındaki beklenen sonuçlarla karşılaştır

## Sonraki adım

`07-Macros` bölümünde tekrar eden kodu makrolarla sadeleştireceğiz.
