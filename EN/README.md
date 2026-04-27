# MIPS32 Assembly Learning Roadmap (EN)

This repository provides a **zero-to-expert** MIPS32 Assembly curriculum with practical, simulator-ready examples for MARS/QtSPIM.

## Goal

- Build strong low-level reasoning skills
- Understand register, memory, control-flow, FPU, and system-level behavior
- Practice with clean, heavily-commented code
- Progress from basics to realistic algorithmic projects

## Requirements

- Java (for MARS)
- [MARS MIPS Simulator](http://courses.missouristate.edu/KenVollmar/mars/)
  - Download `mars.jar`
  - Run: `java -jar mars.jar`
- Alternative: QtSPIM / SPIM

## How to Run

1. Open MARS.
2. Load the target `.asm` file.
3. Assemble (F3).
4. Run (F5).

## Curriculum Overview

0. **00-Study-Roadmap** — How to study the repository effectively
1. **01-Hello-MIPS** — Segments, registers, basic syscalls
2. **02-Arithmetic-and-Logic** — Arithmetic, bitwise ops, `mult/div`
3. **03-Control-Flow** — Comparisons, branching, loops
4. **04-Memory-and-Arrays** — `lw/sw`, arrays, string handling
5. **05-Functions-and-Stack** — Functions, `jal/jr`, stack discipline
6. **06-Floating-Point-FPU** — Coprocessor 1, float/double arithmetic
7. **07-Macros** — Reusable macro patterns and code hygiene
8. **08-Interrupts-and-Exceptions** — CP0, exception handler, MMIO polling
9. **09-Mini-Projects** — End-to-end algorithmic exercises

## Directory Tree

```text
EN/
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

> Note: `TR/` remains perfectly symmetric in structure and file naming.

## Study Start

- New here? Start with `00-Study-Roadmap/README.md` before stage 01.
