# Weryfikacja nowego golden 2026

**Odzyskano czytelny HDL i potwierdzono jego funkcję, lecz nie bit identity. Pozostaje 346 fuse różnic po rzeczywistym buildzie ISE 14.7.**

| Kryterium | Wynik |
|---|---|
| Golden SHA256/checksums | zachowane/poprawne |
| Decode→assemble | 0/55341 |
| Historical baseline | 1412/55341, funkcjonalnie różny (EV_OUT) |
| Raw golden → recovered architecture SAT | 49/49 UNSAT, init/clocks zgodne |
| Actual recovered VHDL simulation | 67430 golden vectors PASS |
| Actual ISE fitted JED → same architecture SAT | 49/49 UNSAT, init/clocks zgodne |
| State placement | identyczny FB/MC dla wszystkich 49 FF |
| Globals, IOB fields, slew/Schmitt | identyczne |
| Bit identity VHDL→ISE | NIE; 346 fuse różnic |
| Timing/physical hardware | nie zweryfikowano, nie programowano |

SAT korzysta z AND/OR czytanych bezpośrednio z fuse oraz mapy routingu Project Combine. Dowód dla fitted JED używa nazw i pozycji z rzeczywistego raportu fittera, niezależnie mapując stan. Równość lokalnych transitions + init + event clocks pozwala indukcyjnie porównać idealne uporządkowane zdarzenia. EV_OUT combinational identity ma osobny dowód. Nie wykonano oddzielnego formal frontend VHDL proof; rzeczywisty VHDL był symulowany, a faktyczny wynik kompilacji był sprawdzony SAT.

Wektory obejmują obie fazy CLK80, osobne STR edges, ENA=0/1, losowe ADC inputs, EV oraz długi brak STR umożliwiający timer restart i calibration transfers. Nie modelują analogowych delays/metastability/setup/hold ani jednoczesnych krawędzi domen.

Każdy pozostały obszar i fuse opisano w remaining_differences.md oraz experiments/readback-2026/remaining-fuses.json. PLA/routing/factoring mogą zmieniać timing mimo identycznej funkcji. Nie deklarujemy, że 100% bit match jest niemożliwy ani że ten JED jest gotowym zamiennikiem golden na sprzęcie.

Nieznane provenance narzędzia odczytu i fizyczne security pozostają jawne. Schemat/HDL historia/ISE userspace są zachowane. Hardware validation wymaga późniejszej wyraźnej zgody na programowanie. make reproduce odtwarza aktualny workflow, make reproduce-previous historyczny eksperyment dla starego wejścia.

## Dodatkowy implementation lock

Po jawnym blokowaniu PLA w VM6 i generacji przez Xilinx hprep6 uzyskano 0/55341 fuse oraz 0 canonical differences. Jest to dodatkowy backend wykorzystujący template alokacji/równań z golden, nie bit-identical wynik samego fittera. Locked JED: recovered/amplcpld_implementation_locked.jed. Szczegóły i zakres dowodów: reports/implementation_lock.md.
