# 08-Interrupts-and-Exceptions

This stage introduces system-level flow: Coprocessor 0 state, exception vectors, and memory-mapped I/O polling. The focus is practical understanding of how control leaves normal code and returns safely.

## What you will learn

- Reading CP0 registers (`Status`, `Cause`, `EPC`) with `mfc0`
- Structuring an exception handler at `.ktext 0x80000180`
- Recovering from traps with `eret`
- Understanding overflow/trap-driven exception flow
- Polling MARS MMIO keyboard/display registers

## Files

1. `08_01_cp0_snapshot.asm`
   - Read and print selected CP0 register values
2. `08_02_break_exception_handler.asm`
   - Trigger a `break` exception and handle it in kernel space
3. `08_03_overflow_exception.asm`
   - Demonstrate arithmetic overflow exception path
4. `08_04_mmio_keyboard_echo.asm`
   - MMIO keyboard polling and display echo loop

## Technical notes

- Exception entry point in MARS is typically `0x80000180`.
- `eret` returns from exception to `EPC` (often adjusted by handler logic).
- Keep handler code minimal and deterministic; avoid complex side effects.
- MMIO addresses in MARS examples:
  - Receiver control: `0xFFFF0000`
  - Receiver data: `0xFFFF0004`
  - Transmitter control: `0xFFFF0008`
  - Transmitter data: `0xFFFF000C`

## Run

1. Open the file in MARS
2. Assemble (F3)
3. Run (F5)
4. For MMIO example, open the Keyboard and Display MMIO tool in MARS

## Next

In `09-Mini-Projects`, you will combine all previous stages in real algorithmic programs.
