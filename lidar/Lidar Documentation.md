# LiDAR kontroler — dokumentacija (LDROBOT LD14P)

Ovaj dokument objašnjava kako radi UART RX modul (gotov), kako će raditi paketni
parser (sledeći korak), i kako sve to zajedno čini LiDAR kontroler periferiju
mapiranu na magistralu RISC-V procesora.

---

## 1. Fizički protokol LD14P LiDAR-a

LD14P je 2D triangulacijski LiDAR koji **neprekidno** šalje podatke čim dobije
napajanje — nema komandi, nema handshake-a sa hostom, samo jednosmerni UART TX.

- Napajanje: 5V (motor + logika)
- Signal: 3.3V TTL UART, **samo TX** linija
- Baud rate: **230400 bps**, format **8N1** (8 bita podataka, bez pariteta, 1 stop bit)
- Rotacija glave: ~10 Hz (podesivo 5–13 Hz)

### Format paketa (47 bajtova, fiksne dužine)

| Offset | Polje | Veličina | Opis |
|---|---|---|---|
| 0 | Header | 1B | uvek `0x54` |
| 1 | VerLen | 1B | bit[7:5]=broj tačaka (obično 12), donjih 5 bita=verzija; ceo bajt obično `0x2C` |
| 2–3 | Speed | 2B LE | brzina rotacije, °/s |
| 4–5 | Start angle | 2B LE | ugao prve tačke u paketu, jedinica 0.01° |
| 6–41 | 12× tačka | 3B po tački | 2B distanca (mm, LE) + 1B intenzitet |
| 42–43 | End angle | 2B LE | ugao poslednje tačke, 0.01° |
| 44–45 | Timestamp | 2B LE | ms, rolluje na 30000 |
| 46 | CRC-8 | 1B | nad bajtovima 0–45 (u ovoj implementaciji se **ne proverava** — vidi §4) |

Ugao svake pojedinačne tačke unutar paketa se linearno interpoliše između
`start_angle` i `end_angle` — to radi procesor u C kodu, ne hardver.

---

## 2. UART RX modul — kako radi (`UART_RX.v`, gotovo)

### Portovi

| Port | Smer | Opis |
|---|---|---|
| `clk` | ulaz | sistemski takt (50 MHz) |
| `rst_n` | ulaz | asinhroni reset, active-low |
| `rx` | ulaz | fizička UART linija sa LiDAR-a |
| `rx_data[7:0]` | izlaz | poslednji primljeni bajt |
| `byte_ready` | izlaz | 1 sistemski takt, pulsira kad je `rx_data` validan |

### Princip rada — "brojač pozicije + gomila komparatora" (bez klasične FSM)

Umesto klasične state-mašine sa enkodovanim stanjima, modul koristi jedan
brojač koji broji **poziciju unutar celog UART frejma** (0–159, jer je
frejm = 10 bitova × 16 uzoraka po bitu), i niz komparatora koji "pucaju"
tačno na sredini svakog bita. Svaki bit ima svoj sopstveni flip-flop koji se
učita tačno jednom, u tačno određenom trenutku — nema pomeranja kroz shift
registar, pa nema rizika da nešto "isklizne".

### Korak po korak

1. **Sinhronizacija (`DFF_inst` → `rx_sync`)** — `rx` linija dolazi asinhrono
   u odnosu na sistemski takt, pa prolazi kroz dva flip-flopa u seriji da se
   spreči metastabilnost. Sva dalja logika koristi isključivo `rx_sync`,
   nikad sirovi `rx`.

2. **Baud tick generator (`BAUD_GENERATOR`, `CMP4`)** — 4-bitni brojač
   (`SYNTHESIZED_WIRE_14`) broji od 0 do 13 (na 50 MHz to daje efektivni
   baud ~223 214 bps, ~3% odstupanje od nominalnih 230400 — u granicama
   tolerancije UART prijemnika), pa se sam resetuje (`clr_baud`) i generiše
   `baud_tick` — jedan takt visok signal koji se ponavlja na svakih 14
   sistemskih taktova, tj. **16× brže od stvarnog bit-rate-a** (16×
   oversampling).

3. **Detekcija start bita (`falling_edge`, `start_detact`)** — poredi
   trenutnu i prethodnu vrednost `rx_sync`-a; pad sa 1 na 0 dok linija miruje
   (`~busy`) pokreće prijem novog bajta.

4. **`busy` flip-flop (`b2v_inst12`, `REG1_LD_CL`)** — SR-tip flag: setuje se
   na `start_detact`, briše se na `frame_done | sys_reset`. Dok je `busy=1`,
   prijem jednog bajta je u toku.

5. **`bit_pos` brojač (`counter_8bit`)** — broji 0→159, ali samo dok je
   `busy=1` i samo na `baud_tick` impulsima (`cnt_en = busy & baud_tick`).
   Resetuje se na `~busy | sys_reset`.

6. **10 komparatora (`CMP8`)** — svaki poredi `bit_pos` sa konstantom koja
   odgovara **sredini** određenog bita (`k×16 + 8`):

   | Komparator | Konstanta | Bit |
   |---|---|---|
   | `m_startb` | 8 | start bit |
   | `d0` | 24 | data bit 0 (LSB) |
   | `d1` | 40 | data bit 1 |
   | `d2` | 56 | data bit 2 |
   | `d3` | 72 | data bit 3 |
   | `d4` | 88 | data bit 4 |
   | `d5` | 104 | data bit 5 |
   | `d6` | 120 | data bit 6 |
   | `d7` | 136 | data bit 7 (MSB) |
   | `m_stopb` | 152 | stop bit |

7. **Capture registri (10× `REG1_LD_CL`)** — svaki ima `D=rx_sync`,
   `LD=`odgovarajući komparator, `CL=sys_reset`. Kad komparator "pukne",
   registar zabeleži trenutnu vrednost `rx_sync`-a i drži je do sledećeg
   bajta. Osam data registara čine `rx_data[7:0]` bus; `start_bit_val` i
   `stop_bit_val` idu u proveru validnosti.

8. **Provera validnosti (`frame_valid`)** — `start_bit_val` mora biti `0`
   (invertovano → `start_ok`), `stop_bit_val` mora biti `1`.
   `frame_valid = start_ok & stop_bit_val`.

9. **`frame_done`** — poslednji `CMP8` poredi `bit_pos` sa `159` (kraj
   frejma). Ovo briše `busy` (kraj prijema, spreman za sledeći start bit).

10. **`byte_ready = frame_done & frame_valid`** — izlazni signal bloka.
    Pulsira samo ako su start i stop bit bili validni; loš frejm se tiho
    odbacuje (bajt se ignoriše, ali sistem se svejedno vraća u `IDLE`
    zahvaljujući `frame_done`).

### Reset (`rst_n` → `sys_reset`)

`rst_n` (active-low) se invertuje u `sys_reset` (active-high, jedan `NOT`
primitiv) i provlači na:
- `busy.CL` (kombinovano sa `frame_done` preko `OR2`)
- `bit_pos.sclr` (kombinovano sa `~busy` preko `OR2`)
- `BAUD_GENERATOR.sclr` (kombinovano sa `baud_tick` preko `OR2`)
- svih 10 capture registara direktno na `CL`

Ovo garantuje da sistem posle uključivanja ploče (ili pritiska reset dugmeta)
uvek počinje iz čistog stanja, umesto da pokuša da "uhvati" LiDAR usred
frejma koji je već u toku (LiDAR počinje da šalje podatke čim dobije
napajanje, nezavisno od FPGA reset-a).

---

## 3. Paketni parser — sledeći sloj (u planu, gradi se preko `UART_RX`)

Parser koristi identičan stil gradnje kao `UART_RX` modul: brojač pozicije +
komparatori, umesto klasične FSM sa enkodovanim stanjima.

### Ulazi/izlazi

| Port | Smer | Opis |
|---|---|---|
| `clk`, `rst_n` | ulaz | isto kao RX modul |
| `rx_data[7:0]` | ulaz | iz `UART_RX` |
| `byte_ready` | ulaz | iz `UART_RX` |
| `data_ready` | izlaz | 1 = kompletan i validan paket spreman za čitanje preko magistrale |
| `speed[15:0]`, `start_angle[15:0]`, `end_angle[15:0]`, `timestamp[15:0]` | izlaz | iz zaglavlja paketa |
| `point0`...`point11` (po 24 bita: `[23:16]`=intenzitet, `[15:0]`=distanca) | izlaz | 12 tačaka |

### Princip rada

1. **`WAIT_HEADER`** — na svaki `byte_ready`, poredi `rx_data` sa `0x54`
   (`CMP8`, EQ). Ako se ne poklapa, ostani u istom stanju (odbaci bajt —
   praktično: ne uradi ništa, čekaj sledeći `byte_ready`).

2. **`WAIT_VERLEN`** (jedan `byte_ready` posle header-a) — poredi sledeći
   bajt sa `0x2C`. Ako ne odgovara, vrati se u `WAIT_HEADER` (lažni header,
   odbačen paket).

3. **`COLLECT`** — brojač bajtova (isti princip kao `bit_pos` u RX modulu,
   samo sad broji **bajtove unutar paketa**, 0 do 44) na svaki `byte_ready`
   inkrementira, i istovremeno preko niza komparatora + `REG1_LD_CL`
   registara (isti obrazac kao u RX modulu — svaki registar ima `LD` aktivan
   samo kad brojač pogodi njegov indeks) puni odgovarajuće polje:
   `speed`, `start_angle`, 12× `(distance, intensity)`, `end_angle`,
   `timestamp`.

4. **CRC bajt (indeks 45)** — u ovoj implementaciji se **ne proverava**
   (obrazloženje u §4). Bajt se primi, ali se ignoriše — brojač samo
   nastavlja do kraja paketa.

5. **Kraj paketa** — kad brojač bajtova dostigne 45 (poslednji bajt
   primljen), postavi `data_ready` (novi `REG1_LD_CL`: `LD`=kraj paketa,
   `CL`=`ACK` iz magistrale — vidi §5), vrati brojač na 0, vrati se u
   `WAIT_HEADER`.

### Bitna napomena o preplitanju sa CPU čitanjem

Dok je `data_ready=1`, parser **ne sme** da počne da puni iste registre
novim paketom (jer bi CPU mogao usred čitanja da vidi mešavinu starog i
novog paketa). Zato je `data_ready` "zaključan" sve dok CPU ne potvrdi
čitanje upisom u `LIDAR_CTRL` registar (bit `ACK`) — tek tada se `data_ready`
briše i parser sme da krene da hvata sledeći paket od `WAIT_HEADER`.
Praktično: `COLLECT` stanje ne kreće iznova dok je `data_ready=1`, čak i ako
u međuvremenu stigne novi `0x54` header — taj paket se izgubi, što je
prihvatljivo (LiDAR šalje pakete mnogo brže nego što je potrebno za
osvežavanje ekrana).

---

## 4. Zašto CRC provera nije implementirana

CRC-8 provera bi zahtevala serijski LFSR (bit-po-bit XOR shift registar) sa
tačno određenim polinomom (`0x4D`, reflektovana varijanta). Ovo je izvodljivo
u schematic-u, ali:

- osetljivo je na grešku u polinomu koja se teško debaguje bez detaljne
  bit-tačne simulacije,
- za ovaj projekat je dovoljna validacija na `header==0x54` i
  `verlen==0x2C` — verovatnoća da slučajni šum na liniji slučajno proizvede
  baš ta dva bajta na ispravnoj poziciji je zanemarljiva,
- loš paket (retkost) će jednostavno rezultovati par pogrešno iscrtanim
  tačkama na ekranu, što ne remeti rad sistema.

CRC se može dodati kasnije kao poboljšanje, van kritičnog puta projekta.

---

## 5. Kompletna arhitektura LiDAR kontrolera (bus strana)

```
LD14P ──UART──> UART_RX ──rx_data/byte_ready──> Paketni parser ──> registri
                (gotovo)                          (sledeći korak)      │
                                                                        │
                                                        bus_addr[7:2] ──┤
                                                        (mux/selekcija) │
                                                                        ▼
                                                              lidar_rdata[31:0]
                                                              lidar_ready = 1
                                                                        │
                                                                        ▼
                                                                  BusDecoder
                                                                  (u riscv32i_3.v)
```

### Registarska mapa (bazna adresa `0x1000_0000`, opseg do `0x1000_00FF`)

| Offset | Ime | R/W | Opis |
|---|---|---|---|
| `0x00` | `LIDAR_STATUS` | R | bit0 = `DATA_READY` |
| `0x04` | `LIDAR_CTRL` | W | bit0 = `ACK` (briše `DATA_READY`, otključava parser za sledeći paket) |
| `0x08` | `LIDAR_SPEED` | R | brzina rotacije, °/s |
| `0x0C` | `LIDAR_START_ANGLE` | R | ugao prve tačke, 0.01° |
| `0x10` | `LIDAR_END_ANGLE` | R | ugao poslednje tačke, 0.01° |
| `0x14` | `LIDAR_TIMESTAMP` | R | ms |
| `0x18–0x44` | `LIDAR_POINT[0..11]` | R | `[15:0]`=distanca (mm), `[23:16]`=intenzitet |

### Dekodiranje na `BusDecoder` nivou

`bus_addr[31:28] == 4'h1` → `cs_lidar`. Kad je `cs_lidar` aktivan:
- `lidar_ready` je uvek `1'b1` (čita se već uhvaćen snapshot iz registara,
  nema čekanja na fizički uređaj u trenutku samog bus pristupa)
- `lidar_rdata` = izlaz malog multipleksera koji na osnovu `bus_addr[7:2]`
  bira jedan od 18 internih registara parsera

### Tok podataka od LiDAR-a do ekrana

```
LD14P → UART_RX → Parser → registri (MMIO) → C kod (polling na DATA_READY)
      → računa (x,y) iz (ugao,distanca) → piše piksel u SDRAM framebuffer
      → VGA kontroler čita SDRAM (preko sdram_arbiter, video port)
      → iscrtava na monitoru
```

C kod čita `LIDAR_STATUS`, ako je `DATA_READY=1` pročita svih 12 tačaka i
zaglavlje, izračuna (x,y) koordinate preko fiksno-zarezne sin/cos tabele
(procesor nema FPU/libm), upiše piksele u framebuffer, pa upiše `ACK` u
`LIDAR_CTRL` da oslobodi parser za sledeći paket.
