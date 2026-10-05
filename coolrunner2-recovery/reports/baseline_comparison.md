# Nowy golden readback 2026 — pierwszy structural diff

**Aktywny golden: original/readback-2026/pm_cpld_gold_2026.jed. Poprzednia deklaracja bit identity dotyczy wyłącznie original/amplcpld.jed, nie tego odczytu.**

SHA256: `1748e3c4f0f6152bd395d0a88df1e3a2214ec31fe0e704e11e77b854556f3d95`. QF=55341, checksum C=AC57, transmission=E87B; oba poprawne, wszystkie fuse pokryte.

Nagłówek: `JEDEC Programming File for /home/ise/Desktop/bits/pm_cpld_gold_2026.jed
Date: Fri Jul 10 10:09:57 2026`. DEVICE xc2c128-XXXXX; QP0: ten plik nie deklaruje package ani speed. Mapowanie pinów VQ100 stosujemy na podstawie dostarczonego schematu/targetu, nie QP0.

Rzeczywisty dotychczasowy build historycznego HDL w ISE 14.7 różni się o **1412/55341 fuse** i **1346 canonical scalar fields**. Poprzedni załącznik i poprawiony recovered build miały identyczną konfigurację z tym baseline, więc mają również 1412 fuse różnic względem nowego golden.

Decode→assemble nowego golden: **0 fuse różnic**. To waliduje bezstratność dekodowania, nie dowodzi zgodności HDL. Stare SAT/state_map/vectors nie są dowodem dla nowego golden.

| Obszar | Różne fuse |
|---|---:|
| FB1 ZIA | 53 |
| FB1 PLA AND | 489 |
| FB1 PLA OR | 80 |
| FB1 MC/IOB configuration | 70 |
| FB2 ZIA | 46 |
| FB2 PLA AND | 39 |
| FB2 PLA OR | 11 |
| FB2 MC/IOB configuration | 60 |
| FB3 ZIA | 43 |
| FB3 PLA AND | 198 |
| FB3 PLA OR | 68 |
| FB3 MC/IOB configuration | 51 |
| FB4 MC/IOB configuration | 4 |
| FB5 MC/IOB configuration | 26 |
| FB6 MC/IOB configuration | 24 |
| FB7 ZIA | 20 |
| FB7 PLA AND | 72 |
| FB7 PLA OR | 18 |
| FB7 MC/IOB configuration | 29 |
| FB8 MC/IOB configuration | 7 |
| Globals | 4 |

## Global configuration

| Pole | Nowy golden | Historyczny baseline |
|---|---|---|
| BANK0_IBUF_VOLT | HIGH | LOW |
| BANK0_OBUF_VOLT | HIGH | LOW |
| BANK1_IBUF_VOLT | HIGH | LOW |
| BANK1_OBUF_VOLT | HIGH | LOW |

HIGH/LOW oznacza wybór konfiguracji bufora, nie zmierzone napięcie zasilania. Nie wyciągamy wniosków o rzeczywistych napięciach z tych etykiet.

## Znane wyjścia: różnice pól

| Pin | Pole | Nowy golden | Baseline |
|---:|---|---|---|
| 16 | CLK_MUX | FCLK0 | FCLK2 |
| 16 | MC_IOB_MUX | XOR | REG |
| 16 | REG_MODE | DFF | DFFCE |
| 16 | XOR_MUX | PT | GND |
| 99 | REG_INIT | 1 | 0 |
| 99 | XOR_MUX | VCC | GND |
| 97 | REG_INIT | 1 | 0 |
| 97 | XOR_MUX | VCC | GND |
| 96 | REG_INIT | 1 | 0 |
| 96 | XOR_MUX | VCC | GND |
| 95 | REG_INIT | 1 | 0 |
| 95 | XOR_MUX | VCC | GND |
| 94 | REG_INIT | 1 | 0 |
| 94 | XOR_MUX | VCC | GND |
| 93 | REG_INIT | 1 | 0 |
| 93 | XOR_MUX | VCC | GND |
| 92 | REG_INIT | 1 | 0 |
| 92 | XOR_MUX | VCC | GND |
| 91 | REG_INIT | 1 | 0 |
| 91 | XOR_MUX | VCC | GND |
| 90 | REG_INIT | 1 | 0 |
| 90 | XOR_MUX | VCC | GND |
| 54 | REG_INIT | 0 | 1 |
| 81 | IOB_SLEW | FAST | SLOW |
| 81 | REG_INIT | 1 | 0 |
| 82 | REG_INIT | 1 | 0 |
| 82 | XOR_MUX | PT_INV | PT |
| 85 | REG_INIT | 1 | 0 |
| 86 | REG_INIT | 1 | 0 |
| 86 | XOR_MUX | VCC | GND |
| 87 | REG_INIT | 1 | 0 |
| 87 | XOR_MUX | VCC | GND |
| 89 | REG_INIT | 1 | 0 |
| 89 | XOR_MUX | VCC | GND |
| 53 | REG_INIT | 1 | 0 |

Pin81/CLK40: nowy golden FAST, baseline SLOW. To rzeczywista różnica ustawienia wyjścia zegarowego. Sama nie wyjaśnia wszystkich 1412 fuse. Zmiany INIT/XOR/register routing wymagają mapowania stanów i interpretacji eksportu readback; nie można automatycznie utożsamiać każdej z nich ze zmianą funkcji.

## Potwierdzona delta event-chain

Nowy golden: P16 EV_OUT jest wyjściem kombinacyjnym MC_C0B1MC3 z równaniem IOB_C0B5MC3, czyli bezpośrednio P60 EV_IN. Baseline: P16 jest wyjściem rejestru DFFCE na rising FCLK2, z kwalifikacją count=127/cal_str. To różnica funkcjonalna. tools/prove_readback_2026.py sprawdza P16=P60 metodą SAT z AND/OR czytanych bezpośrednio z fuse. Witness: EV_IN wzrasta między krawędziami CLK80, przy starym EVOUT=0; nowy model natychmiast daje 1, baseline nadal 0. Wynik w tests/readback-2026-ev-proof.json.

Nowy golden ma dodatkowy niezależny toggle STR: FB3/MC8 TFF, falling CT4=P63, T=1. Równolegle istnieje FB6/MC1 toggle warunkowy ENA jak wcześniej. Znaczenie dalszego przetwarzania obu ścieżek wymaga odzyskania struktury.

## Dalsza analiza

Należy ustalić nowe state mapping, uprościć equations i porównać transition relations oraz osiągalne zachowanie. Liczba różnych pól jest placement-sensitive. Nie deklarujemy obecnie równoważności nowego golden z historycznym ani recovered HDL. Security/DONE/USERCODE poza QF nadal nieweryfikowane. Hardware nie programowany.

Dokumentacja IS_GND: [Project Combine device structure](https://prjcombine.org/coolrunner2/structure.html) opisuje programmed ground jako stałe wyjście 0. Nowy readback ma 54 takie pola zamiast wcześniejszych niewłączonych wyjść/keeper; nie są to 54 dodatkowe sygnały logiczne.

Polecenie: tools/analyze_readback_2026. Pełne equations: decoded/readback-2026/original.txt; szczegółowy diff: experiments/readback-2026/baseline-structural-diff.json.
