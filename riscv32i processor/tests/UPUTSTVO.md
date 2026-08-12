# Testovi za RISC-V32I procesor — uputstvo za ModelSim

## Sta je pokriveno

Iz analize `ControlWord.v` i `pc.v` vidi se da vas procesor podrzava sledece
opkodove: R-tip (0110011), I-tip aritmeticke instrukcije (0010011), LW
(0000011), SW (0100011), LUI (0110111) i AUIPC (0010111). Instrukcije skoka
i grananja (JAL, JALR, BEQ/BNE/BLT/BGE/BLTU/BGEU) su dekodirane u
`ControlWord.v`, ali `pc.v` **uvek** radi PC = PC + 4 bez obzira na
`Branch`/`Jump` signale — PC modul ih uopste ne koristi. To znaci da skokovi
trenutno nisu funkcionalno implementirani, sto se i poklapa sa vasim
zahtevom da se za sada testiraju samo instrukcije koje nisu skokovi.

Takodje, iz `DataMemory.v` se vidi da se `funct3` za LW/SW uopste ne
razlikuje — memorija je uvek pun 32-bitni word. Zato su testirani samo LW i
SW (bez LB/LH/LBU/LHU/SB/SH, jer kolo za njih nema logiku).

Dobijate 4 testbench fajla, koji ukupno pokrivaju **23 instrukcije**:

| Fajl               | Instrukcije |
|---------------------|-------------|
| `tb_rtype.v`        | ADD, SUB, AND, OR, XOR, SLT, SLTU, SLL, SRL, SRA |
| `tb_itype.v`        | ADDI, ANDI, ORI, XORI, SLTI, SLTIU, SLLI, SRLI, SRAI |
| `tb_upper.v`        | LUI, AUIPC |
| `tb_loadstore.v`    | SW, LW |

## Kako testovi rade (bitno da razumete pre pokretanja)

Vasa `InstructionMemory.v` cita instrukcije iz `ROM1` — Quartus megafunkcije
(verovatno inicijalizovane `.mif` fajlom) koja **nije bila u prilogu**. Bez
tog fajla ne mogu da znam kako da vam ucitam proizvoljan test-program u ROM.

Zato testbench-evi koriste jednostavniji i potpuno pouzdan trik: umesto da
pisu program u ROM, oni **direktno "forsiraju" (`force`) signal
`INSTRUCTIONS`** unutar top-level modula `Riscv32i`, na vrednost instrukcije
koju zele da testiraju, taman pre nego sto dodje takt. Time PC/ROM postaju
irelevantni za testiranje — testira se iskljucivo prava logika procesora
(RegFile, ALU, ALUDecoder, ControlWord, ImmediateGenerator, DataMemory).
Ovo je standardna tehnika za testiranje datapath-a kada nemate spreman
program u ROM-u, i radi bez ikakvih izmena na vasem kodu.

Posto `Riscv32i` na svojim izlaznim portovima ima samo `RESULT`, `N`, `Z`
(ne i sadrzaj registara), testbench-evi za proveru upisa u registarski fajl
koriste **hijerarhijski pristup** internim signalima, npr:

```
uut.b2v_inst3.OUT5_   // vrednost registra x5 (instanca REGFILE je "b2v_inst3")
```

Ovo je moguce jer u ModelSim-u mozete adresirati bilo koji unutrasnji signal
preko pune hijerarhijske putanje, cak i ako nije port. Imena instanci
(`b2v_inst3` za REGFILE, itd.) preuzeta su direktno iz vaseg `Riscv32i.v`.

## Kako pokrenuti u ModelSim-u

1. Otvorite ModelSim i napravite novi projekat (ili radite iz komandne
   linije/Transcript prozora — uputstvo dole vazi za oba nacina).
2. Dodajte **sve** originalne module iz vaseg Quartus projekta
   (`Riscv32i.v`, `ALU.v`, `ALUDecoder.v`, `ControlWord.v`, `DataMemory.v`,
   `ImmediateGenerator.v`, `ImmediateGenTypes.v`, `InstructionMemory.v`,
   `pc.v`, `REGFILE.v`), **kao i sve pomocne module** koje Quartus
   generise a nisu bili u ovom prilogu (`ADD32`, `SUB32`, `CMP32`, `CMP4`,
   `CMP8`, `MPX2_32BIT`, `MPX4_32BIT`, `MPX4_4bit`, `MPX5_32bit`,
   `MPX16_32BIT`, `MPX32_32bit`, `MPX32_32bit_2`, `REG32_LD_CL`,
   `REG32_LD_CL_INC_DEC`, `DEC5`, `AND32`, `AND2_32BIT`, `OR2_32BIT`,
   `XOR2_32BIT`, `SL5_32BIT`, `SRA_SRL_32BIT`, `ROM1`, `RAM2`). Ovi fajlovi
   sigurno postoje u vasem Quartus projektu (bez njih projekat ne bi mogao
   ni da se sintetise), samo nisu bili u zip-u koji ste poslali — potrazite
   ih u folderu projekta (obicno pored ostalih `.v` fajlova, ili unutar
   `simulation/modelsim` foldera koji Quartus automatski generise sa
   `Simulation > Generate Verilog Simulation Model` odnosno preko
   `Tools > Generate ModelSim Testbench`).
3. Dodajte jedan od test fajlova (npr. `tb_rtype.v`).
4. Kompajlirajte sve (`Compile > Compile All`).
5. Pokrenite simulaciju sa test modulom kao top-level, npr:
   ```
   vsim tb_rtype
   ```
6. (Opciono, ali preporuceno) Dodajte signale na Wave prozor pre `run`:
   ```
   add wave -r /tb_rtype/*
   ```
7. Pokrenite:
   ```
   run -all
   ```
8. Pratite **Transcript prozor** — svaki test ispisuje `[ OK ]` ili
   `[FAIL]` sa ocekivanom i dobijenom vrednoscu. Na kraju se ispisuje
   ukupan broj neuspesnih provera.

Ponovite korake 3–8 za `tb_itype.v`, `tb_upper.v` i `tb_loadstore.v`
(svaki put samo zamenite koji je test-fajl kompajliran/pokrenut kao top,
ostali fajlovi modula ostaju isti).

## Pregled testova i ocekivanih rezultata

Svuda vazi: **x0 je uvek 0** (nikad se ne upisuje — potvrdjeno u
`REGFILE.v`), sto testovi koriste za pripremu vrednosti (npr. `SUB x, x0, x1`
daje negativnu vrednost `-x1`).

### tb_rtype.v — R-tip instrukcije

Priprema: `x1 = 0x00003000` (LUI), `x2 = 0x00001000` (LUI), `x6 = 13` (ADDI).

| Instrukcija | Operandi | Ocekivan RESULT / x3 |
|---|---|---|
| ADD  | x1+x2   | `0x00004000` |
| SUB  | x1-x2   | `0x00002000` |
| AND  | x1&x2   | `0x00001000` |
| OR   | x1\|x2  | `0x00003000` |
| XOR  | x1^x2   | `0x00002000` |
| SLT  | x1<x2 (signed)   | `0` (12288 nije < 4096) |
| SLTU | x1<x2 (unsigned) | `0` |
| SLL  | x1<<x6 (13)  | `0x06000000` |
| SRL  | x1>>x6 (13)  | `0x00000001` |
| SRA  | x1>>>x6 (13) | `0x00000001` (pozitivan operand, isto kao SRL) |

Dodatno, test sa negativnim brojem: `x4 = 0 - x1 = 0xFFFFD000` (-12288),
zatim:
- `SLT x5,x4,x2` (signed: -12288 < 4096) → `1`
- `SLTU x5,x4,x2` (unsigned: 0xFFFFD000 < 0x1000? ne) → `0`
- `SRA x14,x4,x6` (aritmeticki pomeraj negativnog broja za 13) → `0xFFFFFFFE` (-2), znak mora ostati ocuvan (prosiren jedinicama)

### tb_itype.v — I-tip aritmeticke instrukcije

Priprema: `x1 = 0x00003000` (LUI).

| Instrukcija | Ocekivan x10 |
|---|---|
| ADDI x10,x1,100   | `0x00003064` |
| ADDI x10,x1,-50   | `0x00002FCE` (proverava sign-extend negativnog immediate-a) |
| ANDI x10,x1,0x0F0 | `0x00000000` |
| ORI  x10,x1,0x0F0 | `0x000030F0` |
| XORI x10,x1,0x0F0 | `0x000030F0` |
| SLTI x10,x1,100   | `0` |
| SLTI x10,x1,-50   | `0` |
| SLTIU x10,x1,100  | `0` |
| SLLI x10,x1,5     | `0x00060000` |
| SRLI x10,x1,5     | `0x00000180` |
| SRAI x10,x1,5     | `0x00000180` |

### tb_upper.v — LUI i AUIPC

- `LUI x11, 0xAB` → `x11 = 0x000AB000`
- `AUIPC x12, 0x2` → `x12 = PC(u tom taktu) + 0x00002000` (testbench ovo
  racuna dinamicki citajuci `uut.PC`, jer PC u ovom testu slobodno raste
  svaki takt nezavisno od "forsirane" instrukcije)

**Vazna napomena (moguci bag):** U `ControlWord.v`, `ALUSrcA` je `1` samo za
AUIPC, a `0` za sve ostalo — ukljucujuci LUI. To znaci da za LUI operand A
ide iz `RS1DATA` (registar na poziciji bitova `[19:15]` instrukcije), a ne
fiksno 0, iako standardni RISC-V LUI treba da racuna samo `immediate + 0`.
Test je konstruisan tako da immediate ima nule bas na tim bitovima (pa
test prolazi cak i ako je ovo bag), ali **preporucujem da rucno proverite**
da li vam ALUSrcA treba da bude aktivan i za LUI, ne samo za AUIPC — u
suprotnom, LUI ce davati pogresan rezultat za immediate vrednosti kod kojih
gornjih 5 bita 20-bitnog immediate-a (bitovi [19:15] instrukcije) nisu nula.

### tb_loadstore.v — SW i LW

Priprema: `x1 = 0x00003000` (LUI).

- `SW x1, 0x40(x0)` → RESULT (adresa) = `0x00000040`, ocekuje se da memorija
  na adresi `0x40` postane `0x00003000`
- `LW x13, 0x40(x0)` → RESULT (adresa) = `0x00000040`, `x13 = 0x00003000`

Kako `DataMemory.v` koristi Quartus RAM megafunkciju (`RAM2`) cija sadrzina
nije direktno vidljiva sa top-level porta, glavni dokaz da SW radi jeste
upravo naredni LW test: ako on procita tacno `0x00003000`, SW je zaista
upisao ispravnu vrednost na ispravnu adresu.

## Druga napomena (moguci bag u ImmediateGenerator.v)

Analizom `ControlWord.v` primetio sam da se `immSrc = 000` koristi i za
I-tip (ADDI i sl.), LW i JALR — sto sugerise da mux u
`ImmediateGenerator.v` (megafunkcija `MPX5_32bit`) treba da za `sel = 0`
propusti `I_TYPE` granu. Medjutim, u `ImmediateGenerator.v` redosled
povezivanja ulaza multipleksera je `data0x = J_TYPE, data1x = U_TYPE,
data2x = B_TYPE, data3x = S_TYPE, data4x = I_TYPE` — ako `MPX5_32bit`
interno bira `data0x` kada je `sel = 0` (uobicajena konvencija), onda bi
`immSrc = 000` zapravo birao `J_TYPE`, a ne `I_TYPE`. Ne mogu ovo sa
sigurnoscu da potvrdim jer `MPX5_32bit.v` nije bio u prilogu, ali **ako vam
`tb_rtype.v` prodje, a `tb_itype.v` / `tb_upper.v` / `tb_loadstore.v` ne
prodju** (posebno ako su RESULT vrednosti sistematski pogresne, a ne samo
za po jedan bit), prvo proverite bas ovaj deo — redosled ulaza
multipleksera u odnosu na kodiranje `immSrc` signala.

## Sazetak fajlova u prilogu

- `tb_rtype.v` — testbench za R-tip instrukcije
- `tb_itype.v` — testbench za I-tip aritmeticke instrukcije
- `tb_upper.v` — testbench za LUI i AUIPC
- `tb_loadstore.v` — testbench za LW i SW
- `UPUTSTVO.md` — ovaj dokument
