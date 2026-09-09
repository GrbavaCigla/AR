# Components

The reusable parts library. Nearly every block in this project is built from
these, so the naming is consistent: the number is the width in bits.

| Folder | Contents |
|---|---|
| `ADD/` | Adders — `ADD1`, `ADD2`, `ADD4`, `ADD8`, `ADD16`, `ADD25`, `ADD32`. Ports `A`, `B`, `C_0` (carry in), `OUT` |
| `SUB/` | Subtractors, same width scheme |
| `CMP/` | Comparators — `CMP1`, `CMP4`, `CMP8`, `CMP16`, `CMP32`. Ports `A`, `B` and outputs `G` (greater), `E` (equal), `L` (less) |
| `MPX/` | Multiplexers — `MPX2_16BIT`, `MPX12_16BIT`, `MPX4_32BIT` and friends. 2:1 muxes use `S`, `E` (enable), `I0`, `I1`, `D` |
| `DMPX/` | Demultiplexers |
| `REG/` | Registers — `REG1_LD_CL` … `REG32_LD_CL`, some with increment/decrement/shift. Ports `LD` (load), `CL` (clear), `I`, `A` (output) |
| `SHIFT/` | Shifters |
| `MUL/` | Multipliers |
| `CONST/` | Fixed-value generators, plus the parameterised `ConstantX` (`const` and `size` parameters) |
| `AND/`, `OR/`, `XOR/` | Wide gates |
| `DECODERS/` | Binary to one-hot, e.g. `DEC5` (5 bits → 32 lines, with enable) |
| `TRI/` | Tri-state buffers |
| `ROM/`, `ROM ZA CPU/` | ROM megafunction wrappers |
| `SevenSegmentInterface/` | Hex digit to seven-segment |
| `PC SHOW ON DISPLAY/` | Debug — program counter on the seven-segment displays |
| `basicdotvfiles/`, `modules/` | Behavioural `.v` copies used for ModelSim |
| `tests/` | Component testbenches |

When you need a part's exact pin names, the quickest reference is an existing
`.bdf` that already uses it — pin naming is not always what you'd guess
(`NOT` uses `IN`/`OUT`, `OR2` uses `IN1`/`IN2`/`OUT`).
