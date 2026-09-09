# Bus

A synchronous, atomic bus: one transaction at a time, and the CPU stalls until
the addressed peripheral says it is ready.

## `BusDecoder/`
Decodes **`bus_addr[29:28]`** into a chip select, and muxes the addressed
peripheral's read data and ready signal back to the CPU. Only those two bits are
decoded, so each peripheral owns a 256 MiB aliased region — any address within a
region hits the same peripheral.

| `addr[29:28]` | Base | Peripheral |
|---|---|---|
| `00` | `0x0000_0000` | SDRAM |
| `01` | `0x1000_0000` | LiDAR |
| `10` | `0x2000_0000` | VGA |
| `11` | `0x3000_0000` | LED |

## `BusFSM/`
Produces `bus_wait`. A transaction that is not acknowledged in its first cycle
raises `bus_wait`, which holds the CPU until the peripheral's `ready` asserts.
Peripherals that are simply registers (VGA, LED, LiDAR) acknowledge immediately;
SDRAM takes as long as it takes.

## `VgaBusInterface/`
Converts a bus write into a framebuffer operation: splits `bus_wdata` into
coordinates, pixel value and swap flag, issues the write, and holds the bus
until the framebuffer reports the pixel was committed.
