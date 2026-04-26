# 06-Floating-Point-FPU

In this stage, you move from integer ALU operations to floating-point computation on Coprocessor 1 (FPU). The goal is to build correct mental models for single/double precision, FPU register usage, and comparison/branch flows.

## What you will learn

- How to define and load `.float` / `.double` data
- How to perform arithmetic with FPU instructions (`add.s`, `mul.s`, `add.d`, `div.d`)
- How to print floating-point values via syscall (`$v0=2` and `$v0=3`)
- How to compare floating-point values (`c.lt.s`, `c.eq.s`) and branch with `bc1t/bc1f`
- How to convert integer values to float with `mtc1 + cvt.s.w`

## Files

1. `06_01_float_basics.asm`
   - Single-precision (`.float`) load, compute, and print flow
2. `06_02_double_precision.asm`
   - Double-precision (`.double`) arithmetic and output
3. `06_03_fpu_compare_and_branch.asm`
   - FPU compare instructions plus `bc1t/bc1f` branching
4. `06_04_mixed_integer_float_pipeline.asm`
   - Int → float conversion and mixed pipeline style computation

## Technical notes

- FPU registers are `$f0-$f31`; double-precision instructions operate on register pairs.
- Use `lwc1/swc1` for single values and `ldc1/sdc1` for double values.
- FPU comparisons set condition flags in Coprocessor 1; branches use `bc1t`/`bc1f`.
- Integer and float register files are different; transfer integer bits with `mtc1/mfc1`, then convert format (`cvt.s.w`, `cvt.w.s`, etc.).

## Run

1. Open any `.asm` file in MARS/QtSPIM
2. Assemble (F3)
3. Run (F5)
4. Inspect console output and compare with expected results in comments

## Next

In `07-Macros`, you will reduce repetition with reusable macro blocks.
