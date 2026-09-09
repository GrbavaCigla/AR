# RV32I processor

The CPU, and the top-level schematic that instantiates the whole system. This is
the Quartus project you open: `Riscv32i.qsf`, top-level entity **`MainScheme`**.

See `Riscv32i specification.md` and `Instruction set for riscv32i` for the ISA
subset and encoding notes.

## Top level — `mainScheme/MainScheme.bdf`

Wires together everything on the board:

- `riscv32iTest` — the CPU core
- `BusDecoder` — address decode and read-data mux
- `sdram_wrapper` — data memory
- `VgaBusInterface` + `Monitor` — display
- `LidarInterface2` — the LiDAR peripheral
- `LEDPeripheral`, `Binary2BCD` + `SevenSegmentInterfaceDEC` — debug output

## Core

RV32I, **no interrupts, no M extension** — there is no hardware divide or
remainder, so avoid `/` and `%` in firmware on anything that isn't a power of
two.

| Folder | Block |
|---|---|
| `ALU/` | Arithmetic and logic |
| `decode/` | `ControlWord`, `ALUDecoder`, `BranchDecoder` — instruction decode |
| `regfile/` | 32 × 32-bit register file |
| `pc/` | Program counter and `PC_CONTROL` |
| `ImmediateGenerator/` | Immediate extraction and sign extension per format |
| `InstructionMemory/` | Instruction ROM, initialised from `InicializationData.mif` |
| `DataMemory/` | On-chip data RAM used during bring-up |
| `riscv32i/`, `moduls/`, `modelsim_moduls/` | Core assemblies and simulation copies |
| `tests/` | Per-block testbenches |

## Firmware image

`InstructionMemory/InicializationData.mif` is **generated** — the firmware build
in `firmware/` writes it. Don't edit it by hand; run `just` in `firmware/` and
recompile in Quartus.

## Generated directories

`db/`, `incremental_db/`, `greybox_tmp/`, `hc_output/`, `output_files/` are
Quartus build output and can be deleted at any time.
