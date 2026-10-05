# Końcowa równoważność

**Rzeczywiste buildy ISE 14.7: {'baseline': {'raw': 0, 'canonical': 0}, 'recovered': {'raw': 0, 'canonical': 0}}. Potwierdzona identyczność konfiguracji z recovered VHDL: True.**

| Kryterium | Wynik |
|---|---|
| Golden integrity | SHA256 zachowany, C i transmission checksums poprawne |
| Decode/assemble | 0 / 55341 fuse różnic |
| Historical HDL → ISE → JED | 0 / 55341 fuse, canonical diff 0 |
| Recovered VHDL + UCF → ISE → JED | 0 / 55341 fuse, canonical diff 0 |
| SAT local transitions | 39/39 UNSAT; clocks, init i SR sprawdzone |
| Recovered VHDL simulation | 27430 deterministic golden vectors PASS |
| Physical hardware | nie programowano ani nie testowano |

Identyczna pełna fuse map oznacza identyczne equations, FF modes/clock/polarity/init, placement, ZIA, PT allocation, pin configuration, global configuration i unused resources. Nie ma pozostałych różnic logic/placement/routing/fitter choices do wyjaśnienia. Pierwsze 18 różnic recovered były wyłącznie slew i zostały usunięte constraints.

JEDEC nie jest identyczny bajtowo: tekstowe Date Extracted oraz wynikowy checksum transmisji różnią się. To metadane pliku, nie fuse układu; fuse checksum pozostaje EECE. Security/DONE/USERCODE fizycznego interfejsu poza logical QF nie były odczytane ani zweryfikowane. Nie deklarujemy ich równoważności.

Niezależny model logiczny golden czyta AND/OR bezpośrednio z fuse i routing Project Combine. Z3 porównuje 39 lokalnych transition relations dla wszystkich Boolean states/inputs; init i event clocks są zgodne. Complementary clock invariant sprawdzony. GHDL symuluje rzeczywisty recovered VHDL na obu fazach CLK80, osobnych STR transitions, wszystkich ADC bits, okresach ENA disabled i długich EV bursts. Nie wykonano oddzielnego formal HDL frontend proof; rzeczywista kompilacja do identycznej konfiguracji stanowi dodatkowy, bezpośredni dowód implementacji.

Nie modelowano analogowych propagation delays, metastability i setup/hold violations. Hardware validation pozostaje planem w docs/hardware_validation.md. Nie ustalono historycznej wersji kompilatora wyłącznie na podstawie readback metadata.

Artefakty końcowe: recovered/amplcpld_recovered.vhd, amplcpld.ucf, amplcpld_recovered.jed. Szczegóły buildów: reports/baseline_structural_diff.md i recovered_structural_diff.md; pełne logi i raporty fittera w experiments/.
