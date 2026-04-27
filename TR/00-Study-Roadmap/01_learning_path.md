# 01 - Ogrenme Yolu (Sifirdan Guclu Pratik Seviyeye)

## Baslangic seviyesi secimi

Kendine en yakin seviyeyi sec:

- **Seviye A (Sifir):** Assembly ve mimari tarafi yeni.
- **Seviye B (Temel):** Yuksek seviyeli diller var, MIPS detayi yok.
- **Seviye C (Yenileme):** Daha once gordun ama duzenli tekrar istiyorsun.

## Asama sirasi (atlama yapma)

1. `01-Hello-MIPS` -> segmentler, syscall, register rolleri
2. `02-Arithmetic-and-Logic` -> integer aritmetik, HI/LO, bit islemleri
3. `03-Control-Flow` -> kosullar, dallanma, dongu cevirimi
4. `04-Memory-and-Arrays` -> adresleme, dizi, string
5. `05-Functions-and-Stack` -> calling convention, stack frame, rekursiyon
6. `06-Floating-Point-FPU` -> single/double islemler
7. `07-Macros` -> tekrar eden kodu kontrollu soyutlama
8. `08-Interrupts-and-Exceptions` -> CP0, exception vector, MMIO
9. `09-Mini-Projects` -> tum konulari birlestirme

## Ilerleme kurallari

- Yorumlara bakmadan mevcut asamayi anlatamiyorsan bir sonraki asamaya gecme.
- Her asamada en az bir ornegi hafizadan tekrar yaz.
- Sabitleri/girdileri degistir, calistirmadan once sonucu tahmin et.
- Sık yaptigin hatalari kisa bir “hata notu” dosyasina yaz.

## Asama gecis kriteri (minimum)

Bir asama biter sayilir, eger:

- O asamadaki tum dosyalar calisiyor.
- Register ve veri akislarini satir satir anlatabiliyorsun.
- En az bir kucuk gelistirme ekledin (ek branch, yeni degisken, ekstra cikti vb.).
- Bilerek koydugun en az bir hatayi debug ederek duzelttin.
