# 04-Memory-and-Arrays

Bu bölümde MIPS32'de bellek modelini gerçek anlamda kullanmaya başlıyoruz: `lw/sw`, pointer aritmetiği, dizi gezinme ve string işlemleri.

## Bu bölümde ne öğreneceksin?

- Word seviyesinde bellek erişimi (`lw`, `sw`)
- Byte seviyesinde erişim (`lb`, `sb`) ve ASCII ile çalışma
- Dizi üzerinde indeks/pointer tabanlı gezinme
- Null-terminated string için karakter karakter tarama

## Dosyalar

1. `04_01_lw_sw_basics.asm`
   - Belleğe word yazma/okuma ve register-bellek akışı
2. `04_02_array_sum_and_max.asm`
   - Dizide tek geçişte toplam + maksimum hesaplama
3. `04_03_string_length.asm`
   - String uzunluğunu `lb` ile bulma (strlen mantığı)
4. `04_04_byte_and_word_access.asm`
   - Byte ve word erişimini aynı örnekte karşılaştırma

## Teknik notlar

- MIPS32'de word erişimi için adresin 4-byte hizalı olması gerekir.
- Dizi elemanı adresi genel formül: `base + index * element_size`.
- String döngülerinde çıkış koşulu çoğunlukla `0` (null terminator) kontrolüdür.
- `lb` işaret genişletir; unsigned ihtiyacı için `lbu` kullanılabilir.

## Çalıştırma

1. Dosyayı MARS/QtSPIM'de aç
2. Assemble (F3)
3. Run (F5)
4. Konsol çıktısını yorumlarla karşılaştır

## Sonraki adım

`05-Functions-and-Stack` bölümünde fonksiyon çağrıları, `jal/jr`, `$ra` koruma ve stack frame tasarımına geçeceğiz.
