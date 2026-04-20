# 03-Control-Flow

Bu bölümde MIPS32'de program akışını nasıl yöneteceğini öğrenirsin: karşılaştırma, dallanma, koşullar ve döngüler.

## Bu bölümde ne öğreneceksin?

- `slt` ile karşılaştırma sonucu üretme
- `beq`, `bne`, `j` ile branch/jump mekanizması
- if-else bloklarını label tabanlı kurma
- while ve for döngülerini assembly seviyesinde simüle etme

## Dosyalar

1. `03_01_slt_and_branch.asm`
   - `slt` + `beq/bne` ile temel karar verme
2. `03_02_if_else.asm`
   - if-else akışını label ve jump ile kurma
3. `03_03_while_loop_sum.asm`
   - while döngüsü ile 1..N toplamı
4. `03_04_for_loop_countdown.asm`
   - for mantığıyla geri sayım ve akış kontrolü

## Teknik notlar

- Branch komutları PC-relative çalışır; hedef label assembler tarafından hesaplanır.
- `slt rd, rs, rt` sonucu: `rs < rt` ise `rd=1`, değilse `rd=0`.
- Döngü tasarımı için net bir şablon kullan:
  1. init
  2. condition check
  3. body
  4. increment/decrement
  5. jump back

## Çalıştırma

1. Dosyayı MARS/SPIM'de aç
2. Assemble (F3)
3. Run (F5)
4. Çıktıyı yorum satırlarındaki beklenen akışla karşılaştır

## Sonraki adım

`04-Memory-and-Arrays` bölümünde bellek erişimi (`lw/sw`) ve dizi gezinmeye geçeceğiz.
