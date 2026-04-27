# 07-Macros

Bu aşama, tekrar eden assembly kalıplarını makrolara taşıyarak daha sürdürülebilir kod yazmaya odaklanır. Makroların nerede faydalı olduğunu, nerede risk oluşturduğunu ve okunabilirliği nasıl koruyacağını öğreneceksin.

## Bu bölümde ne öğreneceksin?

- `.macro ... .end_macro` ile makro tanımlama
- Makroya parametre geçirme (`%reg`, `%label`, `%imm`)
- Çıktı/loop gibi tekrar eden işleri yeniden kullanılabilir hale getirme
- Stack frame kurulum/temizleme boilerplate'ini azaltma
- Makro hijyeni: isimlendirme, yan etki, register sahipliği

## Dosyalar

1. `07_01_macro_print_string.asm`
   - Temel string yazdırma makrosu ve tekrar kullanımı
2. `07_02_macro_print_int.asm`
   - Integer yazdırma + newline makroları
3. `07_03_macro_array_loop.asm`
   - Dizi üzerinde dolaşan loop makrosu
4. `07_04_macro_stack_frame_helpers.asm`
   - Fonksiyon prologue/epilogue makroları ile stack disiplini

## Teknik notlar

- Makrolar çalışma anında değil, assemble aşamasında genişletilir.
- Parametre isimlerini açık seçik tut; değiştirilen register'ları yorumla belirt.
- Makrolar tek sorumluluğa sahip olmalı; gizli kontrol akışından kaçın.
- Makrolar tutarlılık sağlar ama geçici register'ları sessizce bozarsa hata gizleyebilir.

## Çalıştırma

1. Dosyayı MARS/QtSPIM'de aç
2. Assemble (F3)
3. Run (F5)
4. Çıktıyı yorum satırlarındaki beklenen davranışla karşılaştır

## Sonraki adım

`08-Interrupts-and-Exceptions` bölümünde Coprocessor 0, exception vektörü ve MMIO polling akışına geçiyoruz.
