# 02-Arithmetic-and-Logic

This section builds the numerical core of MIPS32: integer arithmetic, `mult/div` with LO/HI handling, and bit-level manipulation.

## What you will learn

- Integer arithmetic with `add`, `addi`, `sub`
- Multiplication/division flow using `mult`, `div`, `mflo`, `mfhi`
- Bit operations using `and`, `or`, `xor`, `nor`, `sll`, `srl`, `sra`
- Printing results via syscalls in integer/hex/binary forms

## Files

1. `02_01_integer_arithmetic.asm`
   - Basic add/sub, immediate operations, result output
2. `02_02_mult_div_lo_hi.asm`
   - LO/HI workflow for multiplication and division
3. `02_03_bitwise_and_shift.asm`
   - Masking, flag set/clear/toggle, shift operations
4. `02_04_expression_pipeline.asm`
   - Mini example combining multiple arithmetic+logic steps in one flow

## Technical notes (engineering perspective)

- `add/sub` may trap on overflow; `addu/subu` is often used in safe unsigned flows.
- `mult` writes a 64-bit product into **HI:LO**.
- For `div`:
  - quotient → `LO`
  - remainder → `HI`
- Shift ops can optimize `x * 2^n` and `x / 2^n` patterns.

## Run

1. Open the target file in MARS
2. Assemble (F3)
3. Run (F5)
4. Compare console output with expected values

## Next

In `03-Control-Flow`, we will combine these operations with conditions and loops.
