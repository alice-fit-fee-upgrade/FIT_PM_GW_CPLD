Wersja podstawowa po angielsku: [README.md](README.md).

# CoolRunner-II FIT PM12 recovery

Aktywny golden: `original/readback-2026/pm_cpld_gold_2026.jed`, dostarczony jako odczyt fizycznego CPLD. SHA256: `1748e3c4f0f6152bd395d0a88df1e3a2214ec31fe0e704e11e77b854556f3d95`.

**Nowy readback różni się od historycznego HDL/baseline o 1412 fuse i ma potwierdzone różnice funkcjonalne. Odzyskano nowy czytelny VHDL; jego faktyczny wynik kompilacji ISE ma 49/49 funkcji przejścia zgodnych z golden, wraz z init/clocks. Sam native fitter pozostawia 346 fuse różnic. Dodatkowy jawny implementation lock VM6 + hprep6 daje 0/55341 fuse różnic względem golden. Timing equivalence nie została wykazana.**

Poprzedni załącznik `original/amplcpld.jed` (hash 89a231fd…645e6) pozostaje zachowany. Dla niego oba poprzednie buildy miały zero różnic; ten wynik nie dotyczy nowego golden. Poprzednie źródła/decode/raporty są pod `*/previous-input/`. Oryginalne dane nie zostały zmienione. Sprzętu nie programowano.

## Odtworzenie

```bash
cd coolrunner2-recovery
make bootstrap
make reproduce
```

To wykonuje historyczny baseline, dekodowanie nowego golden i bezstratny roundtrip, strukturalny diff, SAT wszystkich 49 register transitions, symulację rzeczywistego recovered VHDL na 67430 wektorach, nowy build ISE, SAT faktycznego fitted JED oraz końcowe raporty. Workflow sprawdza również 0 fuse różnic po implementation lock. Sam native fitter nie jest bit-identical. `reports/status.json` jawnie zawiera `vhdl_bit_identity_verified=false`.

Ze świeżego checkoutu: Linux x86_64/glibc ≥2.38 dla zachowanych GHDL packages; git, make, Python3, dpkg-deb, C/C++ build tools, Rust/rustup 1.99.0. `make bootstrap` odtwarza przypięte decoder sources, Cargo locks, hashed Python dependencies, GHDL i compatibility libraries oraz pełne mirrors z Git bundles. Rust bootstrap jest w toolchain/rustup-init.sh. Biblioteki są rozpakowane lokalnie, bez sudo. Bootstrap wymaga internetu.

ISE dostarczony osobno: na tym hoście `$HOME/.local/opt/xilinx/14.7/ISE_DS`. Instalator, hash, userspace i obejścia opisano w [docs/ise.md](docs/ise.md). Inny prefix: `ISE_SETTINGS=/path/to/ISE_DS/settings64.sh make reproduce`. Vendor binaries/license nie są redystrybuowane. Na tym hoście CLI działa bez dodatkowego pliku licencji.

Historyczny workflow dla poprzedniego wejścia: `make reproduce-previous`. Nie nadpisuje aktualnych głównych recovered/decode/raportów.

## Artefakty

- [recovered/amplcpld_recovered.vhd](recovered/amplcpld_recovered.vhd), [amplcpld.ucf](recovered/amplcpld.ucf) i wynikowy JED — dotyczą nowego golden; kopie w recovered/readback-2026.
- [decoded/original.json](decoded/original.json), [original.txt](decoded/original.txt), state_map.json — nowy golden, wszystkie FB/MC/equations/configuration.
- [reports/baseline_comparison.md](reports/baseline_comparison.md), [semantic_delta.md](reports/semantic_delta.md), [final_equivalence.md](reports/final_equivalence.md) i [remaining_differences.md](reports/remaining_differences.md).
- experiments/readback-2026/remaining-fuses.json — każdy pozostały różny fuse, region i wyjaśnienie; experiments/ise-readback-2026 — pełny final fit/VM6/NGC/NGD/JED/logs/configuration/diff.
- tests/readback-2026 — golden i fitted SAT, wektory, GHDL evidence. Dowód EV_OUT=EV_IN: tests/readback-2026-ev-proof.json.
- tools/jedtool, decode_xc2c128, compare_jed, compare_config.py — narzędzia porównań. Główny decoder: Project Combine; xc2bit XC2C128 ZIA table jest niekompletna, zachowano jego wynik jako untrusted.
- known_hdl/*.bundle — pełna historia upstream i publicznego forka; variants.json i reports/history.md — źródła/hashes/historyczne artefakty.

PDF ma 34 arkusze, CPLD na 10, gate circuit na 12. P64/Gate_STR1_o jest ENA input; P81/Gate_STR1_i jest CLK40 output. Luźna adnotacja CLK40 out przy P64 jest sprzeczna z połączeniami. Pełny pinout100: reports/pinout.md.

Polecenia/exit codes: experiments/commands.jsonl; logi: experiments/logs. Pierwsze discovery jest opisane osobno w docs/session_commands.md, bez udawania pełnego transcriptu. Plan testów fizycznych: docs/hardware_validation.md. Fizyczny security/DONE/USERCODE poza QF, readback reader/IDCODE/session log oraz analogowe zachowanie pozostają nieweryfikowane.

Eksperymenty dalszego dopasowania: [matching_experiments.md](reports/readback-2026/matching_experiments.md). Pozostałe 346 fuse są wyłącznie w PLA AND/OR FB1/FB2; ZIA i wszystkie pola MC są już zgodne. Analiza permutacji terms: `experiments/ise-readback-2026/pt-allocation.json`.

Próby dyrektyw: [directive_placement.md](reports/readback-2026/directive_placement.md).

## Wymuszona implementacja

Dodatkowy backend VM6 daje **0/55341 fuse różnic**: [raport](reports/implementation_lock.md). Plik: `recovered/amplcpld_implementation_locked.jed`. `make reproduce` wykonuje również ten krok; `make implementation-locked` wykonuje native build i lock. Native fitter bez tego kroku nadal daje 346 różnic. Template `recovered/amplcpld.ptlock.json` zawiera alokację i równoważne równania PLA odczytane z golden; nie jest to samo UCF ani dowód odzyskania historycznego źródła.

## Instalacja i konfiguracja krok po kroku

Pełna instrukcja: **[docs/reproduce_step_by_step.pl.md](docs/reproduce_step_by_step.pl.md)**. Obejmuje Ubuntu 24.04, Rust, przypięte decodery, lokalne GHDL/Python, instalację lub podłączenie ISE 14.7, compatibility libraries, konfigurację prefixów, build i niezależne sprawdzenie finalnych fuse. Zawiera również ograniczenia testów instalatora i rozwiązywanie napotkanych problemów.

## Co rzeczywiście znaleziono w firmware

Poniższy opis dotyczy `pm_cpld_gold_2026.jed` o SHA256 `1748e3c4f0f6152bd395d0a88df1e3a2214ec31fe0e704e11e77b854556f3d95`. Nazwy wewnętrzne są nazwami odzyskanego modelu, nie dowodem oryginalnego nazewnictwa. Funkcje, tryby FF i przypisanie zasobów pochodzą z fuse/dekodowania oraz porównań SAT. Nazwy „kalibracja” i „inhibit” opisują zaobserwowane działanie i historyczny kontekst; nie zastępują fizycznego testu zastosowania.

### 1. Dzielnik i polaryzacje zegarów

Dwubitowy `CNT` zwiększa się na **opadającym** zboczu `CLK80`. `CLK40=CNT(0)`, `CLK20_P=CNT(1)`. Zatem przy okresowym wejściu są to podziały przez 2 i 4. Jeżeli wejściowy zegar rzeczywiście ma 80 MHz, odpowiadają 40 i 20 MHz; nazwa sygnału nie jest pomiarem częstotliwości płytki.

`CLK20_N` jest osobnym rejestrem, również na opadającym CLK80, z wejściem `not(CNT(1) xor CNT(0))` obliczanym ze **starego** stanu licznika. Dla wykazanego stanu początkowego jego wyjście po krawędzi jest komplementarne do nowego `CNT(1)`. Czytelny HDL zachowuje rzeczywisty rejestr zamiast zastępować go samym inwerterem wyjściowym. Nie znaleziono aktywnego global clock divider/delay: włączony jest GCK2/FCLK2, pozostałe global clocks są wyłączone.

### 2. STR zależny od ENA — tor pomiarowy

Na opadającym `STR` rejestr `str_div` przełącza się tylko przy `ENA=1`. Następnie:

1. `str1` próbkuje `str_div` na opadającym CLK80, gdy stary `CNT(0)=0`.
2. `str2` próbkuje `str1` na narastającym CLK80.
3. Na narastającym CLK80 `dly(0)` rejestruje `str1 xor str2`; bity `dly(1..6)` przesuwają ten impuls.

Jest to detekcja zmiany synchronizowanego stanu STR, z kwalifikacją ENA w pierwszym toggle. W kodzie procesy używają semantyki starego stanu FF na krawędzi; przepisanie na natychmiastowe aktualizacje zmieniłoby opóźnienie o cykle.

### 3. Drugi tor STR — niezależny od ENA

W golden istnieje dodatkowy `raw_str_toggle`, przełączany na każdym opadającym STR, również przy `ENA=0`. W historycznym HDL tego toru nie było.

- `raw_sync(0..2)` to trzy rejestry aktualizowane na narastającym CLK80.
- `raw_edge` rejestruje `raw_sync(1) xor raw_sync(2)`.
- `raw_stretch` przy `CNT(0)=0` przyjmuje OR starego `raw_edge` i bieżącego XOR synchronizatora; w pozostałych fazach trzyma stan.
- Cztery bity `inhibit_pipe` przesuwają `raw_stretch` tylko przy `CNT(0)=0`.

Dopóki `inhibit_pipe` nie jest całe zerowe, timer nie może wykonać restartu kalibracji. ENA blokuje tor pomiarowy, ale nie usuwa aktywności STR z tego mechanizmu. Trzy rejestry odtworzono z konfiguracji; nie wykonano analizy metastability/MTBF na fizycznym układzie.

### 4. Timer 10-bitowy i restart

`c_count` jest **10-bitowym licznikiem saturującym**: rośnie tylko przy starym `CNT="11"` i zatrzymuje się na 1023. Oryginalny historyczny HDL miał 7 bitów, terminal 127 i inny warunek inkrementacji.

Restart wymaga jednocześnie:

```vhdl
CNT(0) = '1'
c_count = 1023
inhibit_pipe = "0000"
cal_phase = CNT(1)
```

Przy restarcie licznik przechodzi do 0, a `cal_phase` się przełącza. W recovered HDL licznik zapisano jako jawne toggles poszczególnych bitów, aby odtworzyć TFF w golden. Przy terminalnym stanie wszystkie bity są 1, więc przełączenie wszystkich ładuje 0. Dla zwykłej inkrementacji bit przełącza się, jeśli wszystkie niższe bity były 1.

Nie podajemy jednego „okresu kalibracji” wyłącznie z szerokości licznika: restart zależy także od fazy i całego inhibit pipeline. Zachowanie wynika z pokazanej relacji przejścia.

### 5. Impuls kalibracji, DV i zapis ADC

`cal_sample` ustawia się przy restarcie, a zeruje przy `CNT(0)=0`. Ostatnie dopasowanie źródła zapisuje clear tylko wtedy, gdy `cal_sample` było 1. Zewnętrzne zachowanie pozostaje identyczne, natomiast fitter odtwarza literal cover sygnału enable tego FF zgodny z golden.

Sygnał zapisu danych jest oddzielony od STR delay chain:

```vhdl
data_enable <= dly(6) or cal_sample;
```

Na narastającym CLK80:

- `DV` rejestruje `data_enable`;
- gdy stare `data_enable=1` i stare `CNT(1)=1`, `DOUT(11:0)` przyjmuje ADC0, a `DOUT(12)=0`;
- gdy `data_enable=1` i `CNT(1)=0`, przyjmuje ADC1, a `DOUT(12)=1`;
- przy `data_enable=0` DOUT trzyma poprzednie dane.

Historyczny kod wprowadzał kalibrację do początku łańcucha STR razem z XOR. Golden ma osobny `cal_sample` dołączony przy końcowym enable. Samego podobieństwa liczby stopni delay nie należy traktować jako zgodności tych mechanizmów.

### 6. Event-chain jest kombinacyjny

Golden zawiera **`EV_out <= EV`**, bez rejestru i bez uzależnienia od timera. Osobny SAT dowodzi tej relacji. Historyczny HDL synchronizował EV, sterował nim kalibracją i wystawiał EV_OUT przez rejestr.

Jest to potwierdzona różnica funkcjonalna względem historycznego źródła, nie kosmetyczna zmiana stylu VHDL. Kombinacyjne przekazanie ma fizyczny propagation delay; model Boolean go nie mierzy.

### 7. Rejestry i stany początkowe

W golden zidentyfikowano **49 użytych FF**:

| Grupa | Liczba FF |
|---|---:|
| CNT i osobny CLK20_N | 3 |
| str_div, str1, str2 | 3 |
| dly[6:0] i DV | 8 |
| DOUT[12:0] | 13 |
| raw_str_toggle, raw_sync[2:0], raw_edge, raw_stretch | 6 |
| inhibit_pipe[3:0] | 4 |
| c_count[9:0], cal_phase, cal_sample | 12 |
| **Razem** | **49** |

48 FF ma INIT=1; CLK20_N ma INIT=0. Dlatego m.in. CNT startuje od 3, timer od 1023, a DOUT od samych jedynek. Nie ma aktywnego asynchronicznego set/reset. Global GSR/GTS są wyłączone. Stan po włączeniu jest częścią konfiguracji, nie dopisanym założeniem testbencha.

Mapa każdego FF do FB/MC: [decoded/state_map.json](decoded/state_map.json). Przykłady: c_count9=FB1/MC7, cal_phase=FB1/MC8, cal_sample=FB2/MC16, raw_str_toggle=FB3/MC8. CLK80 używa GCK2 na pinie 27; STR jest pinem 63 i zegarem dwóch toggle FF. Inicjalizacja i event clocks są objęte porównaniem formalnym.

### 8. I/O i schemat

Schemat potwierdza target VQ100/-7; nowy JEDEC podaje `xc2c128-XXXXX`, więc sam nie potwierdza package ani speed grade. Szczegółowa tabela wszystkich pinów jest w [reports/pinout.md](reports/pinout.md).

- P64 `Gate_STR1_o` to wejście ENA; P81 `Gate_STR1_i` to wyjście CLK40. Luźna adnotacja CLK40 przy P64 jest sprzeczna z przewodami; sprzeczność została opisana, bez cichego odwrócenia pinów.
- CLK40/P81 ma **FAST slew**, podczas gdy poprzedni plik miał SLOW.
- EV/P60 ma wejście **SCHMITT**, poprzedni plik miał PLAIN.
- Oba banki mają HIGH selection dla input/output buffers; poprzedni plik miał LOW.
- 54 nieużywane pads mają programmed ground `IS_GND` i wyłączoną termination, zamiast poprzedniego keeper/output-disabled.
- Global clock divider i jego delay, DataGate oraz VREF są wyłączone.

HIGH/LOW w decoderze jest polem wyboru bufora, nie pomiarem napięcia. Schemat wskazuje VCCIO bank0=3.3 V i bank1=1.8 V. Konfigurację golden zachowano, a nie „naprawiono” według domysłu. Nie przypisujemy liczbowego analogowego opóźnienia do FAST/SLOW bez pomiaru/danych timingowych.

## Jak doszliśmy do identycznych fuse

| Etap | Różnica względem nowego golden |
|---|---:|
| Historyczny HDL + właściwy pinout + ISE 14.7 | 1412 fuse, także różne funkcje |
| Odzyskany HDL, placement i właściwe I/O, density fitter | 976 fuse |
| Speed fitter | 380 fuse |
| Jawny golden-style clear cal_sample | 346 fuse |
| Native VM6 + implementation lock + Xilinx hprep6 | **0 fuse, 0 canonical fields** |

Przy native 346 wszystkie MC/IOB fields, ZIA, init/clocks, placement i globals już są identyczne. Różnice pozostają w AND/OR FB1/FB2: kolejności physical PT rows i jednej alternatywnej postaci cover wejścia T najwyższego bitu timera. Testowane UCF KEEP/COLLAPSE/MAXPT/NOREDUCE nie pozwoliły wymusić exact row assignment; próba LOC pojedynczego PT została odrzucona.

`tools/lock_vm6_placement.py` wykorzystuje jawny `recovered/amplcpld.ptlock.json` pochodzący z golden. Template zawiera **alokację oraz literal cover równań**, nie tylko współrzędne placement. Backend sprawdza zgodność dotychczasowych konfiguracji i pozostałych sum covers, dowodzi SAT równoważności zmienianego wejścia T, przypisuje physical PLA rows i przekazuje rzeczywisty zmodyfikowany VM6 do vendor `hprep6`. To odtwarzalna blokada implementacji, nie odzyskanie bajtów oryginalnego źródła ani bit-identical wynik samego fittera.

Po tym kroku ponownie sprawdzamy całe JED: 55 341 fuse identycznych z golden, zero canonical field differences i 49/49 zgodnych transitions/init/clocks. Nie kopiujemy golden JED do output. Pliki pozostają rozdzielone:

- `amplcpld_recovered.jed`: native fitter, 346 różnic;
- `amplcpld_implementation_locked.jed`: wynik po jawnym lock, 0 różnic.

Dowody i zakres: [reports/implementation_lock.md](reports/implementation_lock.md), [reports/final_equivalence.md](reports/final_equivalence.md), [reports/readback-2026/directive_placement.md](reports/readback-2026/directive_placement.md).

## Co potwierdzono, a czego nie

Potwierdzono ochronę SHA256 oryginałów, poprawne JEDEC checksums, pełne QF, bezstratny decode→assemble, wszystkie 49 lokalnych relacji przejścia dla wszystkich Boolean states/inputs, init i clocks, symulację faktycznego recovered VHDL na 67 430 wektorach oraz bit identity końcowego locked JED. Modele next-state korzystają z raw AND/OR fuse i routingu Project Combine; native i locked JED były sprawdzane oddzielnie. Sam frontend VHDL nie ma osobnego formal proof; jego rzeczywisty skompilowany wynik ma SAT proof, a źródło ma symulację.

Nie potwierdzono fizycznych timingów, metastability, setup/hold przy krawędziach domen ani sprzętowego testu po programowaniu. Nie programowano CPLD. Identyczność dotyczy QF fuse, nie dat/nagłówków tekstowego kontenera ani security/DONE/USERCODE poza QF. Narzędzie/komenda/IDCODE sesji readback nadal nie są udokumentowane. `N VERSION P.20131013` w poprzednim pliku nie dowodzi kompilatora oryginalnego firmware; nowy odczyt nie zawiera tego record.
