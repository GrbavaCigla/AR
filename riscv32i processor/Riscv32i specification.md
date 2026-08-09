# RV32I Single-Cycle Processor

## Overview

This project implements a 32-bit RISC-V RV32I processor in Intel Quartus using a schematic-based design methodology (BDF) without Verilog HDL. The processor follows a single-cycle architecture in which every instruction completes within a single clock cycle.

The design includes a hardwired control unit, register file, immediate generator, ALU, program counter logic, instruction memory, data memory interface, and support for the RV32I base integer instruction set. Control logic is implemented using combinational opcode decoding rather than ROM-based microcode, allowing all control signals to be generated within the same cycle as instruction execution.

---

# RISC-V Instruction Formats

| Type | 31..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0 |
|:------|:------:|:------:|:------:|:------:|:-----:|:----:|
| **R-Type** | `funct7` | `rs2` | `rs1` | `funct3` | `rd` | `opcode` |
| **I-Type** | `imm[11:0]` | | `rs1` | `funct3` | `rd` | `opcode` |
| **S-Type** | `imm[11:5]` | `rs2` | `rs1` | `funct3` | `imm[4:0]` | `opcode` |
| **B-Type** | `imm[12\|10:5]` | `rs2` | `rs1` | `funct3` | `imm[4:1\|11]` | `opcode` |
| **U-Type** | `imm[31:12]` | | | | `rd` | `opcode` |
| **J-Type** | `imm[20\|10:1\|11\|19:12]` | | | | `rd` | `opcode` |

---

# Supported RV32I Instruction Groups

| Group | Opcode | Instructions |
|:------|:------:|:-------------|
| R-Type | `0110011` | ADD, SUB, AND, OR, XOR, SLL, SRL, SRA, SLT, SLTU |
| I-Type Arithmetic | `0010011` | ADDI, ANDI, ORI, XORI, SLTI, SLTIU, SLLI, SRLI, SRAI |
| Load | `0000011` | LW |
| Store | `0100011` | SW |
| Branch | `1100011` | BEQ, BNE, BLT, BGE, BLTU, BGEU |
| JALR | `1100111` | JALR |
| LUI | `0110111` | LUI |
| AUIPC | `0010111` | AUIPC |
| JAL | `1101111` | JAL |

> **Note:** `FENCE`, `ECALL`, `EBREAK`, and other SYSTEM instructions are intentionally not implemented. Unsupported opcodes generate a zeroed control word, resulting in no register write, memory access, branch, or jump operation.

---

# Control Unit

## Overview

The Control Unit is a purely combinational block responsible for decoding the instruction opcode and generating all control signals required by the datapath.

Instead of using a ROM-based lookup table, the control unit is implemented with opcode comparators and OR-gate networks. This approach eliminates additional latency and maintains compatibility with a single-cycle architecture.

The control unit drives:

- Register File
- Immediate Generator
- ALU
- Data Memory
- Program Counter update logic
- Writeback multiplexer

---

## Opcode Detection

Each supported instruction group has a dedicated comparator that generates a one-bit detection signal.

| Signal | Opcode (Binary) | Opcode (Hex) | Instruction Group |
|:--------|:--------------:|:------------:|:------------------|
| `is_Rtype` | `0110011` | `0x33` | R-Type |
| `is_Itype` | `0010011` | `0x13` | I-Type Arithmetic |
| `is_LW` | `0000011` | `0x03` | Load |
| `is_SW` | `0100011` | `0x23` | Store |
| `is_Branch` | `1100011` | `0x63` | Branch |
| `is_JALR` | `1100111` | `0x67` | JALR |
| `is_LUI` | `0110111` | `0x37` | LUI |
| `is_AUIPC` | `0010111` | `0x17` | AUIPC |
| `is_JAL` | `1101111` | `0x6F` | JAL |

---

# Control Word

All control signals are packed into a single 13-bit control word:

```text
control_word[12:0] =
{
    RegWrite(1),
    ImmSrc(3),
    ALUSrc(1),
    MemWrite(1),
    MemRead(1),
    MemtoReg(2),
    Branch(1),
    Jump(1),
    ALUOp(2)
}
```

## Signal Descriptions

| Signal | Width | Description |
|:--------|:-----:|:------------|
| `RegWrite` | 1 | Enables writes to the register file. |
| `ImmSrc` | 3 | Selects the immediate format extracted by the Immediate Generator. |
| `ALUSrc` | 1 | Selects ALU operand B (`rs2` or immediate). |
| `MemWrite` | 1 | Enables writes to data memory. |
| `MemRead` | 1 | Enables reads from data memory. |
| `MemtoReg` | 2 | Selects the source written back to the register file. |
| `Branch` | 1 | Indicates a conditional branch instruction. |
| `Jump` | 1 | Indicates an unconditional jump instruction. |
| `ALUOp` | 2 | High-level ALU operation category used by the ALU decoder. |

---

## Control Signal Equations

```text
RegWrite    = is_Rtype OR is_Itype OR is_LW OR is_LUI
              OR is_AUIPC OR is_JAL OR is_JALR

MemWrite    = is_SW

MemRead     = is_LW

Branch      = is_Branch

Jump        = is_JAL OR is_JALR

ImmSrc[2]   = is_JAL

ImmSrc[1]   = is_Branch OR is_LUI OR is_AUIPC

ImmSrc[0]   = is_SW OR is_LUI OR is_AUIPC

MemtoReg[1] = is_JAL OR is_JALR

MemtoReg[0] = is_LW

ALUSrc      = is_Itype OR is_LW OR is_SW
              OR is_JALR OR is_LUI OR is_AUIPC

ALUOp[1]    = is_Rtype OR is_Itype

ALUOp[0]    = is_Branch
```

## Field Encodings

### ImmSrc

| Value | Format | Instructions |
|:------:|:------:|:-------------|
| `000` | I-Type | ADDI, LW, JALR |
| `001` | S-Type | SW |
| `010` | B-Type | Branch instructions |
| `011` | U-Type | LUI, AUIPC |
| `100` | J-Type | JAL |

### MemtoReg

| Value | Source |
|:------:|:-------|
| `00` | ALU result |
| `01` | Data memory output |
| `10` | PC + 4 |

### ALUOp

| Value | Meaning |
|:------:|:---------|
| `00` | Fixed ADD |
| `01` | Fixed SUB |
| `10` | Determined by funct3/funct7 |
| `11` | Reserved |

---

## AUIPC Datapath Extension

Unlike standard arithmetic instructions, `AUIPC` computes:

```text
PC + Immediate
```

Therefore, the ALU must be capable of receiving either:

- `rs1data`
- `PC`

on its first input.

An additional multiplexer is inserted before ALU input A. This multiplexer is controlled independently from `ALUSrc`, which only affects ALU input B.

---

## Register File

- 32 registers (`x0`–`x31`)
- Two asynchronous read ports
- One synchronous write port
- Register width: 32 bits

Register `x0` is permanently hardwired to zero and cannot be modified.

```text
we_real = RegWrite AND (rd != 0)
```

---

## ALU

The ALU supports:

- ADD
- SUB
- AND
- OR
- XOR
- SLL
- SRL
- SRA
- SLT
- SLTU

The final operation is selected using:

- `ALUOp`
- `funct3`
- `funct7[5]`

---

## Future Extensions

- Full RV32I byte/halfword load-store support
- CSR instructions
- ECALL and EBREAK support
- Interrupt handling
- Memory-mapped peripherals
- SDRAM controller integration
- Five-stage pipelined architecture
- Branch prediction
- Instruction and data caches
