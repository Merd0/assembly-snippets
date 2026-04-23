# 05-Functions-and-Stack

In this section, you learn professional function design in MIPS32: `jal/jr`, argument/return register conventions, `$ra` preservation, and stack-frame management.

## What you will learn

- Calling functions with `jal`, returning with `jr $ra`
- Passing parameters via `$a0-$a3`, returning results via `$v0`
- Caller-saved vs callee-saved register discipline
- Using `$sp` and basic stack-frame layout
- Preserving `$ra` + local state in recursive calls

## Files

1. `05_01_jal_jr_basics.asm`
   - Minimal function call/return flow
2. `05_02_arguments_and_return.asm`
   - Function with two parameters and a return value
3. `05_03_stack_frame_and_saved_registers.asm`
   - Stack frame with `$ra`/`$s0` save-restore pattern
4. `05_04_recursive_factorial.asm`
   - Recursive factorial showing real stack behavior

## Technical notes

- `jal` writes the return address to `$ra`; nested calls require saving `$ra`.
- Callee-saved registers (`$s0-$s7`) must be restored if modified in the function.
- Recursion creates multiple frames; each frame carries its own local state.
- Stack typically grows downward via `addi $sp, $sp, -N`.

## Run

1. Open the file in MARS/QtSPIM
2. Assemble (F3)
3. Run (F5)
4. Validate output against expected behavior from comments

## Next

In `06-Floating-Point-FPU`, we move to Coprocessor 1 and float/double arithmetic.
