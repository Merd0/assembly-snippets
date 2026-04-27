# MIPS32 Assembly Yol Haritası (TR)

Bu depo, MIPS32 Assembly için **sıfırdan uzmanlığa** uzanan, uygulama odaklı ve MARS/QtSPIM üzerinde doğrudan çalıştırılabilir bir eğitim müfredatı sunar.

## Amaç

- Düşük seviyeli düşünme becerisini güçlendirmek
- Register, bellek, kontrol akışı, FPU ve sistem seviyesini birlikte kavratmak
- Temiz, bol yorumlu örneklerle pratik yaptırmak
- Temelden gerçek proje mantığına kadar ilerlemek

## Gereksinimler

- Java (MARS için)
- [MARS MIPS Simulator](http://courses.missouristate.edu/KenVollmar/mars/)
  - `mars.jar` dosyasını indir
  - Çalıştır: `java -jar mars.jar`
- Alternatif: QtSPIM / SPIM

## Nasıl Çalıştırılır?

1. MARS'ı aç.
2. İlgili `.asm` dosyasını yükle.
3. Assemble (F3) ile derle.
4. Run (F5) ile çalıştır.

## Müfredat Özeti

0. **00-Study-Roadmap** — Depoyu nasil verimli calisacagini anlatan rehber
1. **01-Hello-MIPS** — Segmentler, register'lar, temel syscall
2. **02-Arithmetic-and-Logic** — Aritmetik, bit işlemleri, `mult/div`
3. **03-Control-Flow** — Karşılaştırma, dallanma, döngüler
4. **04-Memory-and-Arrays** — `lw/sw`, diziler, string işlemleri
5. **05-Functions-and-Stack** — Fonksiyonlar, `jal/jr`, stack disiplini
6. **06-Floating-Point-FPU** — Coprocessor 1, float/double aritmetiği
7. **07-Macros** — Yeniden kullanılabilir makro kalıpları
8. **08-Interrupts-and-Exceptions** — CP0, exception handler, MMIO polling
9. **09-Mini-Projects** — Uçtan uca algoritma uygulamaları

## Klasör Ağacı

```text
TR/
├── 00-Study-Roadmap/
│   ├── 01_learning_path.md
│   ├── 02_weekly_plan.md
│   ├── 03_practice_checklist.md
│   └── README.md
├── 01-Hello-MIPS/
│   ├── 01_hello_world.asm
│   └── README.md
├── 02-Arithmetic-and-Logic/
│   ├── 02_01_integer_arithmetic.asm
│   ├── 02_02_mult_div_lo_hi.asm
│   ├── 02_03_bitwise_and_shift.asm
│   ├── 02_04_expression_pipeline.asm
│   └── README.md
├── 03-Control-Flow/
│   ├── 03_01_slt_and_branch.asm
│   ├── 03_02_if_else.asm
│   ├── 03_03_while_loop_sum.asm
│   ├── 03_04_for_loop_countdown.asm
│   └── README.md
├── 04-Memory-and-Arrays/
│   ├── 04_01_lw_sw_basics.asm
│   ├── 04_02_array_sum_and_max.asm
│   ├── 04_03_string_length.asm
│   ├── 04_04_byte_and_word_access.asm
│   └── README.md
├── 05-Functions-and-Stack/
│   ├── 05_01_jal_jr_basics.asm
│   ├── 05_02_arguments_and_return.asm
│   ├── 05_03_stack_frame_and_saved_registers.asm
│   ├── 05_04_recursive_factorial.asm
│   └── README.md
├── 06-Floating-Point-FPU/
│   ├── 06_01_float_basics.asm
│   ├── 06_02_double_precision.asm
│   ├── 06_03_fpu_compare_and_branch.asm
│   ├── 06_04_mixed_integer_float_pipeline.asm
│   └── README.md
├── 07-Macros/
│   ├── 07_01_macro_print_string.asm
│   ├── 07_02_macro_print_int.asm
│   ├── 07_03_macro_array_loop.asm
│   ├── 07_04_macro_stack_frame_helpers.asm
│   └── README.md
├── 08-Interrupts-and-Exceptions/
│   ├── 08_01_cp0_snapshot.asm
│   ├── 08_02_break_exception_handler.asm
│   ├── 08_03_overflow_exception.asm
│   ├── 08_04_mmio_keyboard_echo.asm
│   └── README.md
└── 09-Mini-Projects/
    └── README.md
```

> Not: `EN/` klasörü yapı ve dosya isimleri açısından birebir simetriktir.

## Nereden Baslamali?

- Yeni basliyorsan asama 01 oncesi `00-Study-Roadmap/README.md` dosyasini oku.
