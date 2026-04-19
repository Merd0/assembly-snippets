# MIPS32 Assembly Yol Haritası (TR)

Bu depo, MIPS32 Assembly dilini **sıfırdan uzmanlık seviyesine** taşımayı hedefleyen, aşamalı ve uygulama odaklı bir eğitim müfredatı sunar.

## Amaç

- Düşük seviyeli düşünme becerisini geliştirmek
- CPU, register, bellek ve kontrol akışı mantığını kavratmak
- MARS/SPIM üzerinde doğrudan çalıştırılabilen örneklerle pratik yaptırmak
- Gerçek mini projelerle öğrenilenleri birleştirmek

## Gereksinimler

- Java (MARS için)
- [MARS MIPS Simulator](http://courses.missouristate.edu/KenVollmar/mars/)
  - `mars.jar` dosyasını indir
  - Çalıştır: `java -jar mars.jar`
- Alternatif: QtSPIM / SPIM

## Nasıl Çalıştırılır?

1. MARS'ı aç.
2. İlgili `.asm` dosyasını yükle.
3. **Assemble** (F3) ile derle.
4. **Run** (F5) ile çalıştır.

## Müfredat Özeti

1. **01-Hello-MIPS** — Segmentler, register'lar, temel syscall
2. **02-Arithmetic-and-Logic** — Aritmetik, bit işlemleri, `mult/div`
3. **03-Control-Flow** — Karşılaştırma, dallanma, döngüler
4. **04-Memory-and-Arrays** — `lw/sw`, diziler, string işlemleri
5. **05-Functions-and-Stack** — Fonksiyonlar, `jal/jr`, stack çerçevesi
6. **06-Floating-Point-FPU** — Coprocessor 1, float/double hesaplamalar
7. **07-Macros** — Makro tanımı ve tekrar eden kodu azaltma
8. **08-Interrupts-and-Exceptions** — Coprocessor 0, exception ve MMIO
9. **09-Mini-Projects** — Rekürsif faktöriyel, bubble sort, palindrom

## Klasör Ağacı

```text
TR/
├── 01-Hello-MIPS/
│   ├── README.md
│   └── 01_hello_world.asm
├── 02-Arithmetic-and-Logic/
│   ├── 02_01_integer_arithmetic.asm
│   ├── 02_02_mult_div_lo_hi.asm
│   ├── 02_03_bitwise_and_shift.asm
│   ├── 02_04_expression_pipeline.asm
│   └── README.md
├── 03-Control-Flow/
│   └── README.md
├── 04-Memory-and-Arrays/
│   └── README.md
├── 05-Functions-and-Stack/
│   └── README.md
├── 06-Floating-Point-FPU/
│   └── README.md
├── 07-Macros/
│   └── README.md
├── 08-Interrupts-and-Exceptions/
│   └── README.md
└── 09-Mini-Projects/
    └── README.md
```

> Not: `EN/` klasörü dosya ve yapı açısından birebir simetriktir; yalnızca içerik dili İngilizcedir.
