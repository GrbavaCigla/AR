# LiDAR peripheral

Turns the LD14P's serial stream into finished screen coordinates. All the polar
maths happens in hardware, so the CPU never sees an angle or a distance — it
reads a point that is already an (x, y) pixel.

The live top-level module is **`LidarInterface2`** (in `LidarInterface/`), which
is what `MainScheme` instantiates. See `LIDAR ld14p.md` for the raw sensor
protocol.

## Pipeline

```
rx ──> UART_RX ──rx_data/byte_ready──> PacketParser ──> AngleGenerator
                                            │                  │
                                     12 distances        12 angles
                                            └──── MPX12 ───────┘
                                                    │
                                              CalculateXY2
                                                    │
                                               LidarFifo
                                                    │
                                          lidar_data (one point per bus read)
```

## The blocks

### `UART_RX/`
230400 baud, 8N1. The `rx` line is double-flopped for metastability, a falling
edge starts a 12-bit cycle counter, and each bit is sampled at a fixed count:
**108, 325, 542, … , 2061** — spaced **217 clocks** apart. At 50 MHz that is
230415 baud, within 0.01% of nominal. Start and stop bits are checked; a frame
that fails either is dropped silently and `byte_ready` never pulses.

### `packet_parser/`
Reassembles the LD14P's 47-byte packet: header `0x54`, verlen `0x2C`, speed,
start angle, 12 × (16-bit distance + 8-bit intensity), end angle, timestamp,
CRC. Bytes arrive low-first, so a two-deep byte shift register reassembles each
little-endian 16-bit field. The CRC byte is received but **not verified** —
validation relies on the header and verlen bytes matching, which is enough in
practice. Raises `data_ready` when a whole valid packet has landed.

### `LidarPointCalculator/AngleGenerator/`
A packet only carries the angle of its first and last point, so this linearly
interpolates the 12 intermediate angles between `start_angle` and `end_angle`,
handling wraparound past 360°.

### `LidarPointCalculator/RealXY/` — `CalculateXY2`
Polar to pixel, in fixed point:

- The angle is folded into the first quadrant and looked up in a **64-entry
  Q15 sine ROM** (`ROM SIN/`), with sign restored per quadrant.
- Distance is **clamped to 8000 mm** before the multiply, so a far reading
  saturates at the edge of the display instead of wrapping around.
- `distance × sin/cos` is scaled by taking bits `[28:20]` of the product —
  a shift, not a divide — giving **32 mm per pixel**.
- The result is offset to centre the sensor at **(400, 300)**, so points land in
  x ∈ [150, 650], y ∈ [50, 550] on an 800×600 screen.

### `PointBank12/` — `LidarFifo`
A FIFO between the point pipeline and the bus. The 12 points of a packet are
produced in a burst only a few clock cycles wide — far faster than software can
poll — so they are queued here and the CPU pops **one point per bus read**
(`bus_rd`). `lidar_data` bit 31 reports whether the FIFO has anything in it.

`PointBank12.bdf` itself is an earlier 12-slot register-bank approach, kept
alongside the FIFO it was replaced by.

### `lpm_counter/`, `BAUD_GENERATOR/`
Megafunction-generated counters. `counter_8bit` indexes the 12 points within a
packet; `counter_12bit` times the UART bit sampling. `BAUD_GENERATOR` belongs to
the older oversampling receiver and is no longer on the live path.

## Output format

One 32-bit word at `0x1000_0000`, one point per read:

| Bits | Meaning |
|---|---|
| 31 | valid — a point was available |
| 29:20 | index of this point within the current revolution |
| 19:10 | x pixel |
| 9:0 | y pixel |

The revolution index resets when a packet's `start_angle` drops below the
previous packet's, i.e. when the head sweeps back through 0°. Detection is at
**packet granularity** (12 points at a time), and ~4000 points/s at ~6 Hz is
about 667 points per revolution, so the highest index before a reset varies by a
few counts rather than being a fixed number.
