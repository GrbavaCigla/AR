# VGA display

An 800×600 1-bit-per-pixel display with double buffering, driven entirely from
on-chip memory. See `VGA Controller.md` for the timing derivation.

## The blocks

### `VGAControler/`
Generates horizontal and vertical sync and the running pixel coordinate, and
gates the visible region. `ClockDivider` in `components/` derives the pixel
clock from the 50 MHz system clock.

### `FrameBuffer/`
Two `FrameBufferRAM` instances — Altera `altsyncram`, **60000 × 8 bits**, M10K
on-chip blocks. The framebuffer is **not** in SDRAM.

Pixels are bit-packed 8 to a byte, so a byte address is:

```
PIXEL_ADDR = Y * 100 + X / 8       (100 bytes × 8 pixels = 800 px per row)
```

with `X[2:0]` selecting the bit. Writing one pixel is therefore a
read-modify-write of a byte.

`FrameBufferWrapper` holds the double-buffer state: an internal `SEL` flip-flop
toggles on each swap, and the write enables and the scanout read mux are wired
to **opposite** senses of it. That means **writes always land in the buffer that
is not currently displayed** — you must swap for anything you have drawn to
become visible.

### `Monitor/`
Ties the controller and framebuffer together and drives the R/G/B pins. Takes
`SET_PIXEL`/`SET_BIT`/`XIN`/`YIN` from the bus side and `FB_SEL` to flip buffers.

### `Layers/`
`Background` and `Point` layers, composited on the way out.

### `components/`
`PixelAddrCalculator` (the address maths above), `ClockDivider`, `RisignEdge`,
and generic register/comparator/mux helpers.

## Register

One 32-bit word at `0x2000_0000`, write-only:

| Bits | Meaning |
|---|---|
| 31 | pixel value — 1 sets, 0 clears |
| 30 | swap front and back buffer |
| 19:10 | y |
| 9:0 | x |

Two things worth knowing:

- A swap word also performs a pixel write, because the write strobe fires on
  **any** VGA write. With `x = y = 0` and bit 31 clear, every swap therefore
  also clears pixel **(0, 0)**.
- Clearing the screen means writing all 480000 pixels; there is no bulk clear.
