# 03-Control-Flow

In this section, you learn how to control execution flow in MIPS32: comparisons, branches, conditions, and loops.

## What you will learn

- Build comparisons with `slt`
- Use `beq`, `bne`, `j` for branch/jump control
- Implement if-else logic with labels and jumps
- Simulate while and for loops at assembly level

## Files

1. `03_01_slt_and_branch.asm`
   - Basic decision making with `slt` + `beq/bne`
2. `03_02_if_else.asm`
   - Building if-else flow via labels and jumps
3. `03_03_while_loop_sum.asm`
   - 1..N accumulation with a while loop
4. `03_04_for_loop_countdown.asm`
   - Countdown using for-style loop control

## Technical notes

- Branch instructions are PC-relative; target labels are resolved by the assembler.
- `slt rd, rs, rt` sets `rd=1` when `rs < rt`, otherwise `rd=0`.
- Use a clear loop template:
  1. init
  2. condition check
  3. body
  4. increment/decrement
  5. jump back

## Run

1. Open file in MARS/SPIM
2. Assemble (F3)
3. Run (F5)
4. Compare output with expected flow from comments

## Next

In `04-Memory-and-Arrays`, we move to memory access (`lw/sw`) and array traversal.
