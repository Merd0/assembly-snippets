# 07-Macros

This stage focuses on writing maintainable assembly by packaging repeated instruction patterns into macros. You will learn where macros help, where they can hurt, and how to keep them readable in production-like code.

## What you will learn

- Defining macros with `.macro ... .end_macro`
- Passing arguments (`%reg`, `%label`, `%imm`) into macros
- Building reusable output and loop helpers
- Reducing boilerplate in stack frame setup/teardown
- Macro hygiene: naming, side effects, and register ownership

## Files

1. `07_01_macro_print_string.asm`
   - Basic string-print macro and repeated usage
2. `07_02_macro_print_int.asm`
   - Integer print + newline macros with clean call sites
3. `07_03_macro_array_loop.asm`
   - Loop macro used to walk an integer array
4. `07_04_macro_stack_frame_helpers.asm`
   - Function prologue/epilogue macros for stack discipline

## Technical notes

- Macros are expanded at assemble-time, not runtime.
- Prefer explicit parameter names and comment clobbered registers.
- Keep macro responsibilities narrow; avoid hidden control flow.
- Macros improve consistency but can hide bugs if they silently modify temporary registers.

## Run

1. Open a file in MARS/QtSPIM
2. Assemble (F3)
3. Run (F5)
4. Compare output with expected behavior in comments

## Next

In `08-Interrupts-and-Exceptions`, we move to Coprocessor 0, exception vectors, and MMIO polling patterns.
