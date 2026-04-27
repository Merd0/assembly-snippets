# 01 - Learning Path (From Zero to Strong Practical Level)

## Start level selection

Pick one of the following and stay honest:

- **Level A (Zero):** New to assembly and architecture basics.
- **Level B (Basic):** You know loops/functions in high-level languages but not MIPS details.
- **Level C (Refresh):** You learned assembly before and need structured practice.

## Stage order (do not skip)

1. `01-Hello-MIPS` -> understand sections, syscalls, register roles
2. `02-Arithmetic-and-Logic` -> integer math, HI/LO, bit ops
3. `03-Control-Flow` -> conditions, branching, loop translation
4. `04-Memory-and-Arrays` -> addressing, arrays, strings
5. `05-Functions-and-Stack` -> calling convention, stack frames, recursion
6. `06-Floating-Point-FPU` -> single/double operations
7. `07-Macros` -> repetition removal with controlled abstraction
8. `08-Interrupts-and-Exceptions` -> CP0, exception vector, MMIO
9. `09-Mini-Projects` -> integrate everything

## Progression rules

- Move to next stage only when you can explain current stage examples **without reading comments**.
- Rewrite at least one example from memory at each stage.
- Modify constants/inputs and predict output before running.
- Keep a short “mistake log” file for recurring bugs.

## Minimum mastery criteria per stage

You pass a stage when you can:

- Run all files in that stage successfully.
- Explain register usage and data flow line-by-line.
- Make one small extension (new branch, new variable, extra print, etc.).
- Debug at least one deliberate bug you inserted yourself.
