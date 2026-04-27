# 08-Interrupts-and-Exceptions

Bu aşama sistem seviyesinde akışı anlatır: Coprocessor 0 durumu, exception vektörü ve memory-mapped I/O polling. Odak, kontrolün normal akıştan nasıl çıkıp güvenli şekilde geri döndüğünü pratikte görmektir.

## Bu bölümde ne öğreneceksin?

- `mfc0` ile CP0 register'larını (`Status`, `Cause`, `EPC`) okuma
- `.ktext 0x80000180` adresinde exception handler yazımı
- `eret` ile exception'dan güvenli dönüş
- Overflow/trap kaynaklı exception akışını anlama
- MARS MMIO klavye/ekran register polling

## Dosyalar

1. `08_01_cp0_snapshot.asm`
   - Seçilmiş CP0 register değerlerini okuyup yazdırma
2. `08_02_break_exception_handler.asm`
   - `break` exception tetikleyip kernel tarafında ele alma
3. `08_03_overflow_exception.asm`
   - Aritmetik overflow exception yolunu gösterme
4. `08_04_mmio_keyboard_echo.asm`
   - MMIO klavye polling + ekrana echo döngüsü

## Teknik notlar

- MARS'ta exception giriş adresi tipik olarak `0x80000180`'dir.
- `eret`, `EPC` adresine dönüş yapar (handler akışına göre gerekirse ayarlanır).
- Handler kodunu kısa ve deterministik tut; yan etkileri minimumda bırak.
- MARS MMIO adresleri:
  - Receiver control: `0xFFFF0000`
  - Receiver data: `0xFFFF0004`
  - Transmitter control: `0xFFFF0008`
  - Transmitter data: `0xFFFF000C`

## Çalıştırma

1. Dosyayı MARS'ta aç
2. Assemble (F3)
3. Run (F5)
4. MMIO örneğinde MARS içindeki Keyboard and Display MMIO aracını aç

## Sonraki adım

`09-Mini-Projects` aşamasında önceki tüm bölümleri gerçek algoritmalarda birleştireceksin.
