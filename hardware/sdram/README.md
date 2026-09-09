# SDRAM

Controller for the board's 32 MiB SDRAM, which holds the CPU's data and stack.
(The VGA framebuffer is **not** here — it lives in on-chip M10K.)

## `sdram_controller.bdf`
The state machine: power-up initialisation (precharge all, mode register set,
the required initial refresh burst), then normal operation — activate, read or
write, precharge.

**Refresh** is driven by a counter compared against **389**, i.e. one auto
refresh every 389 clocks = 7.78 µs at 50 MHz. The parts require 8192 refreshes
per 64 ms, i.e. one every 7.81 µs, so this is correct with a small margin.

## `sdram_arbiter.bdf`
Arbitrates between requesters so refresh cycles and CPU accesses never collide.

## `sdram_wrapper.bdf`
The CPU-facing side: takes `cs_sdram`, `rd`/`wr`, a 26-bit address and write
data, returns read data and a `ready` that the bus FSM stalls on.

## `SDRAMDebug.v`
Bring-up helper, not part of the synthesised design.
