# MIPS32 Assembly Learning Roadmap (EN)

This repository provides a **zero-to-expert** MIPS32 Assembly curriculum with step-by-step progression and hands-on examples.

## Goal

- Build strong low-level reasoning skills
- Understand CPU/register/memory/control-flow behavior
- Practice with MARS/SPIM-ready examples
- Consolidate knowledge through mini projects

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

1. **01-Hello-MIPS** — Segments, registers, basic syscalls
2. **02-Arithmetic-and-Logic** — Arithmetic, bitwise ops, `mult/div`
3. **03-Control-Flow** — Comparisons, branching, loops
4. **04-Memory-and-Arrays** — `lw/sw`, arrays, string handling
5. **05-Functions-and-Stack** — Functions, `jal/jr`, stack frames
6. **06-Floating-Point-FPU** — Coprocessor 1, float/double operations
7. **07-Macros** — Macro definition and reuse
8. **08-Interrupts-and-Exceptions** — Coprocessor 0, exceptions, MMIO
9. **09-Mini-Projects** — Recursive factorial, bubble sort, palindrome

## Directory Tree

```text
EN/
├── 01-Hello-MIPS/
│   ├── README.md
│   └── 01_hello_world.asm
├── 02-Arithmetic-and-Logic/
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

> Note: The `TR/` directory is perfectly symmetric in structure and filenames; only language changes.
