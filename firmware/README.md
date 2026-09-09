# Firmware

The C program that runs on the RV32I core: it reads points from the LiDAR
peripheral and plots them to the VGA framebuffer.

## Building

```bash
just
```

That cross-compiles, links, converts the binary to a `.mif`, and copies it into
`hardware/riscv32i processor/InstructionMemory/InicializationData.mif`. You then
have to **recompile in Quartus** for the new image to reach the FPGA — the
program lives in on-chip ROM, not something you can flash separately.

Other targets: `just clean`, `just configure`, `just build`, and `just objdump`
to disassemble the result.

## Files

| File | Purpose |
|---|---|
| `src/main.c` | The scanner loop |
| `src/common.h` | Types, `MMIO_REG`, `BUSY_WAIT`, peripheral base addresses |
| `src/lidar.h` | LiDAR word accessors |
| `src/vga.h` | Pixel write and buffer swap |
| `src/led.h` | LED output |
| `src/start.S` | Reset vector — sets `sp`, calls `main` |
| `linker.ld` | Memory layout |
| `tools/` | `bin2mif` and `bin2ver`, which turn the linked binary into memory images |
| `cmake/riscv32.cmake` | Cross-compilation toolchain file |

## Display modes

`main.c` has three strategies behind one `#define MODE`:

| Mode | Behaviour |
|---|---|
| `MODE_FRAME` | True double buffering. Points are drawn into the back buffer; after `POINTS_PER_FRAME` the buffers swap and the new back buffer is cleared. Stale points vanish with their buffer. |
| `MODE_NONE` | Draw and never remove. Each point goes to both buffers, so the picture accumulates forever. |
| `MODE_COUNT` | Ring buffer of the last `LENGTH` points plus a per-pixel occupancy count, erasing a pixel only when its last occupant is evicted. |

All three skip repeats using the revolution index in bits 29:20, so a point is
only plotted once no matter how often the register is polled.

## Things to watch

- **No hardware divide.** RV32I base has no M extension, so `/` and `%` become
  slow library calls. Use masks and comparisons — e.g. `if (i >= N) i = 0;`
  instead of `i % N`.
- **`.bss` is not zeroed.** `start.S` sets the stack pointer and jumps straight
  to `main`; there is no runtime that clears `.bss`. Zero any array you rely on
  starting empty.
- **The stack is outside the linker's map.** `linker.ld` declares SDRAM as 16 MiB
  but `start.S` sets `sp = 0x02000000` (32 MiB). It works because the physical
  part is larger, but the linker cannot warn you about a collision — prefer
  `static` over large local arrays.
- **Clearing the screen is 480000 writes.** There is no bulk clear, so a full
  `vga_clear()` is expensive and drops points while it runs.
