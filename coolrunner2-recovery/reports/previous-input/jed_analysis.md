# Analiza readback JEDEC

Golden SHA256: `89a231fd49b87f26f3ecd0dd2040c4d5aefbe79a1d6d48a71be09df73dd645e6`. Oryginał pozostaje niezmieniony.

| Pole | Wynik | Znaczenie |
|---|---|---|
| Device | N DEVICE XC2C128-7-VQ100 | Metadane programu; QF i mapa potwierdzają rodzinę/rozmiar |
| Package | QP100, VQ100 | Deklaracja pliku, zgodna ze schematem VQG100 |
| Speed | 7 | Deklaracja; nie jest fuse speed bin |
| QF | 55341 | Pełne pokrycie 55341 fuse, bez nakładających się L |
| Fuse checksum C | EECE | Obliczona EECE, poprawna |
| Transmission checksum | 75A4 | Obliczona 75A4, poprawna |
| F | 0 | Domyślna wartość niepodanych fuse; wszystkie są podane |
| QV | 0 | Brak wektorów JEDEC |
| X | 0 | Pole domyślnego stanu testowego; nie read-protection |
| J | 0 0 | Deklaracja identyfikatora formatu, nie pomiar JTAG IDCODE |
| G/security record | brak | Stan security nie jest zapisany jawnie |

## Pochodzenie informacji

Fuse zawarte w L records traktujemy jako dostarczony odczyt działającego układu. Ich pochodzenie fizyczne jest informacją użytkownika; nie wykonano nowego odczytu sprzętowego. Brak zarejestrowanego IDCODE, napięć i sesji programatora.

Nagłówek `Date Extracted: Wed Nov 20 18:07:27 2024`, `N VERSION P.20131013`, `N DEVICE`, QP, opisy bloków i opisy pól dodaje narzędzie zapisujące JEDEC. Nie dowodzą daty kompilacji ani wersji oryginalnego fittera. Wersja jest zgodna z hipotezą readback przez iMPACT/ISE 14.7, lecz nie traktujemy jej jako dowodu kompilatora.

Nie ma podstaw do określenia security jako enabled/disabled z tego pliku. Security/DONE/USERCODE są zasobami fizycznego interfejsu, a nie wyodrębnionymi tutaj polami 55341-fuse konfiguracji logicznej. Możliwość odczytu nie zastępuje protokołu odczytu statusu.

## Struktura i wszystkie NOTE/N

STX, records rozdzielone `*`, ETX, czterocyfrowy checksum transmisji. Każdy z 8 FB ma ZIA (40×28), AND (56×80), OR (56×16), następnie konfigurację macrocells. Mapy opisują 29-bit bonded IOB i 16-bit buried MC; napis readback `15 if buried` jest niespójny z mapą/adresami. Globalne pola zaczynają się pod adresem 55316, długość 25.

Pełna lista records innych niż L jest zachowana poniżej i w decoded/previous-input/jed_metadata.json:

```
QF55341
QP100
QV0
F0
X0
J0 0
N VERSION P.20131013
N DEVICE XC2C128-7-VQ100
Note Block 0
Note Block 0 ZIA
Note Block 0 PLA AND array
Note Block 0 PLA OR array
Note Block 0 I/O Macrocell Configuration 29 bits (15 if buried)
N Aclk Clk:2 ClkFreq ClkOp DG FB:2 InMod:2 InReg INz:2 Oe:4 P:2 Pu RegCom RegMod:2 R:2 Slw Tm XorIn:2
N Aclk Clk:2 ClkFreq ClkOp FB:2 P:2 Pu RegMod:2 R:2 XorIn:2
Note Block 1
Note Block 1 ZIA
Note Block 1 PLA AND array
Note Block 1 PLA OR array
Note Block 1 I/O Macrocell Configuration 29 bits (15 if buried)
N Aclk Clk:2 ClkFreq ClkOp DG FB:2 InMod:2 InReg INz:2 Oe:4 P:2 Pu RegCom RegMod:2 R:2 Slw Tm XorIn:2
N Aclk Clk:2 ClkFreq ClkOp FB:2 P:2 Pu RegMod:2 R:2 XorIn:2
Note Block 2
Note Block 2 ZIA
Note Block 2 PLA AND array
Note Block 2 PLA OR array
Note Block 2 I/O Macrocell Configuration 29 bits (15 if buried)
N Aclk Clk:2 ClkFreq ClkOp DG FB:2 InMod:2 InReg INz:2 Oe:4 P:2 Pu RegCom RegMod:2 R:2 Slw Tm XorIn:2
N Aclk Clk:2 ClkFreq ClkOp FB:2 P:2 Pu RegMod:2 R:2 XorIn:2
Note Block 3
Note Block 3 ZIA
Note Block 3 PLA AND array
Note Block 3 PLA OR array
Note Block 3 I/O Macrocell Configuration 29 bits (15 if buried)
N Aclk Clk:2 ClkFreq ClkOp DG FB:2 InMod:2 InReg INz:2 Oe:4 P:2 Pu RegCom RegMod:2 R:2 Slw Tm XorIn:2
N Aclk Clk:2 ClkFreq ClkOp FB:2 P:2 Pu RegMod:2 R:2 XorIn:2
Note Block 4
Note Block 4 ZIA
Note Block 4 PLA AND array
Note Block 4 PLA OR array
Note Block 4 I/O Macrocell Configuration 29 bits (15 if buried)
N Aclk Clk:2 ClkFreq ClkOp DG FB:2 InMod:2 InReg INz:2 Oe:4 P:2 Pu RegCom RegMod:2 R:2 Slw Tm XorIn:2
N Aclk Clk:2 ClkFreq ClkOp FB:2 P:2 Pu RegMod:2 R:2 XorIn:2
Note Block 5
Note Block 5 ZIA
Note Block 5 PLA AND array
Note Block 5 PLA OR array
Note Block 5 I/O Macrocell Configuration 29 bits (15 if buried)
N Aclk Clk:2 ClkFreq ClkOp DG FB:2 InMod:2 InReg INz:2 Oe:4 P:2 Pu RegCom RegMod:2 R:2 Slw Tm XorIn:2
N Aclk Clk:2 ClkFreq ClkOp FB:2 P:2 Pu RegMod:2 R:2 XorIn:2
Note Block 6
Note Block 6 ZIA
Note Block 6 PLA AND array
Note Block 6 PLA OR array
Note Block 6 I/O Macrocell Configuration 29 bits (15 if buried)
N Aclk Clk:2 ClkFreq ClkOp DG FB:2 InMod:2 InReg INz:2 Oe:4 P:2 Pu RegCom RegMod:2 R:2 Slw Tm XorIn:2
N Aclk Clk:2 ClkFreq ClkOp FB:2 P:2 Pu RegMod:2 R:2 XorIn:2
Note Block 7
Note Block 7 ZIA
Note Block 7 PLA AND array
Note Block 7 PLA OR array
Note Block 7 I/O Macrocell Configuration 29 bits (15 if buried)
N Aclk Clk:2 ClkFreq ClkOp DG FB:2 InMod:2 InReg INz:2 Oe:4 P:2 Pu RegCom RegMod:2 R:2 Slw Tm XorIn:2
N Aclk Clk:2 ClkFreq ClkOp FB:2 P:2 Pu RegMod:2 R:2 XorIn:2
Note Globals
Note Global Clock Mux
Note Programmable Clock Divider
Note Programmable Clock Delay
Note Global Set/Reset Mux
Note Global OE Mux
Note Global Termination
Note Data Gate Enable
Note Input Voltage Standard for IOB
Note Output Voltage Standard for IOB
Note VREF enable
CEECE
```

## Globalna konfiguracja

```
BANK0_IBUF_VOLT=LOW
BANK0_OBUF_VOLT=LOW
BANK1_IBUF_VOLT=LOW
BANK1_OBUF_VOLT=LOW
CLKDIV_DELAY_ENABLE=0
CLKDIV_DIV=16
CLKDIV_ENABLE=0
DGE_ENABLE=0
FCLK0_ENABLE=0
FCLK1_ENABLE=0
FCLK2_ENABLE=1
FOE0_MUX=NONE
FOE1_MUX=NONE
FOE2_MUX=NONE
FOE3_MUX=NONE
FSR_ENABLE=0
FSR_INV=1
TERM_MODE=KEEPER
VREF_ENABLE=0
```

LOW/HIGH to wybór progów/trybu bufora z mapy, nie pomiar VCCIO. DataGate, VREF, divider i delay wyłączone. FCLK2 jest jedynym aktywnym globalnym zegarem. GSR i wszystkie globalne OE są wyłączone. Wszystkie użyte rejestry mają set/reset na stałe nieaktywne. Jeden register ma INIT=1 (CLK20_N), pozostałe 38 INIT=0.
