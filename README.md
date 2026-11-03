# AR

RV32I processor, SDRAM controller, VGA output and a LiDAR peripheral on a
Cyclone V FPGA. An LDROBOT LD14P LiDAR streams distance readings over UART, the
FPGA converts them to pixel coordinates, the CPU plots them, and a VGA monitor
shows a top-down map of the room.

Slides: [docs/lidar-presentation.pptx](docs/lidar-presentation.pptx)

## Specs

- FPGA: Cyclone V 5CEBA4F23C7 (Terasic DE0-CV), 50 MHz clock
- LiDAR: LDROBOT LD14P, 230400 baud 8N1, about 4000 points/s, about 6 Hz rotation
- Memory: 32 MiB SDRAM for data and stack, on-chip ROM for code (1024 words, `MEMORY_DEPTH` in `firmware/CMakeLists.txt`)
- Display: VGA 800x600, 1 bit per pixel, double buffered, framebuffer in on-chip M10K
- CPU: RV32I, no interrupts, no M extension (no hardware divide), synchronous bus
- Tools: Quartus II 13.1; CMake, a `riscv64-*-gcc` cross toolchain and `just` for the firmware

## Layout

- `hardware/riscv32i processor/`: Quartus project (`Riscv32i.qsf`), CPU blocks, top level `mainScheme/MainScheme.bdf`
- `hardware/lidar/`: UART receiver, packet parser, angle interpolation, polar to pixel, point FIFO
- `hardware/vga/`: sync generator, framebuffer, double buffering, layers
- `hardware/bus/`: address decoder, wait-state FSM, VGA bus interface
- `hardware/sdram/`: SDRAM controller, arbiter, CPU-facing wrapper
- `hardware/components/`: adders, muxes, registers, comparators, constants
- `hardware/tests/`: standalone Quartus bring-up projects
- `firmware/`: C firmware, linker script, CMake toolchain, `bin2mif` and `bin2ver`
- `cad/`: LiDAR mount (`mount.FCStd` is the FreeCAD source, `mount.stl` the printable mesh)
- `docs/`: presentation and reference documents

Most of the hardware is drawn as Quartus block diagrams. The `.bdf` is the
source; the `.v` next to it is generated and gets overwritten on compile.

## Data path

```
LD14P -UART-> UART_RX -bytes-> PacketParser -12 points-> AngleGenerator
                                                              |
                                                        CalculateXY2 (polar -> x,y)
                                                              |
                                                          LidarFifo
                                                              |
                           CPU reads 0x1000_0000, one point per read
                                                              |
                           CPU writes pixel to 0x2000_0000 -> FrameBuffer -> VGA
```

- `UART_RX` samples each bit at a fixed count, 217 clocks apart, which gives
  230415 baud. Frames with a bad start or stop bit are dropped.
- `PacketParser` reassembles the 47-byte packet: header `0x54`, verlen `0x2C`,
  speed, start angle, 12 distance/intensity pairs, end angle, timestamp, CRC.
  The CRC is not checked.
- `AngleGenerator` interpolates the 12 point angles from the packet's start and
  end angle, including wrap past 360 degrees.
- `CalculateXY2` folds the angle into the first quadrant, looks it up in a
  64-entry Q15 sine ROM, clamps distance to 8000 mm, and scales by a shift
  (bits `[28:20]`) to 32 mm per pixel. The sensor is centred at (400, 300).
- `LidarFifo` buffers the 12 points of a packet, which arrive in a burst much
  faster than software polls. Each bus read pops one point.
- `FrameBuffer` is two 60000x8 RAMs, bit-packed: `byte_addr = Y*100 + X/8`, bit
  `X[2:0]`. A pixel write is a read-modify-write. Writes go to the buffer that
  is not currently displayed, so you have to swap to see them.

## Memory map

The bus decodes only `addr[29:28]`, so each peripheral is aliased across a
256 MiB region.

| Base | Peripheral |
|---|---|
| `0x0000_0000` | SDRAM |
| `0x1000_0000` | LiDAR (read) |
| `0x2000_0000` | VGA (write) |
| `0x3000_0000` | LED |

LiDAR read: bit 31 valid, `[29:20]` point index within the revolution,
`[19:10]` x, `[9:0]` y. The index resets when a packet's start angle drops below
the previous packet's, so the last index of a revolution varies by a few counts
(about 667 points per revolution).

VGA write: bit 31 pixel value, bit 30 swap buffers, `[19:10]` y, `[9:0]` x. The
write strobe fires on any VGA write, so a swap word also writes pixel (0, 0).
There is no bulk clear; clearing the screen is 480000 writes.

A bus transaction that is not acknowledged in its first cycle raises `bus_wait`
and stalls the CPU until the peripheral is ready. LiDAR, VGA and LED
acknowledge immediately; SDRAM takes as long as it needs.

## SDRAM

After power-up initialisation (precharge all, mode register set, refresh
burst), the controller does activate, read or write, precharge. Auto refresh
runs every 389 clocks (7.78 us); the part needs 8192 refreshes per 64 ms.
Command encodings are in [docs/sdram-command-constants.txt](docs/sdram-command-constants.txt).

## Firmware

`firmware/src/main.c` reads a LiDAR word, skips it if the revolution index is
unchanged, and plots it. `#define MODE` selects how old points are removed:

- `MODE_FRAME`: double buffering. After `POINTS_PER_FRAME` points the buffers
  swap and the new back buffer is cleared.
- `MODE_NONE`: draw into both buffers and never erase.
- `MODE_COUNT`: keep the last `LENGTH` points with a per-pixel count and erase a
  pixel when its last point is evicted.

Things that will bite you:

- No hardware divide, so `/` and `%` are slow library calls. Use masks and compares.
- `.bss` is not zeroed. `start.S` only sets `sp` and calls `main`.
- `start.S` sets `sp = 0x02000000` (32 MiB) while `linker.ld` declares 16 MiB of
  SDRAM, so the linker can't warn about a stack collision. Prefer `static` over
  large local arrays.

## Building

Firmware, from `firmware/`: run `just` (also `just clean`, `configure`, `build`,
`objdump`). This produces `build/firmware.bin`, `build/instructions.mif` and
`build/instructions.v`. CI builds the firmware only and uploads the `.mif`.

Hardware: open `hardware/riscv32i processor/Riscv32i.qpf` in Quartus 13.1 (top
level entity `MainScheme`), compile and program the board. Code lives in
on-chip ROM, so every firmware change needs a firmware build followed by a
Quartus recompile.

Known issue: the firmware build copies the `.mif` to
`hardware/riscv32i processor/InstructionMemory/InicializationData.mif`, but that
directory is not in the repository. Create it, or point the ROM at
`firmware/build/instructions.mif`.

The projects in `hardware/tests/` each have their own `.qpf`. ModelSim
testbenches are in `hardware/components/tests/` and
`hardware/riscv32i processor/tests/`; set the ModelSim working directory to the
project folder first.

## Docs

- [docs/lidar-design.sr.md](docs/lidar-design.sr.md): LiDAR pipeline design write-up (Serbian)
- [docs/vga-timing.md](docs/vga-timing.md): VGA timing derivation
- [docs/riscv32i-specification.md](docs/riscv32i-specification.md) and [docs/riscv32i-instruction-set.txt](docs/riscv32i-instruction-set.txt): implemented ISA subset
- [docs/sdram-command-constants.txt](docs/sdram-command-constants.txt): SDRAM command words
- `docs/*.sr.*`: written in Serbian

## License

GPL-3.0, see [LICENSE](LICENSE).
