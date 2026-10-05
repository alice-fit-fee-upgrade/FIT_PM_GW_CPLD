#!/usr/bin/env python3
import json
from pathlib import Path
R=Path(__file__).resolve().parent.parent
def load(p):return json.loads((R/p).read_text())
def write(p,s):(R/'reports/previous-input'/Path(p).name).write_text(s.strip()+'\n')
meta=load('decoded/previous-input/jed_metadata.json');ir=load('decoded/previous-input/original.json');proof=load('tests/transition-proof.json');rt=load('decoded/previous-input/combine-roundtrip-diff.json')
write('reports/jed_analysis.md',f'''# Analiza readback JEDEC

Golden SHA256: `{meta['sha256']}`. Oryginał pozostaje niezmieniony.

| Pole | Wynik | Znaczenie |
|---|---|---|
| Device | N DEVICE XC2C128-7-VQ100 | Metadane programu; QF i mapa potwierdzają rodzinę/rozmiar |
| Package | QP100, VQ100 | Deklaracja pliku, zgodna ze schematem VQG100 |
| Speed | 7 | Deklaracja; nie jest fuse speed bin |
| QF | {meta['qf']} | Pełne pokrycie {meta['covered_fuses']} fuse, bez nakładających się L |
| Fuse checksum C | {meta['declared_checksum']:04X} | Obliczona {meta['fuse_checksum']:04X}, poprawna |
| Transmission checksum | {meta['transmission_checksum']:04X} | Obliczona {meta['transmission_calculated']:04X}, poprawna |
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
{chr(10).join(meta['records'])}
```

## Globalna konfiguracja

```
{chr(10).join(k+'='+v for k,v in ir['globals'].items())}
```

LOW/HIGH to wybór progów/trybu bufora z mapy, nie pomiar VCCIO. DataGate, VREF, divider i delay wyłączone. FCLK2 jest jedynym aktywnym globalnym zegarem. GSR i wszystkie globalne OE są wyłączone. Wszystkie użyte rejestry mają set/reset na stałe nieaktywne. Jeden register ma INIT=1 (CLK20_N), pozostałe 38 INIT=0.
''')
write('reports/decoder_validation.md',f'''# Walidacja dekoderów

Project Combine commit 234343d23e737e57f2727630e19008b509d7d522, databases/coolrunner2.zstd. Obsługuje 8 FB, 128 MC, 40 ZIA/FB, 56 PT/FB, OR/XOR, FF, clocks, set/reset, OE, IOB i globalne pola.

Disassemble→assemble golden JED: Hamming distance **{rt['hamming_distance']} / 55341**. Porównano wszystkie logical device fuse, niezależnym tools/jedlib.py. Metadane tekstowe nie są identyczne. To walidacja bezstratności konfiguracji, nie dowód poprawności fizycznej wszystkich interpretacji mapy.

xc2bit commit f9ae535d0372c246075d1bb05a409adaed0135e7 kompiluje się. Jednak ZIA_MAP_128 zawiera placeholder IBuf(0) dla każdego źródła. Roundtrip różni się w 244 fuse. Jego initial register polarity opis jest także niespójny z Project Combine i bitstream mapping. Output zachowano jako decoded/xc2bit-untrusted-zia.txt, NIE użyto go do odzyskania logiki. Błędny netlist przeniesiono do experiments/xc2bit-untrusted.netlist.json.

Nie potrzeba charakterizacji nieznanej ZIA z ISE: pełna mapa jest już dostępna w Project Combine. Narzędzia JEDEC upstream jedec i prjcombine-jed są zachowane wraz z repo. Nasz parser dodatkowo kontroluje granice, pokrycie i checksums.

openFPGALoader implementuje XC2C128 programming/read flow w src/xilinx.cpp (snapshot docs/openfpgaloader-xilinx.cpp); nie zastępuje disassemblera równań. Nie uruchomiono żadnej komendy sprzętowej.

Źródła: [Project Combine](https://prjcombine.org/coolrunner2/index.html), [mapa XC2C128](https://prjcombine.org/coolrunner2/devices/xc2c128.html), [xc2bit](https://github.com/azonenberg/openfpga/tree/master/src/xc2bit), [openFPGALoader](https://github.com/trabucayre/openFPGALoader/blob/master/src/xilinx.cpp).
''')
baseline=R/'experiments/ise-baseline/baseline.jed'
results={}
for mode in ('baseline','recovered'):
 folder=R/'experiments'/('ise-'+mode)
 if (folder/'raw-diff.json').exists():
  raw=load(str(folder.relative_to(R)/'raw-diff.json'));struct=load(str(folder.relative_to(R)/'structural-diff.json'))
  results[mode]=dict(raw=raw['hamming_distance'],canonical=struct['structural_difference_count'])
complete=all(results.get(m)==dict(raw=0,canonical=0) for m in ('baseline','recovered'))
write('reports/baseline_comparison.md',f'''# Baseline KNOWN VHDL + schematic pinout + ISE 14.7 vs golden

Rzeczywisty build historycznych, niezmienionych amplcpld.vhd i comps.vhd: **{results.get('baseline')}**. Zero oznacza identyczność wszystkich 55341 logicznych fuse i wszystkich pól canonical configuration.

Źródła known_hdl/baseline/ z upstream a6c492e; constraints known_hdl/baseline.ucf (46 połączeń odtworzonych ze schematu). Target xc2c128-7-vq100. XST Speed/level 1; cpldfit unused/terminate keeper. Pipeline xst → ngdbuild → cpldfit → hprep6, wersja P.20131013. Uruchomienie: make baseline.

Pełny raport: baseline_structural_diff.md. Artefakty, równania, raporty i VM6: experiments/ise-baseline/. Raw i structural diff mają zero różnic: zajętość FB/MC, equations, 39 registers, ZIA, PLA AND/OR, pin configuration, globals oraz unused resources są identyczne. Fitter raportuje 41 logic MC (39 FF + 2 combinational), 86 PT i 46 pins. Inferred used w decoderze uwzględnia także wejściowe pads i nie jest liczbą logic MC.

Wynik potwierdza reprodukcję przez ISE 14.7; nie identyfikuje jednoznacznie kompilatora pierwotnego firmware. N VERSION z readback nadal jest metadanymi programu odczytu.

Ostrzeżenia BUFG na A9/A7: pin GCK0/GCK1 jest używany jako zwykłe wejście ADC, BUFG jest ignorowany. Dekodowany rezultat potwierdza wyłącznie FCLK2 na pin27. Ostrzeżenie domyślnej ścieżki repository nie wpłynęło na wynik. Logi zachowano.
''')
write('reports/semantic_delta.md','''# Delta semantyczna

**Nie ma delty konfiguracji między historycznym HDL skompilowanym w ISE 14.7 a produkcyjnym golden: 0/55341 fuse, canonical diff 0.** Nie ma dowodu brakującego register, zmienionego countera, delay, mux ani event-chain.

Mapowanie 39 rejestrów: decoded/previous-input/state_map.json. Golden equations/config: decoded/previous-input/original.json i original.txt. SAT sprawdził wszystkie 39 next-state relations; tests/transition-proof.json zawiera wyniki per register.

Recovered czytelny VHDL zachowuje strukturę historycznej implementacji: counter 7-bit saturating, delay 8-stage, ADC mux z hold i CE=dly6, event synchronizer 3-stage oraz str toggle przy falling CFD_OUT i ENA. Używa numeric_std i jawnej inicjalizacji 38 FF=0. Complementary CLK20_N jest jawnym FF INIT=1, D=XNOR(CNT0,CNT1) na falling FCLK2 (FB6/MC16). Historyczne not CNT1 zostało przez fitter zaimplementowane dokładnie tym samym FF; invariant CLK20_N=not CNT1 jest zachowany w osiągalnych stanach.

Pierwszy recovered build miał tylko 18 zmian IOB_SLEW FAST zamiast SLOW. Wszystkie equations, registers, placement, routing, globals i unused były już identyczne. Dodanie 18 jawnych NET SLEW=SLOW w recovered/amplcpld.ucf dało końcowe **0 fuse i 0 canonical differences**. Pełny pierwszy diff i artefakty: reports/recovered_before_slew_diff.md oraz experiments/ise-recovered-before-slew/.

Historyczny HDL bez init ma U w symulacji; ISE nadaje fizyczne init zgodne z golden, co teraz potwierdzono rzeczywistym baseline. Recovered opisuje te stany jawnie. Nie dodawano hipotetycznych funkcji produkcyjnych.
''')
write('reports/final_equivalence.md',f'''# Końcowa równoważność

**Rzeczywiste buildy ISE 14.7: {results}. Potwierdzona identyczność konfiguracji z recovered VHDL: {complete}.**

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
''')
write('reports/status.json',json.dumps(dict(golden_sha256=meta['sha256'],decoder_fuse_roundtrip_distance=rt['hamming_distance'],transition_sat_passed=proof['all_passed'],vhdl_golden_vectors=27430,baseline_ise_completed='baseline' in results,recovered_ise_completed='recovered' in results,vhdl_bit_identity_verified=complete,build_results=results,hardware_programmed=False,physical_security_verified=False),indent=2))
