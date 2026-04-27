# 04-Memory-and-Arrays

In this section, we start using the MIPS32 memory model in a practical way: `lw/sw`, pointer arithmetic, array traversal, and string operations.

## What you will learn

- Word-level memory access (`lw`, `sw`)
- Byte-level access (`lb`, `sb`) and ASCII-oriented handling
- Index/pointer-based array traversal
- Character-by-character scanning of null-terminated strings

## Files

1. `04_01_lw_sw_basics.asm`
   - Writing/reading words and register-memory data flow
2. `04_02_array_sum_and_max.asm`
   - Single-pass sum + max over an array
3. `04_03_string_length.asm`
   - String length using `lb` (strlen idea)
4. `04_04_byte_and_word_access.asm`
   - Contrasting byte and word access in one example

## Technical notes

- In MIPS32, word access requires 4-byte aligned addresses.
- General array address formula: `base + index * element_size`.
- String loops usually terminate on `0` (null terminator).
- `lb` sign-extends; use `lbu` when unsigned semantics are needed.

## Run

1. Open the file in MARS/QtSPIM
2. Assemble (F3)
3. Run (F5)
4. Compare console output with the comments

## Next

In `05-Functions-and-Stack`, we move to function calls, `jal/jr`, `$ra` preservation, and stack frame design.
