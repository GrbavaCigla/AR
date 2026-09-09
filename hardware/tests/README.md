# Tests

Standalone Quartus projects for bringing up one block at a time, independently
of the full system. Each has its own `.qpf`/`.qsf` — open the one you need
rather than the main project.

| Folder | Tests |
|---|---|
| `RISCV32I test/` | CPU on its own, with small hand-written ROM images (`ROM_CPU*.v`) |
| `SDRAM_TEST/` | SDRAM controller read/write bring-up |
| `VgaTest/`, `VgaTest2/`, `VgaTest3/` | Successive stages of the display pipeline |
| `CpuSdramTest/` | CPU driving SDRAM over the bus |
| `pins/` | Pin assignment notes |

`test_components.qsf` is a scratch project for exercising parts from
`../components/`.
